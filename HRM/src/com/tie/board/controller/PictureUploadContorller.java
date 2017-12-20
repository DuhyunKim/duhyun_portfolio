package com.tie.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.BoardActionFactory;
import com.tie.util.PageMove;

@WebServlet("/pictureup")
public class PictureUploadContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "index.jsp";
		if("boardwrite".equals(act)){
			path = BoardActionFactory.getBoardwriteaction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("boardupdate".equals(act)){
			path = BoardActionFactory.getBoardupdateaction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
