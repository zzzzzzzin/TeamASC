package com.project.asc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.ProcessDAO;
import com.project.asc.vo.ProcessVO;

@Service("processService")
public class ProcessService {
	
	@Autowired
	private ProcessDAO processDAO;
	
	public ProcessVO selectProcess(int projectSeq) {
		ProcessVO process = null;
		
		process = processDAO.selectProcess(projectSeq);
		
		return process;
	}
	
	public boolean projectFinish(int projectSeq) {
		boolean flag = false;
		
		flag = processDAO.projectFinish(projectSeq);
		
		return flag;
	}
}
