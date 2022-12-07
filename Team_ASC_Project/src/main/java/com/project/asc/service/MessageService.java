package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.MessageDAO;
import com.project.asc.vo.MessageVO;

@Service("messageService")
public class MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	/* 메세지 검색 */
//	public ArrayList<MessageVO> searchMessage(MessageVO message) {
//		ArrayList<MessageVO> list = null;
//		
//		list = messageDAO.searchMessage(message);
//		
//		return list;
//	}
	
	/* 검색된 메세지 수 (카운트) */
//	public int searchMessageNum(MessageVO message) {
//		int searchMessageNum = 0;
//		
//		searchMessageNum = messageDAO.searchMessageNum(message);
//		
//		return searchMessageNum;
//	}
	
	/* 메세지 목록 + 페이징 */
	public ArrayList<MessageVO> selectMessageList(int userSeq, int startRowNum, int viewRows){
		ArrayList<MessageVO> list = null;
		
		list = messageDAO.selectMessageList(userSeq, startRowNum, viewRows);
		
		return list;
	}
	
	/* 전체 메세지 수 (카운트) */
	public int totalMessageNum(int userSeq) {
		
		int totalMessageNum = messageDAO.totalMessageNum(userSeq);
		
		return totalMessageNum;
	}
	
	public MessageVO selectMessageOne(int messageSeq) {
		MessageVO message = null;
		
		message = messageDAO.selectMessageOne(messageSeq);
		
		return message;
	}
	
	public boolean inviteProjectConfirm(MessageVO message) {
		boolean flag = false;
		
		flag = messageDAO.inviteProjectConfirm(message);
		
		return flag;
	}
	
	public boolean inviteProjectReject(MessageVO message) {
		boolean flag = false;
		
		flag = messageDAO.inviteProjectReject(message);
		
		return flag;
	}
	
	/* 안 읽은 메세지 유무 */
	public boolean unReadingMessage(int userSeq) {
		boolean flag = false;
		
		flag = messageDAO.unReadingMessage(userSeq);
		
		return flag;
	}
}
