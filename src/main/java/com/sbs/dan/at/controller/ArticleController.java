package com.sbs.dan.at.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbs.dan.at.dto.Article;
import com.sbs.dan.at.dto.Board;
import com.sbs.dan.at.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		List<Article> articles = articleService.getArticlesForList();
		Board board = articleService.getBoardByCode(boardCode);
		
		model.addAttribute("board",board);
		model.addAttribute("articles",articles);
		
		return "article/list";
	}

}