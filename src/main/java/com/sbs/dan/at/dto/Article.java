package com.sbs.dan.at.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Article {
	private int id;
	private int boardId;
	private int memberId;
	private String regDate;
	private String updateDate;
	private String delDate;
	private int delStatus;
	private int displayStatus;
	private String title;
	private String body;
}