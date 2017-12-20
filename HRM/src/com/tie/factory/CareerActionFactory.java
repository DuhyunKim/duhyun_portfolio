package com.tie.factory;

import com.tie.action.Action;
import com.tie.career.action.CareerDeleteAction;
import com.tie.career.action.CareerInsertAction;
import com.tie.career.action.CareerListAction;
import com.tie.career.action.CareerUpdateAction;

public class CareerActionFactory {
	private static Action careerListAction;
	private static Action careerInsertAction;
	private static Action careerDeleteAction;
	private static Action careerUpdateAction;

	static {
		careerListAction = new CareerListAction();
		careerInsertAction = new CareerInsertAction();
		careerDeleteAction = new CareerDeleteAction();
		careerUpdateAction = new CareerUpdateAction();
	}
	
	private CareerActionFactory() {}

	public static Action getCareerListAction() {
		return careerListAction;
	}

	public static Action getCareerInsertAction() {
		return careerInsertAction;
	}

	public static Action getCareerDeleteAction() {
		return careerDeleteAction;
	}

	public static Action getCareerUpdateAction() {
		return careerUpdateAction;
	}
}
