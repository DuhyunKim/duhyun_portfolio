package com.tie.factory;

import com.tie.action.Action;
import com.tie.department.action.DeptListAction;

public class DepartmentActionFactory {
	private static Action deptListaction;
	
	static{
		deptListaction = new DeptListAction();
	}
	
	private DepartmentActionFactory(){}

	public static Action getDeptListaction() {
		return deptListaction;
	}

}
