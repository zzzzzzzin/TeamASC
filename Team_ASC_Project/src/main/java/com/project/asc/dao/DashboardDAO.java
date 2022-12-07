package com.project.asc.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;
import com.project.asc.vo.ProjectVO;

@Repository("dashboardDAO")
public class DashboardDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<BoardVO> selectErrorBoard(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub

		ArrayList<BoardVO> list = (ArrayList)sqlSession.selectList("mapper.board.selectBoardByProjectSeqForDashboard", projectSeq);
		return list;
	}

	public ArrayList<DocumentsVO> selectAllDocuments(String projectSeq) {
		ArrayList<DocumentsVO> dash = null;
		dash = (ArrayList)sqlSession.selectList("mapper.documents.selectDashboardList",projectSeq);
		for(DocumentsVO vo : dash) {
			System.out.println(vo);
		}
		return dash;
	}

	public double calculateAllProgressRate(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int count = sqlSession.selectOne("mapper.dashboard.countAllTask", projectSeq);
		double progressRate = 0;
		if(count != 0) {
			progressRate = sqlSession.selectOne("mapper.dashboard.calculateAllProgressRate", projectSeq);
		} else {
			progressRate = 0;
		}
		return progressRate;
	}

	public int countCompleteFunction(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int completeFunction = sqlSession.selectOne("mapper.dashboard.countCompleteFunction", projectSeq);
		return completeFunction;
	}

	public int countFunction(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int countFunction = sqlSession.selectOne("mapper.dashboard.countAllFunction", projectSeq);
		return countFunction;
	}

	public ArrayList<BoardVO> selectTeamMember(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> teamMemberList = (ArrayList)sqlSession.selectList("mapper.impl.selectTeamMember", projectSeq);
		System.out.println("teamMemberList = "+teamMemberList);
		return teamMemberList;
	}

	public double calculateProgressRate(int teamUserSeq, String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setUserSeq(teamUserSeq);
		int memberTask = sqlSession.selectOne("mapper.dashboard.countUserTask", board);
		double memberProgressRate = 0;
		if(memberTask != 0) {
			memberProgressRate = sqlSession.selectOne("mapper.dashboard.calculateUserProgressRate", board);
		} else {
			memberProgressRate = 0;
		}
		return memberProgressRate;
	}

	public int countMemberFunction(int teamUserSeq, String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setUserSeq(teamUserSeq);
		int memberFunction = sqlSession.selectOne("mapper.dashboard.countUserAllFunction", board);
		System.out.println("memberFunction = "+memberFunction);
		return memberFunction;
	}

	public int countMemberCompleteFunction(int teamUserSeq, String projectSeq) {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setUserSeq(teamUserSeq);
		int memberCompleteFunction = sqlSession.selectOne("mapper.dashboard.countUserCompleteFunction",board);
		System.out.println("memberCompleteFunction = "+memberCompleteFunction);
		return memberCompleteFunction;
	}

	public ArrayList<BoardVO> selectMemberTask(String projectSeq, int teamUserSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setUserSeq(teamUserSeq);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String boardTitle = sdf.format(date);
		board.setBoardTitle(boardTitle);
		ArrayList<BoardVO> memberTask = (ArrayList)sqlSession.selectList("mapper.impl.searchImplementationSchedule", board);
		return memberTask;
	}

	public int countError(String projectSeq) {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setBoardCategory("에러");
		int countError = sqlSession.selectOne("mapper.board.countIssue", board);
		return countError;
	}
	
	public int countIssue(String projectSeq) {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setBoardCategory("논의");
		int countIssue = sqlSession.selectOne("mapper.board.countIssue", board);
		return countIssue;
	}

	public int countDelayTask(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int delayTask = sqlSession.selectOne("mapper.dashboard.countDelayTask", projectSeq);
		return delayTask;
	}

	public String calculateDDay(String projectSeq) {
		// TODO Auto-generated method stub
		ProjectVO project = new ProjectVO();
		project = sqlSession.selectOne("mapper.project.selectProjectOne", Integer.parseInt(projectSeq));
		String dDay = sqlSession.selectOne("mapper.dashboard.calculateDDay", project);
		System.out.println("d-day = "+dDay);
		return dDay;
	}
	

	
}
