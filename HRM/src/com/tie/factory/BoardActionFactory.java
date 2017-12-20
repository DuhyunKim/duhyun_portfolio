package com.tie.factory;

import com.tie.action.Action;
import com.tie.board.action.BoardDeleteAction;
import com.tie.board.action.BoardListAction;
import com.tie.board.action.BoardReplyAction;
import com.tie.board.action.BoardSelectAction;
import com.tie.board.action.BoardUpdateAction;
import com.tie.board.action.BoardWriteAction;
import com.tie.board.action.DownFileAction;
import com.tie.board.action.ReboardDeleteAction;
import com.tie.board.action.ReboardUpdateAction;
import com.tie.board.action.ReboardWriteAction;


public class BoardActionFactory {
	private static Action boardlistaction;
	private static Action boardwriteaction;
	private static Action boardupdateaction;
	private static Action boardselectaction;
	private static Action boarddeleteaction;
	private static Action reboardwriteaction;
	private static Action boardreplyaction;
	private static Action downfileaction;
	private static Action reboardupdateaction;
	private static Action reboarddeleteaction;
	
	static{
		boardlistaction = new BoardListAction();
		boardwriteaction = new BoardWriteAction();
		boardupdateaction = new BoardUpdateAction();
		boardselectaction = new BoardSelectAction();
		boarddeleteaction = new BoardDeleteAction();
		reboardwriteaction = new ReboardWriteAction();
		boardreplyaction = new BoardReplyAction();
		downfileaction = new DownFileAction();
		reboardupdateaction = new ReboardUpdateAction();
		reboarddeleteaction = new ReboardDeleteAction();
	}
	
	private BoardActionFactory(){}

	public static Action getBoardlistaction() {
		return boardlistaction;
	}

	public static Action getBoardwriteaction() {
		return boardwriteaction;
	}
	
	public static Action getBoardupdateaction() {
		return boardupdateaction;
	}

	public static Action getBoardselectaction() {
		return boardselectaction;
	}

	public static Action getBoarddeleteaction() {
		return boarddeleteaction;
	}
	
	public static Action getBoardreplyaction() {
		return boardreplyaction;
	}

	public static Action getReboardwriteaction() {
		return reboardwriteaction;
	}

	public static Action getDownfileaction() {
		return downfileaction;
	}

	public static Action getReboardupdateaction() {
		return reboardupdateaction;
	}

	public static Action getReboarddeleteaction() {
		return reboarddeleteaction;
	}
	
	
		
}
	
