package com.tie.document.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.DocumentActionFactory;
import com.tie.factory.ScheduleActionFactory;
import com.tie.factory.WorkActionFactory;
import com.tie.util.PageMove;

/**
 * Servlet implementation class DocumentController
 */
@WebServlet("/document")
public class DocumentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String root = request.getContextPath();
		System.out.println(root);
		String act = request.getParameter("act");;
		System.out.println("act: " + act);
		String path = "document/documentList.jsp";
		
		if("documentForm".equals(act)){
			path = "/document/documentform.jsp";
			System.out.println(root+path);
			PageMove.redirect(root+path, response);
		}else if("personSearch".equals(act)){
			String data = DocumentActionFactory.getPersonSearchAction().execute(request, response);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(data);	
		}else if("documentInsert".equals(act)){
			path = DocumentActionFactory.getDocumentInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
