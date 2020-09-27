package com.sbs.dan.at.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sbs.dan.at.dao.MemberDao;
import com.sbs.dan.at.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Value("${custom.siteName}")
	private String siteName;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;

	public void doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
		String email = (String)param.get("email");
		sendWelcomeMail(email);
	}
	
	public void sendWelcomeMail(String email) {
		String title = String.format("[%s] 회원이 되신것을 환영합니다.",siteName);
		StringBuilder body = new StringBuilder();
		
		body.append("<h1> 가입이 완료되었습니다. </h1>");
		body.append(String.format("<p><a href=\"%s\" target=\"_blank\">%s</a>(으)로 이동</p>",siteMainUri,siteName));
		
		mailService.send(email, title, body.toString());
	}

	public Member getMemberByLoginId(String loginId) {
		
		return memberDao.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int loginedMemberId) {
		return memberDao.getMemberById(loginedMemberId);
	}

	public void modify(Map<String, Object> newParam) {
		memberDao.modify(newParam);
	}

	public String findId(Map<String, Object> newParam) {
		int id = Integer.parseInt(memberDao.findId(newParam));
		Member member = getMemberById(id);
		String loginId = member.getLoginId();
		return loginId;
	}

	public void deleteAccount(Member member) {
		memberDao.deleteAccount(member);
	}

	public List<Member> getMembersToManage() {
		return memberDao.getMembersToManage();
	}

	public String findPw(Map<String, Object> newParam) {
		return memberDao.findPw(newParam);
	}

	public Member getMemberByNameLoginId(Map<String, Object> newParam) {
		return getMemberByNameLoginId(newParam);
	}
	
}