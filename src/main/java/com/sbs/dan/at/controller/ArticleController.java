package com.sbs.dan.at.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.dan.at.dto.Article;
import com.sbs.dan.at.dto.Board;
import com.sbs.dan.at.dto.Member;
import com.sbs.dan.at.service.ArticleService;
import com.sbs.dan.at.util.Util;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/usr/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board",board);
		
		List<Article> articles = articleService.getArticlesForList(board.getId());
		model.addAttribute("articles",articles);

		return "article/list";
	}
	
	@RequestMapping("/usr/article/{boardCode}-write")
	public String write(@PathVariable("boardCode") String boardCode, Model model, String listUrl) {
		
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}
		
		model.addAttribute("listUrl", listUrl);
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board",board);
		
		return "article/write";
	}
	
	@RequestMapping("/usr/article/{boardCode}-doWrite")
	public String doWrite(@RequestParam Map<String,Object> param, HttpServletRequest req, @PathVariable("boardCode") String boardCode, Model model) {

		Board board = articleService.getBoardByCode(boardCode);
		
		model.addAttribute("board",board);
		
		Map<String, Object> newParam = Util.getNewMapOf(param, "title", "body");
		
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		newParam.put("boardId", board.getId());
		newParam.put("memberId", loginedMemberId);
		
		int newArticleId = articleService.write(newParam);
		
		String redirectUri = (String) param.get("redirectUri");
		redirectUri = redirectUri.replace("#id", newArticleId + "");
		redirectUri = redirectUri.replace("#boardCode", board.getCode());
		return "redirect:" + redirectUri;
	}
	
	@RequestMapping("/usr/article/{boardCode}-detail")
	public String detail(Model model, @RequestParam Map<String,Object> param, HttpServletRequest req, @PathVariable("boardCode") String boardCode, String listUrl) {
		
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}
		
		model.addAttribute("listUrl", listUrl);
		
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board",board);
		
		int id = Integer.parseInt((String) param.get("id"));
		Member loginedMember = (Member) req.getAttribute("loginedMember");
		Article article = articleService.getArticleForPrintById(loginedMember,id);
		model.addAttribute("article",article);
		
		return "article/detail";
	}
	
	@RequestMapping("/usr/article/{boardCode}-delete")
	public String delete(@PathVariable("boardCode") String boardCode, Model model, HttpServletRequest req, @RequestParam Map<String,Object> param) {
		int id = Integer.parseInt((String)param.get("id"));
		
		articleService.delete(id);
		return "";
	}
	
	
}