package com.tie.board.model.service;

import java.util.List;
import java.util.Map;

import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;

public interface BoardService {
	List<BoardDto> boardList(int pg, String word);
	int pageCount(String word);
	int boardWrite(BoardDto boardDto, BoardFileDto boardFileDto);
	int boardUpdate(int bbsSeq, String title, String content);
	Map<String, Object> boardSelect(int bbsSeq);
	int boardDelete(int bbsSeq);
	int boardVc(int bbsSeq);
	int reboardWrite(BoardCommentDto boardCommentDto);
	List<BoardCommentDto> boardReply(int bbsSeq);
	int getBoardSeq();
	int boardFileUpdate(BoardFileDto boardFileDto);
	int boardFileWrite(BoardFileDto boardFileDto);
	//int isBoardFile(int bbsSeq);
	Map<String, String> getBoardFile(int bbsSeq);
	int reBoardUpdate(int commentSeq, String commentContent);
	int reBoardDelete(int commentSeq);
	
}
