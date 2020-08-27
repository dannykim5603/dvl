package com.sbs.dan.at.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dan.at.dto.Article;
import com.sbs.dan.at.dto.Board;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesForList(int id);

	Board getBoardByCode(String boardCode);

	void write(Map<String, Object> newParam);

}
