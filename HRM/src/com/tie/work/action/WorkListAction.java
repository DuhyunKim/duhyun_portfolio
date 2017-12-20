package com.tie.work.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.work.model.service.WorkServiceImpl;

public class WorkListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Map<String, List<Object>> workList = null;
		Map<String, String> map = null;
		
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		String empId = String.valueOf(employeesDto.getEmpId());
		int currentPage = 1;
		
		int pageSize = 3; // 한 페이지에 보여줄 게시글 수
		int pageGroupSize = 2; // 페이징 네비[블록] 사이즈
		System.out.println(empId+"empid:");
		int totalCount = WorkServiceImpl.getWorkService().totalCountList(Integer.parseInt(empId));
		System.out.println("totalCount: " + totalCount);
		
		int finalPage = (totalCount + (pageSize - 1)) / pageSize;
		
		int pageGroupCount = 0;
		int numPageGroup = 0;
			
		if(request.getParameter("currentPage") == null){
			map = new HashMap<String, String>();
			map.put("currentPage", String.valueOf(currentPage));
			map.put("empId", empId);
			
			workList = WorkServiceImpl.getWorkService().workList(map);
			
			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1); 
			System.out.println("pageGroupCount: " + pageGroupCount);
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
			System.out.println("numPageGroup: " + numPageGroup);
			
		}else{		
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			map = new HashMap<String, String>();
			map.put("currentPage", String.valueOf(currentPage));
			map.put("empId", empId);
			
			System.out.println("currentPage: " + currentPage);
			workList = WorkServiceImpl.getWorkService().workList(map);
			
			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1);
			System.out.println("pageGroupCount: " + pageGroupCount);
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
			System.out.println("numPageGroup: " + numPageGroup);
	
		}

		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageGroupSize", pageGroupSize);
		request.setAttribute("numPageGroup", numPageGroup);
		request.setAttribute("pageGroupCount", pageGroupCount);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("finalPage", finalPage);
		
		request.setAttribute("workList", workList);
		
		return "/work/worklist.jsp";
	}

}
