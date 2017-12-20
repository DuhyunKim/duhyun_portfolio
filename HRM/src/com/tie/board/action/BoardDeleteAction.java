package com.tie.board.action;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.board.model.BoardFileDto;
import com.tie.board.model.dao.BoardDaoImpl;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class BoardDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String rootDirectory = request.getServletContext().getRealPath("/upload");
		int bbsSeq = StringCheck.nullToOne(request.getParameter("bbsSeq"));
		Map<String, Object> map = BoardDaoImpl.getBoarddao().boardSelect(bbsSeq);
		
		BoardFileDto boardFileDto = null;
		if(map.get("boardFileDto") != null){
			boardFileDto = (BoardFileDto) map.get("boardFileDto");
	
			String location = boardFileDto.getBoardFileLocation();
			String filename = boardFileDto.getBoardFileName();
			String saveDirectory = rootDirectory + File.separator + location;
			File f = new File(saveDirectory, filename);
			
			if(f.exists()){
				f.delete();
			}
		}
		BoardServiceImpl.getBoardservice().boardDelete(bbsSeq);
		return "/pboard?act=boardlist";
	}

}
