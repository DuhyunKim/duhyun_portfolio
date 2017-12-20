package com.tie.factory;

import com.tie.action.Action;
import com.tie.license.action.LicenseDeleteAction;
import com.tie.license.action.LicenseInsertAction;
import com.tie.license.action.LicenseListAction;
import com.tie.license.action.LicenseUpdateAction;
import com.tie.license.action.LicenseUpdateInfoAction;

public class LicenseActionFactory {
	private static Action licenseInsertAction;
	private static Action licenseListAction;
	private static Action licenseUpdateAction;
	private static Action licenseUpdateInfoAction;
	private static Action licenseDeleteAction;
	
	
	private LicenseActionFactory(){};
	
	static{
		 licenseInsertAction = new LicenseInsertAction();
		 licenseListAction = new LicenseListAction();
		 licenseUpdateAction = new LicenseUpdateAction();
		 licenseUpdateInfoAction = new LicenseUpdateInfoAction();
		 licenseDeleteAction = new LicenseDeleteAction();
	}

	public static Action getLisenseInsertAction() {
		return  licenseInsertAction;
	}

	public static Action getLisenseListAction() {
		return  licenseListAction;
	}

	public static Action getLicenseUpdateAction() {
		return licenseUpdateAction;
	}

	public static Action getLicenseUpdateInfoAction() {
		return licenseUpdateInfoAction;
	}

	public static Action getLicenseDeleteAction() {
		return licenseDeleteAction;
	}
	
	
}
