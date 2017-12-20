package com.tie.appoint.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.appoint.model.dao.AppointDaoImpl;
import com.tie.basic.model.EmployeesDto;
import com.tie.util.Constance;

public class AppointServiceImpl implements AppointService{

	private static AppointService appointService;
	
	static {
		appointService = new AppointServiceImpl();
	}
	
	private AppointServiceImpl() {}
	
	public static AppointService getAppointService() {
		return appointService;
	}

	@Override
	public Map<String, List<Object>> appointList(String val, int currentPage, int empId) {
		Map<String, String>map = new HashMap<String, String>();

		map.put("val", val);
		map.put("currentPage", String.valueOf(currentPage));
		map.put("empId", empId+"");
		
		return AppointDaoImpl.getMemberDao().appointList(map);
	}

	@Override
	public int delete(int seq) {
		return AppointDaoImpl.getMemberDao().appointDelete(seq);
	}

	@Override
	public int update(int seq, String calender,String searchName, String context) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyseq", seq+"");
		map.put("keycalender", calender);
		map.put("keysearchname", searchName);
		map.put("keycontext", context);
		return AppointDaoImpl.getMemberDao().appointUpdate(map);
	}

	@Override
	public int insert(String date, String empname, String searchName, String context) {
		List<String> list = new ArrayList<String>();
		list.add(date);
		list.add(empname);
		list.add(searchName);
		list.add(context);
		return AppointDaoImpl.getMemberDao().insert(list);
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		return AppointDaoImpl.getMemberDao().totalCountList();
	}


}
