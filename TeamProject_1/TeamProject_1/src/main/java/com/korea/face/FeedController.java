package com.korea.face;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FeedDAO;
import util.MyCommon;
import vo.FeedVO;

public class FeedController {
	FeedDAO feed_dao;
	public void setFeed_dao(FeedDAO feed_dao) {
		this.feed_dao = feed_dao;
	}
	
	@RequestMapping("main_form.do")
	public String list(Model model){
		List<FeedVO> list = feed_dao.selectList();
		model.addAttribute("list",list);
		return MyCommon.VIEW_PATH + "main_form.jsp";
	}
}
