package com.sbs.dan.at.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.dan.at.dao.ArticleDao;
import com.sbs.dan.at.dto.Article;
import com.sbs.dan.at.dto.Board;
import com.sbs.dan.at.dto.File;
import com.sbs.dan.at.dto.Member;
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
		
		System.out.println("id는?? " + id);
		
		String fileIdsStr = (String) newParam.get("fileIdsStr");
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();
			System.out.println("================================1");
			if (fileIdsStr.startsWith(",")) {
				fileIdsStr = fileIdsStr.substring(1);
				System.out.println("================================2");
			}
		}
		
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();
			System.out.println("================================3");
			if (fileIdsStr.equals(",")) {
				fileIdsStr = "";
				System.out.println("================================4");
			}
		}
		
		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim())).collect(Collectors.toList());
			
			for (int fileId : fileIds) {
				fileService.changeRelId(fileId,id);
				System.out.println("=======================5");
			}
		}
		return id;
	}

	public Article getArticleForPrintById(Member loginedMember, int id) {
		Article article = articleDao.getArticleForPrintById(loginedMember,id);
		
		updateForPrintInfo(loginedMember,article);
		
		List<File> files = fileService.getFiles("article",article.getId(),"common","attachment");
		
		Map<String, File> filesMap = new HashMap<>();
		
		for (File file : files) {
			filesMap.put(file.getFileNo() + "",file);
		}
	
		Util.putExtraVal(article, "file__common__attachment", filesMap);
		
		return article;
	}

	private void updateForPrintInfo(Member loginedMember, Article article) {
		Util.putExtraVal(article, "actorCanDelete", actorCanDelete(loginedMember, article));
		Util.putExtraVal(article, "actorCanModify", actorCanModify(loginedMember, article));		
	}

	private Object actorCanDelete(Member loginedMember, Article article) {
		return actorCanModify(loginedMember, article);
	}

	private Object actorCanModify(Member loginedMember, Article article) {
		return loginedMember != null && loginedMember.getId() == article.getMemberId() ? true : false;
	}

	public void delete(int id) {
		articleDao.delete(id);
	}

	public void hit(int id) {
		articleDao.hit(id);
	}

	public void report(int id) {
		articleDao.report(id);
	}

	public List<Article> getReportedArticles() {
		return articleDao.getReportedArticles();
	}

	public void like(int id) {
		articleDao.like(id);
	}
}