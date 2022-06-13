package com.korea.face;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.FaceDAO;
import util.MyCommon;
import vo.FaceVO;

@Controller
public class FaceController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	FaceDAO face_dao;
	
	public void setFace_dao(FaceDAO face_dao) {
		this.face_dao = face_dao;
	}
	
	//로그인 화면
	@RequestMapping(value = {"/", "login.do"})
	public String login_form() {
		return MyCommon.VIEW_PATH + "login_form.jsp";
	}
	//회원가입 화면
	@RequestMapping("insert_form.do")
	public String insert_form() {
		return MyCommon.VIEW_PATH + "insert_form.jsp";
	}
	//회원가입
	@RequestMapping("insert.do")
	public String insert(FaceVO vo) {
		int res = face_dao.insert(vo);
		return "redirect:login.do";
	}
	//아이디 중복체크
	@RequestMapping("id_check.do")
	@ResponseBody
	public String selectone(String id) {
		FaceVO vo = face_dao.id_check(id);
		
		String idcheck = "no"; 
		if(vo == null) {
			idcheck = "yes";
		}
		
		String result = String.format("[{'result':'%s'}]", idcheck);
		return result;
	}
	
	@RequestMapping("login_check.do")
	@ResponseBody
	public String selectone(String id, String pwd) {
		FaceVO vo = face_dao.id_check(id);
		
		String param = "";
		String str = "";
		
		if(vo == null) {
			param = "no_id";
			str = String.format("[{'result':'%s'}]", param);
			return str;
		}
		
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			str = String.format("[{'result':'%s'}]", param);
			return str;
		}
		
		//세션에 바인딩
		session.setAttribute("vo", vo);
		//로그인 유지 시간(1시간)
		//session.setMaxInactiveInterval(60 * 60);
		
		param = "clear";
		str = String.format("[{'result':'%s'}]", param);
		return str;
	}
	
	//로그인을 했을 때
	@RequestMapping("main_form.do")
	public String main_form() {
		return MyCommon.VIEW_PATH + "main_form.jsp";
	}
	//로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("vo");
		/* session.invalidate(); */
		return "redirect:login.do";
	}
	
	//아이디비번 찾기 페이지
	@RequestMapping("find.do")
	public String find() {
		return MyCommon.VIEW_PATH + "find.jsp";
	}
	
	
	 @RequestMapping("find_id.do")
	 @ResponseBody
	 public String find_id(String name, String phone){
		 FaceVO vo = face_dao.find_id(name); 
		 String find = "";
		 String result = "";
		 
		 if(vo == null) {
			 find = "no_name";
			 result = String.format("[{'result':'%s'}]", find);
			 return result;
		 }else if(!vo.getPhone().equals(phone)) {
			 find = "no_phone";
			 result = String.format("[{'result':'%s'}]", find);
			 return result;
		 }
		 
		 System.out.println("result : " + result);
		 String id = vo.getId();
		 find = "clear";
		 result = String.format("[{'result':'%s','id':'%s'}]", find,id);
	
		 return result;
	 }
}















