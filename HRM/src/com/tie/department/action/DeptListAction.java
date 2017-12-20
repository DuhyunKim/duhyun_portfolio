package com.tie.department.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.common.model.service.CommonServiceImpl;
import com.tie.department.model.DepartmentDto;
import com.tie.department.model.service.DepartmentServiceImpl;
import com.tie.util.PageNavigator;
import com.tie.util.StringCheck;

public class DeptListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int pg = StringCheck.nullToOne(request.getParameter("pg"));
		String word = "";
		int deptId = StringCheck.nullToOne(request.getParameter("deptId"));
		List<DepartmentDto> list = DepartmentServiceImpl.getDepartmentService().deptList(pg, deptId); 
		//System.out.println("리스트사이즈 : "+list.size());
		List<DepartmentDto> seldept = DepartmentServiceImpl.getDepartmentService().selectDept(); 

		PageNavigator navigator = CommonServiceImpl.getCommonservice().getPageNavigator(pg, word, "dept");
		navigator.setRoot(request.getContextPath());
		navigator.makeNavigator("dept");
		String navigation = navigator.getNavigator();
		request.setAttribute("totalCount", navigator.getTotalArticleCount());
		request.setAttribute("navigator", navigation);
		request.setAttribute("deptList", list);
		request.setAttribute("selDept", seldept);
		
		return "/dept/deptlist.jsp";
	}

}
