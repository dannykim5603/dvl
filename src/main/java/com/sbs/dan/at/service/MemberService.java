package com.sbs.dan.at.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.dan.at.dao.MemberDao;
import com.sbs.dan.at.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public int doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
		int id = (int) param.get("id");
		System.out.println("==== id ====" + id);
		return id;
	}

	public String doLogin() {
		return "";
	}

	public Member getMemberByLoginId(String loginId) {
		
		return memberDao.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int loginedMemberId) {
		return memberDao.getMemberById(loginedMemberId);
	}
}