package com.tie.factory;

import com.tie.action.Action;
import com.tie.basic.action.DeleteAction;
import com.tie.basic.action.DownFileAction;
import com.tie.basic.action.EmployeesListAction;
import com.tie.basic.action.IdCheckAction;
import com.tie.basic.action.InsertAction;
import com.tie.basic.action.InsertInfoAction;
import com.tie.basic.action.LoginAction;
import com.tie.basic.action.LogoutAction;
import com.tie.basic.action.ModifyInfoAction;
import com.tie.basic.action.RegisterAction;

public class BasicActionFactory {
	private static Action employeesListAction;
	private static Action registerAction;
	private static Action modifyInfoAction;
	private static Action insertAction;
	private static Action idCheckAction;
	private static Action deleteAction;
	private static Action downFileAction;
	private static Action insertInfoAction;
	private static Action loginAction;
	private static Action logoutAction;
	
	static{
		employeesListAction = new EmployeesListAction();
		registerAction = new RegisterAction();
		modifyInfoAction = new ModifyInfoAction();
		insertAction = new InsertAction();
		idCheckAction = new IdCheckAction();
		deleteAction = new DeleteAction();
		downFileAction = new DownFileAction();
		insertInfoAction  = new InsertInfoAction();
		loginAction = new LoginAction();
		logoutAction = new LogoutAction();
	}
	
	public static Action getEmployeesListAction() {
		return employeesListAction;
	}

	public static Action getRegisterAction() {
		return registerAction;
	}

	public static Action getModifyInfoAction() {
		return modifyInfoAction;
	}

	public static Action getInsertAction() {
		return insertAction;
	}

	public static Action getIdCheckAction() {
		return idCheckAction;
	}

	public static Action getDeleteAction() {
		return deleteAction;
	}

	public static Action getDownFileAction() {
		return downFileAction;
	}

	public static Action getInsertInfoAction() {
		return insertInfoAction;
	}

	public static Action getLoginAction() {
		return loginAction;
	}
	
	public static Action getLogoutAction() {
		return logoutAction;
	}

	private BasicActionFactory(){};

}
