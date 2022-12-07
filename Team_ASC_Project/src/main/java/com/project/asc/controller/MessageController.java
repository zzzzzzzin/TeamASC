package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.MessageService;
import com.project.asc.service.UserService;
import com.project.asc.vo.MessageVO;
import com.project.asc.vo.PageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.UserVO;

@ResponseBody
@RequestMapping("/message")
@Controller("messageController")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	/* 메세지 검색 */
//	@RequestMapping(value = "/searchMessage", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView searchMessage(@ModelAttribute("info") MessageVO message, HttpServletRequest request,HttpServletResponse response) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		
//		UserVO user = (UserVO) request.getSession().getAttribute("member");
//		int userSeq = user.getUserSeq();
//		
//		int toUserSeq = Integer.parseInt(request.getParameter("toUserSeq"));
//		String keyword = request.getParameter("keyword");
//		message.setToUserSeq(toUserSeq);
//		message.setKeyword(keyword);
//		
//		String viewName = "/message/messageList";
//		
//		int viewRows = 5;
//		
//		String nowPageNum = request.getParameter("pageNum");
//		
//		int pageNum = 1;
//		if(nowPageNum != null) {
//			pageNum = Integer.parseInt(nowPageNum);
//			viewName = "/message/messageList";
//		}
//		
//		int startRowNum = (pageNum-1) * viewRows;
//		
//		message.setStartRowNum(startRowNum);
//		message.setViewRows(viewRows);
//		
//		String messageNum = request.getParameter("totalMessageNum");
//		
//		int totalMessageNum = messageService.searchMessageNum(message);
//		if(totalMessageNum == 0) {
//			String nowTotalMessageNum = request.getParameter("totalMessageNum");
//			if(nowTotalMessageNum != null) {
//				totalMessageNum = Integer.parseInt(nowTotalMessageNum);
//			}
//		}
//		
//		int totalPageNum = 0;
//		if(totalMessageNum % viewRows == 0) {
//			totalPageNum = (int)Math.ceil(totalMessageNum / viewRows);
//		} else {
//			totalPageNum = (int)Math.ceil(totalMessageNum / viewRows) + 1;
//		}
//		
//		PageVO page = new PageVO();
//		
//		page.setPageNum(pageNum);
//		page.setStartRowNum(startRowNum);
//		page.setTotalBoardNum(totalMessageNum);
//		page.setTotalPageNum(totalPageNum);
//		
//		mav.addObject("page", page);
//		
//		request.getSession().setAttribute("masageNum", totalMessageNum);
//		
//		int[] pageRange = new int [totalPageNum];
//		
//		for(int i=0; i>totalPageNum; i++) {
//			pageRange[i] = i + 1;
//		}
//		mav.addObject("pageRange", pageRange);
//		
//		ArrayList<MessageVO> list = messageService.searchMessage(message);
//		
//		mav.addObject("message", message);
//		mav.addObject("list", list);
//		
//		mav.setViewName(viewName);
//		
//		return mav;
//	}

	/* 메세지 보관함 + 페이징 */
	@RequestMapping(value="/messageList",method=RequestMethod.GET)
	public ModelAndView viewMessageList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = "/message/messageList";
		
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		
		int userSeq = user.getUserSeq();
		
		int viewRows = 5;
		
		String nowPageNum = request.getParameter("pageNum");
		int pageNum = Integer.parseInt(nowPageNum);
		
		int startRowNum = (pageNum-1) * viewRows;
		
		int totalMessageNum = messageService.totalMessageNum(userSeq);
		
		int totalPageNum = 0;
		if(totalMessageNum % viewRows == 0) {
			totalPageNum = (int)Math.ceil(totalMessageNum / viewRows);
		} else {
			totalPageNum = (int)Math.ceil(totalMessageNum / viewRows) + 1;
		}
		
		PageVO page = new PageVO();
		
		page.setPageNum(pageNum);
		page.setStartRowNum(startRowNum);
		page.setTotalBoardNum(totalMessageNum);
		page.setTotalPageNum(totalPageNum);
		
		mav.addObject("page", page);
		
		int[] pageRange = new int [totalPageNum];
		
		for(int i=0; i>totalPageNum; i++) {
			pageRange[i] = i + 1;
		}
		mav.addObject("pageRange", pageRange);
		
		ArrayList<MessageVO> list = messageService.selectMessageList(user.getUserSeq(), startRowNum, viewRows);
		
		mav.addObject("list", list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 메세지 읽기 */
	@RequestMapping(value="/readMessage",method=RequestMethod.GET)
	public ModelAndView readMessage(@RequestParam("messageSeq") String messageSeq,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = "/message/readMessage";
		
		MessageVO message = messageService.selectMessageOne(Integer.parseInt(messageSeq));
		
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		
		// 안 읽은 메세지 유무 확인
		if(messageService.unReadingMessage(user.getUserSeq())) {
			user.setUnReadingMessageYn("Y");
		} else {
			user.setUnReadingMessageYn("N");
		}

		if (user != null) {
			request.getSession().setAttribute("member", user);
		} 
		
		request.getSession().setAttribute("message", message);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 초대 메세지 확인 */
	@RequestMapping(value="/inviteProjectConfirm",method=RequestMethod.GET)
	public ModelAndView inviteProjectConfirm(@RequestParam("messageSeq") String messageSeq,@RequestParam("teamId") String teamId,
			@RequestParam("toUserSeq") String toUserSeq,@RequestParam("fromUserSeq") String fromUserSeq,@RequestParam("toUserName") String toUserName,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/message/messageList?pageNum=1";
		
		MessageVO message = new MessageVO();
		message.setMessageSeq(Integer.parseInt(messageSeq));
		message.setTeamId(teamId);
		message.setFromUserSeq(Integer.parseInt(toUserSeq));
		message.setToUserSeq(Integer.parseInt(fromUserSeq));
		message.setTitle("프로젝트 초대 확인");
		message.setContent(toUserName + "님이 프로젝트 초대를 확인했습니다");
		message.setMessageType("normal");
		
		messageService.inviteProjectConfirm(message);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 초대 메세지 거절 */
	@RequestMapping(value="/inviteProjectReject",method=RequestMethod.GET)
	public ModelAndView inviteProjectReject(@RequestParam("messageSeq") String messageSeq,@RequestParam("teamId") String teamId,
			@RequestParam("toUserSeq") String toUserSeq,@RequestParam("fromUserSeq") String fromUserSeq,@RequestParam("toUserName") String toUserName,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/message/messageList?pageNum=1";
		
		MessageVO message = new MessageVO();
		message.setMessageSeq(Integer.parseInt(messageSeq));
		message.setTeamId(teamId);
		message.setFromUserSeq(Integer.parseInt(toUserSeq));
		message.setToUserSeq(Integer.parseInt(fromUserSeq));
		message.setTitle("프로젝트 초대 거절");
		message.setContent(toUserName + "님이 프로젝트 거절를 확인했습니다");
		message.setMessageType("normal");
		
		messageService.inviteProjectReject(message);
		
		mav.setViewName(viewName);
		
		return mav;
	}
}
