package com.tie.factory;

import com.tie.action.Action;
import com.tie.commute.action.CommuteInsertAction;
import com.tie.commute.action.CommuteListAction;

public class CommuteActionFactory {

	private static Action commuteInsertAction;
	private static Action commuteListAction;
	
	static{
		commuteInsertAction = new CommuteInsertAction();
		commuteListAction = new CommuteListAction();
	}
	
	private CommuteActionFactory(){}

	public static Action getCommuteInsertAction() {
		return commuteInsertAction;
	}

	public static Action getCommuteListAction() {
		return commuteListAction;
	}

}
