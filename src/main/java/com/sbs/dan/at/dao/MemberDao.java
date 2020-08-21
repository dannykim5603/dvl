package com.sbs.dan.at.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dan.at.dto.Member;

@Mapper
public interface MemberDao {

	void doJoin(Map<String, Object> param);

	Member getMemberByLoginId(String loginId);

	Member getMemberById(int loginedMemberId);

	void modify(Map<String, Object> newParam);

	String findId(Map<String, Object> newParam);
}