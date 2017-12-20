package com.tie.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.tie.schedule.model.ScheduleDto;
import com.tie.schedule.model.dao.ScheduleDao;
import com.tie.schedule.model.dao.ScheduleDaoImpl;

public class ScheduleServiceImpl implements ScheduleService{

	private static ScheduleService scheduleServiceImpl;
	
	static{
		scheduleServiceImpl = new ScheduleServiceImpl();
	}

	private ScheduleServiceImpl(){}
	
	public static ScheduleService getScheduleServiceImpl() {
		return scheduleServiceImpl;
	}

	@Override
	public List<ScheduleDto> scheduleList(int empId) {
		// TODO Auto-generated method stub
		return ScheduleDaoImpl.getScheduleDaoImpl().scheduleList(empId);
	}

	@Override
	public Map<String, Integer> scheduleInsert(ScheduleDto scheduleDto) {
		// TODO Auto-generated method stub
		return ScheduleDaoImpl.getScheduleDaoImpl().scheduleInsert(scheduleDto);
	}

	@Override
	public int scheduleUpdate(ScheduleDto scheduleDto) {
		// TODO Auto-generated method stub
		return ScheduleDaoImpl.getScheduleDaoImpl().scheduleUpdate(scheduleDto);
	}

	@Override
	public int scheduleDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return ScheduleDaoImpl.getScheduleDaoImpl().scheduleDelete(map);
	}
}
