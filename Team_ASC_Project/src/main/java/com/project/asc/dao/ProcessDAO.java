package com.project.asc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.ProcessVO;

@Repository("processDAO")
public class ProcessDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ProcessVO selectProcess(int projectSeq) {
		ProcessVO process = null;
		
		process = sqlSession.selectOne("mapper.process.selectProcess",projectSeq);
		
		return process;
	}
	
	public boolean projectFinish(int projectSeq) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.process.projectfinish",projectSeq);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
