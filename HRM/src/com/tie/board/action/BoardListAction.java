package com.tie.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.board.model.BoardDto;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.common.model.service.CommonServiceImpl;
import com.tie.util.PageNavigator;
import com.tie.util.StringCheck;

public class BoardListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int pg = StringCheck.nullToOne(request.getParameter("pg"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		
		List<BoardDto> list = BoardServiceImpl.getBoardservice().boardList(pg, word);
//		System.out.println("게시물수 : "+list.size());
		//request.setAttribute("listNum", BoardConstance.BOARD_LIST_SIZE);
		
		//int cnt = BoardServiceImpl.getBoardservice().pageCount(word);
		//request.setAttribute("totalCount", cnt);
		PageNavigator navigator = CommonServiceImpl.getCommonservice().getPageNavigator(pg, word, "board");
		navigator.setRoot(request.getContextPath());
		navigator.makeNavigator("board");
		String navigation = navigator.getNavigator();
		request.setAttribute("totalCount", navigator.getTotalArticleCount());
		request.setAttribute("navigator", navigation);
		request.setAttribute("boardList", list);
		return "/board/boardlist.jsp";
	}

}
