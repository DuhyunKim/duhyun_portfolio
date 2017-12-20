package com.tie.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.tie.factory.BoardActionFactory;
import com.tie.util.PageMove;

@WebServlet("/pboard")
public class BoardPageActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String act = request.getParameter("act");	
		String root = request.getContextPath();
			
		String path = "index.jsp";
		if("boardlist".equals(act)){
			path = BoardActionFactory.getBoardlistaction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("pagewrite".equals(act)){
			path = "/board/boardwrite.jsp";
			PageMove.redirect(root+path, response);
		}else if("pageupdate".equals(act)){
			path = BoardActionFactory.getBoardselectaction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("boarddelete".equals(act)){
			path = BoardActionFactory.getBoarddeleteaction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("reboardwrite".equals(act)){
			path = BoardActionFactory.getReboardwriteaction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("downfile".equals(act)){
			BoardActionFactory.getDownfileaction().execute(request, response);
		}else if("reboardupdate".equals(act)){
			path = BoardActionFactory.getReboardupdateaction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("reboarddelete".equals(act)){
			path = BoardActionFactory.getReboarddeleteaction().execute(request, response);
			PageMove.forward(path, request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
