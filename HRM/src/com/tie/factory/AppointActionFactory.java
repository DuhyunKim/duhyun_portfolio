package com.tie.factory;

import com.tie.action.Action;
import com.tie.appoint.action.AppointDeleteAction;
import com.tie.appoint.action.AppointInsertAction;
import com.tie.appoint.action.AppointListAction;
import com.tie.appoint.action.AppointUpdateAction;

public class AppointActionFactory {
	
	private static Action appointListAction;
	private static Action appointDeleteAction;
	private static Action appointUpdateAction;
	private static Action appointInsertAction;

	static {
		appointListAction = new AppointListAction();
		appointDeleteAction = new AppointDeleteAction(); 
		appointUpdateAction = new AppointUpdateAction();
		appointInsertAction = new AppointInsertAction();
	}
	
	private AppointActionFactory() {}

	public static Action getAppointListAction() {
		return appointListAction;
	}

	public static Action getAppointDeleteAction() {
		return appointDeleteAction;
	}

	public static Action getAppointUpdateAction() {
		return appointUpdateAction;
	}

	public static Action getAppointInsertAction() {
		return appointInsertAction;
	}
}
