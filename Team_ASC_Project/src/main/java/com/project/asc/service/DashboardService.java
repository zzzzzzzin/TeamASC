package com.project.asc.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tiles.renderer.impl.TemplateAttributeRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.DashboardDAO;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;
import com.project.asc.vo.ProjectVO;

@Service("dashboardService")
public class DashboardService {

	@Autowired
	private DashboardDAO dashboardDAO;

	public ArrayList<BoardVO> selectErrorBoard(String projectSeq) {
		ArrayList<BoardVO> list = null;
		try {
			list = dashboardDAO.selectErrorBoard(projectSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<DocumentsVO> productList(String projectSeq) {
		ArrayList<DocumentsVO> dash = null;
		dash = dashboardDAO.selectAllDocuments(projectSeq);
		
		return dash;
	}

	public double calculateAllProgressRate(String projectSeq) {
		// TODO Auto-generated method stub
		double progressRate = 0;
		try {
			progressRate = dashboardDAO.calculateAllProgressRate(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return progressRate;
	}

	public int countCompleteFunction(String projectSeq) {
		// TODO Auto-generated method stub
		int completeFunction =0;
		try {
			completeFunction = dashboardDAO.countCompleteFunction(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return completeFunction;
	}

	public int countFunction(String projectSeq) {
		// TODO Auto-generated method stub
		int countFunction = 0;
		try {
			countFunction = dashboardDAO.countFunction(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return countFunction;
	}

	public ArrayList<BoardVO> selectTeamMember(String projectSeq) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> teamMemberList = null;
		try {
			teamMemberList = dashboardDAO.selectTeamMember(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teamMemberList;
	}

	public double calculateProgressRate(int teamUserSeq, String projectSeq) {
		// TODO Auto-generated method stub
		double memberProgressRate = 0;
		try {
			memberProgressRate = dashboardDAO.calculateProgressRate(teamUserSeq, projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberProgressRate;
	}

	public int countMemberFunction(int teamUserSeq, String projectSeq) {
		// TODO Auto-generated method stub
		int memberFunction = 0;
		try {
			memberFunction = dashboardDAO.countMemberFunction(teamUserSeq,projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberFunction;
	}

	public int countMemberCompleteFunction(int teamUserSeq, String projectSeq) {
		// TODO Auto-generated method stub
		int memberCompleteFunction = dashboardDAO.countMemberCompleteFunction(teamUserSeq,projectSeq);
		return memberCompleteFunction;
	}

	public ArrayList<BoardVO> selectMemberTask(String projectSeq, int teamUserSeq) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> memberTask = null;
		try {
			memberTask = dashboardDAO.selectMemberTask(projectSeq, teamUserSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberTask;
	}

	public int countError(String projectSeq) {
		// TODO Auto-generated method stub
		int countError = dashboardDAO.countError(projectSeq);
		return countError;
	}
	
	public int countIssue(String projectSeq) {
		// TODO Auto-generated method stub
		int countIssue = dashboardDAO.countIssue(projectSeq);
		return countIssue;
	}

	public int countDelayTask(String projectSeq) {
		// TODO Auto-generated method stub
		int delayTask = 0;
		try {
			delayTask = dashboardDAO.countDelayTask(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return delayTask;
	}

	public String calculateDDay(String projectSeq) {
		// TODO Auto-generated method stub
		String dDay = dashboardDAO.calculateDDay(projectSeq);
		return dDay;
	}
	

}
