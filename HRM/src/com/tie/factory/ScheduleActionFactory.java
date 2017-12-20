package com.tie.factory;

import com.tie.action.Action;
import com.tie.schedule.action.ScheduleDeleteAction;
import com.tie.schedule.action.ScheduleInsertAction;
import com.tie.schedule.action.ScheduleListAction;
import com.tie.schedule.action.ScheduleUpdateAction;

public class ScheduleActionFactory {
	
	private static Action scheduleListAction;
	private static Action scheduleInsertAction;
	private static Action scheduleUpdateAction;
	private static Action scheduleDeleteAction;
	
	static{
		scheduleListAction= new ScheduleListAction();
		scheduleInsertAction= new ScheduleInsertAction();
		scheduleUpdateAction= new ScheduleUpdateAction();
		scheduleDeleteAction= new ScheduleDeleteAction();
	}
	
	private ScheduleActionFactory(){}

	public static Action getScheduleListAction() {
		return scheduleListAction;
	}

	public static Action getScheduleInsertAction() {
		return scheduleInsertAction;
	}

	public static Action getScheduleUpdateAction() {
		return scheduleUpdateAction;
	}

	public static Action getScheduleDeleteAction() {
		return scheduleDeleteAction;
	}
}
