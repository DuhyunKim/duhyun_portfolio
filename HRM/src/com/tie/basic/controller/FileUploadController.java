package com.tie.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.BasicActionFactory;
import com.tie.util.PageMove;

@WebServlet("/fileup")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path="";
		if("modify".equals(act)){
			path = BasicActionFactory.getRegisterAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("insert".equals(act)){
			path = BasicActionFactory.getInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
		
		

	}

}