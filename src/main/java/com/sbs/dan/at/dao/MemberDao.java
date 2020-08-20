package com.sbs.dan.at.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dan.at.dto.Member;

@Mapper
public interface MemberDao {

	void doJoin(Map<String, Object> param);

	Member getMemberByLoginId(String loginId);

	Member getMemberById(int loginedMemberId);
}