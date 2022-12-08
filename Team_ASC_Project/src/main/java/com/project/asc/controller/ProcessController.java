package com.project.asc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.ProcessService;
import com.project.asc.vo.ProcessVO;
import com.project.asc.vo.ProjectVO;

@Controller("processController")
@RequestMapping("/process")
public class ProcessController {
	
	@Autowired
	private ProcessService processService;
	
	/* 프로젝트 관리 페이지 완료 */
	@RequestMapping(value="/projectFinish", method=RequestMethod.GET)
	public ModelAndView viewWriteBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/project/manageProject";

		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project"); 
		
		processService.projectFinish(project.getProjectSeq());
		
		ProcessVO process = processService.selectProcess(project.getProjectSeq());
		
		request.getSession().setAttribute("process", process);
		
		mav.setViewName(viewName);
		return mav;
	}
}
