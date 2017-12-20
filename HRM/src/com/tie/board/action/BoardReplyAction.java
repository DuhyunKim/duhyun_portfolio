package com.tie.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class BoardReplyAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int bbsSeq = StringCheck.nullToOne(request.getParameter("bbsSeq"));
		List<BoardCommentDto> list = BoardServiceImpl.getBoardservice().boardReply(bbsSeq);
		EmpFileDto empFileDto = null;
		JSONObject json = new JSONObject();
		JSONArray jArray = new JSONArray();
		for(BoardCommentDto boardCommentDto: list){
			empFileDto = EmployeesServiceImpl.getEmployeeService().empFileDto(boardCommentDto.getBbsCommentEnum());
			JSONObject jobj = new JSONObject();
			jobj.put("commentNum", boardCommentDto.getBbsCommentNum());
			jobj.put("empName", boardCommentDto.getBbsCommentEname());
			jobj.put("commentDate", boardCommentDto.getBbsCommentDate());
			jobj.put("commentContent", boardCommentDto.getBbsCommentContent());
			if(empFileDto != null){
				jobj.put("empImage", empFileDto.getFaceOriginal());						
				jobj.put("empImageFolder", empFileDto.getSaveFolder());						
			}
			jArray.add(jobj);
		}
		json.put("boardcomments", jArray);
		return json.toJSONString();
	}
}
