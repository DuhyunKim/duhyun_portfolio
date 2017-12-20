package com.tie.board.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;
import com.tie.board.model.service.BoardServiceImpl;

public class BoardWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response){
		try {
			BoardDto boardDto = new BoardDto();
			BoardFileDto boardFileDto = new BoardFileDto();
			HttpSession session = request.getSession();
			EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
			String rootDirectory = "";
			if(employeesDto != null) {
				rootDirectory = request.getServletContext().getRealPath("/upload");
				DateFormat df = new SimpleDateFormat("yyyyMMdd");
				String today = df.format(new Date());
				String saveDirectory = rootDirectory + File.separator + today;
				File file = new File(saveDirectory);
				if(!file.exists())
					file.mkdirs();
				MultipartRequest multi = new MultipartRequest(request, saveDirectory, 3 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
				int bbsSeq = BoardServiceImpl.getBoardservice().getBoardSeq();
				boardDto.setBbsEname(employeesDto.getEmpName());
				boardDto.setBbsTitle(multi.getParameter("title"));
				boardDto.setBbsContent(multi.getParameter("content"));
				boardDto.setEmpId(employeesDto.getEmpId());
				boardFileDto.setBbsSeq(bbsSeq);
				boardFileDto.setBoardFileLocation(today);
				boardFileDto.setBoardFileName(multi.getOriginalFileName("picture"));
				boardFileDto.setBoardFileRename(multi.getFilesystemName("picture"));
			
				BoardServiceImpl.getBoardservice().boardWrite(boardDto, boardFileDto);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/pboard?act=boardlist";	
	}
}
