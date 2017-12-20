package com.tie.commute.model.service;

import java.util.List;
import java.util.Map;

import com.tie.commute.model.AttendanceDto;
import com.tie.commute.model.dao.CommuteDao;
import com.tie.commute.model.dao.CommuteDaoImpl;

public class CommuteServiceImpl implements CommuteService{

	private static CommuteService commuteService;
	
	static{
		commuteService = new CommuteServiceImpl();
	}
	
	public static CommuteService getCommuteService() {
		return commuteService;
	}

	@Override
	public List<AttendanceDto> commuteList(String empid) {
		// TODO Auto-generated method stub
		return CommuteDaoImpl.getCommuteDao().commuteList(empid);
	}

	@Override
	public int commuteInsert(Map<String, String> map) {
		// TODO Auto-generated method stub
		return CommuteDaoImpl.getCommuteDao().commuteInsert(map);
	}

	@Override
	public int commuteUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return CommuteDaoImpl.getCommuteDao().commuteUpdate(map);
	}

	@Override
	public int commutsSelect(Map<String, String> map) {
		// TODO Auto-generated method stub
		return CommuteDaoImpl.getCommuteDao().commutsSelect(map);
	}

}
