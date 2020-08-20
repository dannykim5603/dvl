package com.sbs.dan.at.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.dan.at.dto.Member;
import com.sbs.dan.at.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "/member/join";
	}

	@RequestMapping("/usr/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		System.out.println("loginId : " + param.get("loginId"));
		System.out.println("loginPw : " + param.get("loginPwReal"));
//		boolean check = memberService.checkIsJoinableId(param); //가능하면 true 이미 있는 아이디면 false
		System.out.println(param);
		int newMemberId = memberService.doJoin(param);
		return "redirect:/usr/home/main";
	}

	@RequestMapping("/usr/member/login")
	public String login() {
		return "/member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	public String doLogin(String loginId, String loginPwReal, String redirectUri, Model model, HttpSession session) {
		String loginPw = loginPwReal;
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			model.addAttribute("historyBack",true);
			model.addAttribute("alertMsg","존재하지 않는 회원입니다.");
			return "common/redirect";
		}
		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack",true);
			model.addAttribute("alertMsg","비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}
		session.setAttribute("loginedMemberId",member.getId());
		
		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}
		model.addAttribute("redirectUri",redirectUri);
		model.addAttribute("alertMsg",String.format("%s님 반갑습니다.", member.getNickname()));
		
		return "/home/main";
	}
	
	@RequestMapping("/usr/member/doLogout")
	public String doLogout(HttpSession session, Model model, String redirectUri) {
		session.removeAttribute("loginedMemberId");
		
		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}
		model.addAttribute("redirectUri",redirectUri);
		
		return "/home/main";
	}
	
	@RequestMapping("/usr/member/modify")
	public String modify(HttpSession session, Model model, String redirectUri) {
		Member member = memberService.getMemberById((int)session.getAttribute("loginedMemberId"));
		model.addAttribute("member", member);
		
		return "/member/modify";
	}
	
	@RequestMapping("/usr/member/doModify")
	public String doModify() {
		
		return "";
	}
}