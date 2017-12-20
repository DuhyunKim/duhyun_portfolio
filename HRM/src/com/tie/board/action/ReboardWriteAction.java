package com.tie.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class ReboardWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
//		String root = request.getContextPath();
		int bbsSeq = StringCheck.nullToOne(request.getParameter("bbsSeq"));
		String content = StringCheck.nullToBlank(request.getParameter("content"));
		BoardCommentDto boardCommentDto = new BoardCommentDto();
		boardCommentDto.setBbsSeq(bbsSeq);
		boardCommentDto.setBbsCommentContent(content);
	
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		boardCommentDto.setBbsCommentEname(employeesDto.getEmpName());
		boardCommentDto.setBbsCommentEnum(employeesDto.getEmpId());
		
		BoardServiceImpl.getBoardservice().reboardWrite(boardCommentDto);
		return "/aboard?act=boardreply";
	}

}
