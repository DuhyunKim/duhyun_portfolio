package com.tie.basic.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		// session.setAttribute("userInfo", null);
		// session.removeAttribute("userInfo"); 
		session.invalidate(); 
		return "/index.jsp";
	}

}
