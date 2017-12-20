package com.tie.factory;

import com.tie.action.Action;
import com.tie.document.action.DocumentDeleteAction;
import com.tie.document.action.DocumentInsertAction;
import com.tie.document.action.DocumentListAction;
import com.tie.document.action.DocumentUpdateAction;
import com.tie.document.action.PersonSearchAction;

public class DocumentActionFactory{
	
	private static Action documentListAction;
	private static Action documentInsertAction;
	private static Action documentUpdateAction;
	private static Action documentDeleteAction;
	private static Action personSearchAction;
	
	static{
		documentListAction = new DocumentListAction();
		documentInsertAction = new DocumentInsertAction();
		documentUpdateAction = new DocumentUpdateAction();
		documentDeleteAction = new DocumentDeleteAction();
		personSearchAction = new PersonSearchAction();
	}
	
	private DocumentActionFactory(){}

	public static Action getDocumentListAction() {
		return documentListAction;
	}

	public static Action getDocumentInsertAction() {
		return documentInsertAction;
	}

	public static Action getDocumentUpdateAction() {
		return documentUpdateAction;
	}

	public static Action getDocumentDeleteAction() {
		return documentDeleteAction;
	}

	public static Action getPersonSearchAction() {
		return personSearchAction;
	}

}
