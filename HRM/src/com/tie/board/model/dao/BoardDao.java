package com.tie.board.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;

public interface BoardDao {
	List<BoardDto> boardList(Map<String, String> map);
	int pageCount(String word);
	int boardWrite(Map<String, Object> map);
	int boardUpdate(Map<String, String> map);
	Map<String, Object> boardSelect(int bbsSeq);
	int boardDelete(int bbsSeq);
	int boardVc(int bbsSeq);
	int reboardWrite(BoardCommentDto boardCommentDto);
	List<BoardCommentDto> boardReply(int bbsSeq);
	int getBoardSeq();
	int boardFileUpdate(BoardFileDto boardFileDto);
	int boardFileWrite(BoardFileDto boardFileDto);
	int reBoardUpdate(Map<String, String> map);
	int reBoardDelete(int commentSeq);
	Map<String, String> getBoardFile(int bbsSeq);
}
