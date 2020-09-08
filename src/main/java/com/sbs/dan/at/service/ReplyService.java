package com.sbs.dan.at.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.dan.at.dao.ReplyDao;
import com.sbs.dan.at.dto.File;
import com.sbs.dan.at.dto.Member;
import com.sbs.dan.at.dto.Reply;
import com.sbs.dan.at.dto.ResultData;
import com.sbs.dan.at.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private FileService fileService;

	public List<Reply> getForPrintReplies(@RequestParam Map<String, Object> param) {
		List<Reply> replies = replyDao.getForPrintReplies(param);

		List<Integer> replyIds = replies.stream().map(reply -> reply.getId()).collect(Collectors.toList());
		if (replyIds.size() > 0) {
			Map<Integer, Map<Integer, File>> filesMap = fileService.getFilesMapKeyRelIdAndFileNo("reply", replyIds,
					"common", "attachment");

			for (Reply reply : replies) {
				Map<Integer, File> filesMap2 = filesMap.get(reply.getId());

				if (filesMap2 != null) {
					reply.getExtra().put("file__common__attachment", filesMap2);
				}
			}
		}

		Member actor = (Member) param.get("actor");

		for (Reply reply : replies) {
			updateForPrintInfo(actor, reply);
		}

		return replies;
	}

	private void updateForPrintInfo(Member actor, Reply reply) {
		reply.getExtra().put("actorCanDelete", actorCanDelete(actor, reply));
		reply.getExtra().put("actorCanModify", actorCanModify(actor, reply));
	}

	public boolean actorCanModify(Member actor, Reply reply) {
		return actor != null && actor.getId() == reply.getMemberId() ? true : false;
	}

	public boolean actorCanDelete(Member actor, Reply reply) {
		return actorCanModify(actor, reply);
	}

	public int writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
		int id = Util.getAsInt(param.get("id"));

		String fileIdsStr = (String) param.get("fileIdsStr");

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim()))
					.collect(Collectors.toList());

			for (int fileId : fileIds) {
				fileService.changeRelId(fileId, id);
			}
		}

		return id;
	}

	public void deleteReply(int id) {
		replyDao.deleteReply(id);
		fileService.deleteFiles("reply", id);
	}

	public Reply getForPrintReplyById(int id) {
		Reply reply = replyDao.getForPrintReplyById(id);

		Map<Integer, File> filesMap = fileService.getFilesMapKeyFileNo("reply", id, "common", "attachment");
		Util.putExtraVal(reply, "file__common__attachment", filesMap);

		return reply;
	}

	public ResultData modfiyReply(Map<String, Object> param) {
		replyDao.modifyReply(param);
		int id = Util.getAsInt(param.get("id"));

		String fileIdsStr = (String) param.get("fileIdsStr");

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim()))
					.collect(Collectors.toList());

			for (int fileId : fileIds) {
				fileService.changeRelId(fileId, id);
			}
		}
		
		Reply reply = getForPrintReplyById(id);
		
		param.put("file__common__attachment", reply.getExtra().get("file__common__attachment"));

		return new ResultData("S-1", String.format("%d번 댓글을 수정하였습니다.", Util.getAsInt(param.get("id"))), param);
	}
}
