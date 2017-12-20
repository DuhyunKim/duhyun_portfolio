package com.tie.commute.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.commute.action.CommuteInsertAction;
import com.tie.factory.CommuteActionFactory;
import com.tie.util.PageMove;

/**
 * Servlet implementation class CommuteController
 */
@WebServlet("/commute")
public class CommuteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String root = request.getContextPath();
		System.out.println(root);
		String act = request.getParameter("act");;
		System.out.println("act: " + act);
		String path = "calendar/calen.jsp";
		
		if("commuteInsert".equals(act)){
			String data = CommuteActionFactory.getCommuteInsertAction().execute(request, response);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(data);
		}else if("commuteList".equals(act)){
			path = CommuteActionFactory.getCommuteListAction().execute(request, response);
			PageMove.forward(path, request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
