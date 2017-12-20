package com.tie.factory;

import com.tie.action.Action;
import com.tie.salary.action.SalaryDeleteAction;
import com.tie.salary.action.SalaryListAction;
import com.tie.salary.action.SalaryUpdateAction;

public class SalaryActionFactory {
	
	private static Action salaryListAction;
	private static Action salaryUpdateAction;
	private static Action salaryDeleteAction;
	
	static{
		salaryListAction = new SalaryListAction();
		salaryUpdateAction = new SalaryUpdateAction();
		salaryDeleteAction = new SalaryDeleteAction();
	}
	
	private SalaryActionFactory(){}
	
	public static Action getSalaryListAction() {
		return salaryListAction;
	}

	public static Action getSalaryUpdateAction() {
		return salaryUpdateAction;
	}

	public static Action getSalaryDeleteAction() {
		return salaryDeleteAction;
	}
	
	

}
