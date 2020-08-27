package com.sbs.dan.at.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.dan.at.dao.ArticleDao;
import com.sbs.dan.at.dto.Article;
import com.sbs.dan.at.dto.Board;
import com.sbs.dan.at.util.Util;
@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private FileService fileService;
	
	public List<Article> getArticlesForList(int id) {
		List<Article> articles = articleDao.getArticlesForList(id);
		return articles;
	}

	public Board getBoardByCode(String boardCode) {
		return articleDao.getBoardByCode(boardCode);
	}

	public int write(Map<String, Object> newParam) {
		articleDao.write(newParam);
		int id = Util.getAsInt(newParam.get("id"));
		
		String fileIdsStr = (String) newParam.get("fileIdsStr");
		
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();
			
			if (fileIdsStr.startsWith(",")) {
				fileIdsStr = fileIdsStr.substring(1);
			}
		}
		
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();
			
			if (fileIdsStr.equals(",")) {
				fileIdsStr = "";
			}
		}
		
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim())).collect(Collectors.toList());
			
			for (int fileId : fileIds) {
				fileService.changeRelId(fileId,id);
			}
		}
		return id;
	}
}
