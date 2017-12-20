package com.tie.board.action;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tie.action.Action;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;
import com.tie.board.model.dao.BoardDaoImpl;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class BoardUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("액션 : " + request.getParameter("act"));
			String rootDirectory = request.getServletContext().getRealPath("/upload");
			DateFormat df = new SimpleDateFormat("yyyyMMdd");
			String today = df.format(new Date());
			String saveDirectory = rootDirectory + File.separator + today;
			File file = new File(saveDirectory);
			
			if(!file.exists())
				file.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, saveDirectory, 3 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			int bbsSeq = StringCheck.nullToOne(multi.getParameter("bbsSeq"));
			System.out.println("bbsSeq = " + bbsSeq);
			String title = StringCheck.nullToBlank(multi.getParameter("title"));
			String content = StringCheck.nullToBlank(multi.getParameter("content"));
			
			String oFile = multi.getOriginalFileName("picture");
			System.out.println("�떎�떆 �닔�젙�빐�꽌 �뾽濡쒕뱶�븳 �뙆�씪 : " + oFile);
			
			if(oFile != null){
				//String filename = StringCheck.nullToBlank(multi.getParameter("filename"));
				//String location = StringCheck.nullToBlank(multi.getParameter("location"));
				Map<String, String> map = BoardDaoImpl.getBoarddao().getBoardFile(bbsSeq);
				String savefolder = "";
				String fn = "";
				if(map.get("boardFileName") != null && map.get("boardFileLocation") != null){
					fn = map.get("boardFileName");
					savefolder = map.get("boardFileLocation"); 
				}
				
				String deleteDirectory = rootDirectory + File.separator + savefolder;
				File f = new File(deleteDirectory, fn);
				
				if(f.exists()){
					f.delete();
				}
				BoardFileDto boardFileDto = new BoardFileDto();
				boardFileDto.setBbsSeq(bbsSeq);
				boardFileDto.setBoardFileLocation(today);
				boardFileDto.setBoardFileName(oFile);
				boardFileDto.setBoardFileRename(multi.getFilesystemName("picture"));
				//int isBoardFile = BoardServiceImpl.getBoardservice().isBoardFile(bbsSeq);
				if(map.get("boardFileName") != null && map.get("boardFileLocation") != null)
					BoardServiceImpl.getBoardservice().boardFileUpdate(boardFileDto);
				else
					BoardServiceImpl.getBoardservice().boardFileWrite(boardFileDto);
			}
			
			BoardServiceImpl.getBoardservice().boardUpdate(bbsSeq, title, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pboard?act=boardlist";
	}

}
