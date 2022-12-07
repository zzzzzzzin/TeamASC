package com.project.asc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.DashboardService;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;
import com.project.asc.vo.ProjectVO;


@Controller("dashboardController")
@RequestMapping("/dashboard")
public class DashboardController {
	@Autowired
	private DashboardService dashboardService;
	
	/* 대시보드 페이지로 이동 및 조회 */
	@RequestMapping(value="/viewDashboard", method=RequestMethod.GET)
	public ModelAndView dashboard(@RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewDashboard";
		
		/* 이슈리스트 조회 */
		ArrayList<BoardVO> errorList = dashboardService.selectErrorBoard(projectSeq);
		mav.addObject("errorList", errorList);
		
		/* 전체 진척률 조회 */
		double progressRate = dashboardService.calculateAllProgressRate(projectSeq);
		double roundOff = Math.round(progressRate * 100.0) / 100.0;
		mav.addObject("progressRate", roundOff);
		
		/* 기능 수 조회 */
		int countFunction = dashboardService.countFunction(projectSeq);
		int completeFunction = dashboardService.countCompleteFunction(projectSeq);
		mav.addObject("countFunction", countFunction);
		mav.addObject("completeFunction", completeFunction);
		
		/* 팀원별 진척률, 기능수 조회 */
		ArrayList<BoardVO> teamMemberList = dashboardService.selectTeamMember(projectSeq);
		mav.addObject("teamMemberList", teamMemberList);//teamMember id,userSeq,teamId,projectSeq,name
		
		double[] memberProgressRate = new double[teamMemberList.size()];
		int[] memberFunction = new int[teamMemberList.size()];
		int[] memberCompleteFunction = new int[teamMemberList.size()];
		double[] memberFunctionRate = new double[teamMemberList.size()];
		int[] page = new int[teamMemberList.size()];
			/* 팀원별 오늘의 할 일 */
			String[] memberTask = new String[teamMemberList.size()];
			String[] memberName = new String[teamMemberList.size()];
		for(int i=0; i<teamMemberList.size();i++) {
			page[i] = i;
			int teamUserSeq = teamMemberList.get(i).getUserSeq();
			double temp = dashboardService.calculateProgressRate(teamUserSeq,projectSeq);
			double temp1 = Math.round(temp * 100.0) / 100.0;
			memberProgressRate[i] = temp1;
			
			int temp2 = dashboardService.countMemberFunction(teamUserSeq,projectSeq);
			memberFunction[i] = temp2;
			
			int temp3 = dashboardService.countMemberCompleteFunction(teamUserSeq,projectSeq);
			memberCompleteFunction[i] = temp3;
			double temp4 = 0;
			if(temp3 != 0) {
				temp4 = Math.round(((temp3/(temp2*1.0))*100.0))/100.0;
				memberFunctionRate[i] = temp4*100;
				
			} else {
				memberFunctionRate[i] = 0;
			}
			System.out.println("temp4 = "+temp4);
			ArrayList<BoardVO> temp5 = dashboardService.selectMemberTask(projectSeq, teamUserSeq);
			String str = "";
				if(!temp5.isEmpty()) {
					for(int j=0;j<temp5.size();j++) {
						str = str + (j==0 ? "- "+temp5.get(j).getOperation() : "<br> - "+temp5.get(j).getOperation());
					}
				} else {
					str = "없음";
				}
				memberTask[i] = str;
			String temp6 = teamMemberList.get(i).getName();
			memberName[i] = temp6;
		}
		mav.addObject("memberProgressRate", memberProgressRate);//멤버별 진행률
		mav.addObject("memberFunction", memberFunction);//멤버별 맡은 기능수
		mav.addObject("memberCompleteFunction", memberCompleteFunction);//멤버별 완성 기능수
		mav.addObject("memberFunctionRate", memberFunctionRate);//멤버별 완성된 기능 비율
		mav.addObject("memberTask", memberTask);//멤버별 오늘의 일정
		mav.addObject("memberName", memberName);//멤버이름
		mav.addObject("page", page);
		
		/* 진행중인 에러수,논의수 */
		int countError =  dashboardService.countError(projectSeq);
		int countIssue =  dashboardService.countIssue(projectSeq);
		mav.addObject("countError", countError);
		mav.addObject("countIssue", countIssue);
		
		/* 딜레이된 일정 수 */
		int delayTask = dashboardService.countDelayTask(projectSeq);
		mav.addObject("delayTask", delayTask);
		
		/* 디데이 계산 */
		String dDay = dashboardService.calculateDDay(projectSeq);
		mav.addObject("dDay", dDay);
		
		

		mav.setViewName(viewName);
		return mav;
	}
	
}
