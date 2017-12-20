package com.tie.factory;

import com.tie.action.Action;
import com.tie.work.action.WorkDeleteAction;
import com.tie.work.action.WorkInsertAction;
import com.tie.work.action.WorkListAction;
import com.tie.work.action.WorkUpdateAction;
import com.tie.work.action.WorkUpdateFormAction;

public class WorkActionFactory {
	
	private static Action workInsertAction;
	private static Action workListAction;
	private static Action workUpdateFormAction;
	private static Action workUpdateAction;
	private static Action workDeleteAction;
	

	static {
		workInsertAction = new WorkInsertAction();
		workListAction = new WorkListAction();
		workUpdateFormAction = new WorkUpdateFormAction();
		workUpdateAction = new WorkUpdateAction();
		workDeleteAction = new WorkDeleteAction();
		
	}
	
	private WorkActionFactory(){}

	public static Action getWorkInsertAction() {
		return workInsertAction;
	}

	public static Action getWorkListAction() {
		return workListAction;
	}

	public static Action getWorkUpdateFormAction() {
		return workUpdateFormAction;
	}

	public static Action getWorkUpdateAction() {
		return workUpdateAction;
	}

	public static Action getWorkDeleteAction() {
		return workDeleteAction;
	}
	
}
