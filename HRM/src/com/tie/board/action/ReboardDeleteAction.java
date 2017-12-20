package com.tie.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class ReboardDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int commentSeq = StringCheck.nullToOne(request.getParameter("commentSeq"));
		System.out.println("commentSeq = "+commentSeq);
		BoardServiceImpl.getBoardservice().reBoardDelete(commentSeq);
		return "/aboard?act=boardreply";
	}

}
