package com.tie.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;
import com.tie.board.model.dao.BoardDao;
import com.tie.board.model.dao.BoardDaoImpl;
import com.tie.util.Constance;

public class BoardServiceImpl implements BoardService {

	private static BoardService boardservice;
	
	static{
		boardservice = new BoardServiceImpl();
	}
	
	private BoardServiceImpl(){}

	public static BoardService getBoardservice() {
		return boardservice;
	}

	@Override
	public List<BoardDto> boardList(int pg, String word) {
		Map<String, String> map = new HashMap<String, String>(); 
		int end = pg * Constance.LIST_SIZE;
		int start = end - Constance.LIST_SIZE;
		map.put("start", start+"");
		map.put("end", end+"");
		map.put("word", word);
		return BoardDaoImpl.getBoarddao().boardList(map);
	}

	@Override
	public int pageCount(String word){
		return BoardDaoImpl.getBoarddao().pageCount(word);
	}

	@Override
	public int boardWrite(BoardDto boardDto, BoardFileDto boardFileDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardDto", boardDto);
		map.put("boardFileDto", boardFileDto);
		return BoardDaoImpl.getBoarddao().boardWrite(map);
	}

	@Override
	public int boardUpdate(int bbsSeq, String title, String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bbs_seq", bbsSeq+"");
		map.put("bbs_title", title);
		map.put("bbs_content", content);
		return BoardDaoImpl.getBoarddao().boardUpdate(map);
	}

	@Override
	public Map<String, Object> boardSelect(int bbsSeq) {
		return BoardDaoImpl.getBoarddao().boardSelect(bbsSeq);
	}

	@Override
	public int boardDelete(int bbsSeq) {
		return BoardDaoImpl.getBoarddao().boardDelete(bbsSeq);
	}

	@Override
	public int boardVc(int bbsSeq) {
		return BoardDaoImpl.getBoarddao().boardVc(bbsSeq);
	}

	@Override
	public int reboardWrite(BoardCommentDto boardCommentDto) {
		return BoardDaoImpl.getBoarddao().reboardWrite(boardCommentDto);
	}

	@Override
	public List<BoardCommentDto> boardReply(int bbsSeq) {
		return BoardDaoImpl.getBoarddao().boardReply(bbsSeq);
	}

	@Override
	public int getBoardSeq() {
		return BoardDaoImpl.getBoarddao().getBoardSeq();
	}

	@Override
	public int boardFileUpdate(BoardFileDto boardFileDto) {
		return BoardDaoImpl.getBoarddao().boardFileUpdate(boardFileDto);
	}

	@Override
	public int boardFileWrite(BoardFileDto boardFileDto) {
		return BoardDaoImpl.getBoarddao().boardFileWrite(boardFileDto);
	}
	
	@Override
	public int reBoardUpdate(int commentSeq, String commentContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("commentSeq", commentSeq+"");
		map.put("commentContent", commentContent);
		return BoardDaoImpl.getBoarddao().reBoardUpdate(map);
	}

	@Override
	public int reBoardDelete(int commentSeq) {
		return BoardDaoImpl.getBoarddao().reBoardDelete(commentSeq);
	}

	@Override
	public Map<String, String> getBoardFile(int bbsSeq) {
		return BoardDaoImpl.getBoarddao().getBoardFile(bbsSeq);
	}
}
