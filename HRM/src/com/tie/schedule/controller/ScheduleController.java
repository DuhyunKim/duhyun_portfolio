package com.tie.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.ScheduleActionFactory;
import com.tie.util.PageMove;

/**
 * Servlet implementation class ScheduleController
 */
@WebServlet("/schedule")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String root = request.getContextPath();
		String path = "/schedule/schedule.jsp";
		String act = request.getParameter("act");
		
		if("scheduleList".equals(act)){
			path = ScheduleActionFactory.getScheduleListAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("scheduleInsert".equals(act)){
			String data = ScheduleActionFactory.getScheduleInsertAction().execute(request, response);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(data);
		}else if("scheduleUpdate".equals(act)){
			
		}else if("scheduleDelete".equals(act)){
			String data = ScheduleActionFactory.getScheduleDeleteAction().execute(request, response);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(data);
		}else if("update".equals(act)){
			String data = ScheduleActionFactory.getScheduleUpdateAction().execute(request, response);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(data);
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
