package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import boardconfig.BoardConfig;
import boardconfig.FileConfig;
import dao.Board2DAO;
import dao.Comments2DAO;
import dao.File2DAO;
import dto.Board2DTO;
import dto.Comments2DTO;
import dto.File2DTO;
import dto.MemberDTO;

@WebServlet("*.bor2")
public class Board2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = uri.substring(ctxPath.length());
		
		
		Board2DAO dao = Board2DAO.getInstance();
		Comments2DAO cdao = Comments2DAO.getInstance();
		File2DAO fdao= File2DAO.getInstance();
		Gson g = new Gson();
		
		try {
		if(cmd.contentEquals("/list.bor2")) {
		
			String category = request.getParameter("category");
			String searchWord = request.getParameter("searchWord");
			
			int cpage =Integer.parseInt(request.getParameter("cpage"));
			
			int endNum =cpage*BoardConfig.RECORD_COUNT_PER_PAGE;
			int startNum =endNum -(BoardConfig.RECORD_COUNT_PER_PAGE-1);
			
			
			List<Board2DTO> list ;
			if(searchWord==null||searchWord.contentEquals("")) {
				list = dao.getPageList(startNum,endNum);
			}else {
				list = dao.getPageList(startNum,endNum,category,searchWord);
				
			}
					
			List<String> pageNavi = dao.getPageNavi(cpage,category,searchWord);
			
			List<Board2DTO> searchList = null;
		    if(searchWord==null||searchWord.contentEquals("")) {
		    }else {
		     searchList = dao.search(category, searchWord);
		    }
		    
		    String cpage2=String.valueOf(cpage);
		    
		    request.setAttribute("cpage", cpage2);
			request.setAttribute("searchList", searchList);
			request.setAttribute("list", list);
			request.setAttribute("navi", pageNavi);
			request.setAttribute("category", category);
			request.setAttribute("searchWord", searchWord);
			request.getRequestDispatcher("/board/board2MainPage.jsp").forward(request, response);
			
		
		
		}else if(cmd.contentEquals("/write.bor2")) {
			response.sendRedirect("board/board2WritePage.jsp");
		
		}else if(cmd.contentEquals("/detail.bor2")) {
			int board_seq2 = Integer.parseInt(request.getParameter("board_seq2"));
			
			dao.view_count(board_seq2); // 조회수 올리는 코드
			Board2DTO dto = dao.detail(board_seq2);  //게시글의 디테일 내용 가져오기
			List<Comments2DTO> cmtlist = cdao.getCommentsList(board_seq2); // 댓글 목록을 가져오는 코드
			String result = g.toJson(cmtlist);

			
			List<File2DTO> flist = fdao.fileList(board_seq2);  //게시글의 첨부파일 리스트 가져오기
			
			
			
			response.setCharacterEncoding("utf8");
	        response.setContentType("text/html; charset=utf8;");
	        
			
			request.setAttribute("list", dto);    //게시글의 디테일 내용 전달하기
			request.setAttribute("cmt", cmtlist);  // 댓글 리스트 전달하기
			request.setAttribute("flist", flist);  //게시글의 첨부파일 리스트 전달하기
			request.getRequestDispatcher("board/board2DetailPage.jsp").forward(request, response);
			
		}else if(cmd.contentEquals("/save.bor2")) {
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");
			String id =dto.getId();
			
			String filePath = request.getServletContext().getRealPath("files");
			
			File fileFolder = new File(filePath);
			
			if(!fileFolder.exists()) { fileFolder.mkdir();}
			
			MultipartRequest multi = new MultipartRequest(request,filePath, FileConfig.uploadMaxSize,"utf8",new DefaultFileRenamePolicy());

			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String notice = multi.getParameter("notice");	
			title = dao.XSSFilter(title);
			
			
			int board_seq= dao.getSeq();
			
			
			int result = dao.insert(new Board2DTO(board_seq,id,title,content,null,0,notice));

			
			String[] arrImg= multi.getParameterValues("summerImg");
			if(arrImg!=null) {
			for(int i=0; i<arrImg.length; i++) {
				String[] imgNames = arrImg[i].split(",");
				String oriName =imgNames[0];
				String sysName =imgNames[1];
				
			
				if(oriName!=null) {
					fdao.summerWrite(new File2DTO(0,oriName,sysName,null,board_seq));
					}
				}
			}
			
			Set<String> fileNames = multi.getFileNameSet();
			
			for(String fileName :fileNames) {
			
				if(fileName.contentEquals("files")) {

				}else{
				
				String oriName = multi.getOriginalFileName(fileName);
				String sysName = multi.getFilesystemName(fileName);
				

				if(oriName!=null) {
					fdao.fileWrite(new File2DTO(0,oriName,sysName,null,board_seq));
				}
				}
			}
			
			response.sendRedirect("detail.bor2?board_seq2="+board_seq);
			
			
		}else if(cmd.contentEquals("/delete.bor2")) {
            int board_seq = Integer.parseInt(request.getParameter("board_seq2"));
            int result = dao.delete(board_seq);
            
            response.sendRedirect(ctxPath + "/list.bor2?cpage=1");
         
        
            
		}else if(cmd.contentEquals("/modifyPage.bor2")) {
			int board_seq = Integer.parseInt(request.getParameter("board_seq2"));
			Board2DTO dto = dao.detail(board_seq);
			
			List<File2DTO> flist = fdao.fileList(board_seq);
			
			request.setAttribute("dto", dto);
			request.setAttribute("flist", flist);
			request.getRequestDispatcher("board/board2ModifyPage.jsp").forward(request, response);
			
		}else if(cmd.contentEquals("/modify.bor2")) {
			String filePath= request.getServletContext().getRealPath("files");
			
			MultipartRequest multi = new MultipartRequest(request,filePath,FileConfig.uploadMaxSize,"utf-8",new DefaultFileRenamePolicy());
			
			
			int board_seq = Integer.parseInt(multi.getParameter("board_seq2"));
			String reTitle = dao.XSSFilter(multi.getParameter("title"));
			String reContent = multi.getParameter("content");
			String notice = multi.getParameter("notice");
			
			dao.modify(board_seq,reTitle,reContent,notice);
			
			
			
			String[] delFiles = multi.getParameterValues("delFiles");
			if(delFiles!=null) {
			for(String delTargetSeq : delFiles) {
			
				String sysName = fdao.getSysName(Integer.parseInt(delTargetSeq));
				
				
				File delTargetFile = new File(filePath+"/"+sysName);
				boolean delResult = delTargetFile.delete();
				if(delResult) {
					fdao.delete(Integer.parseInt(delTargetSeq));
				}
			}				
			}
			
			
			
						String[] arrImg= multi.getParameterValues("summerImg");
						if(arrImg!=null) {
						for(int i=0; i<arrImg.length; i++) {
							String[] imgNames = arrImg[i].split(",");
							String oriName =imgNames[0];
							String sysName =imgNames[1];
							
							if(oriName!=null) {
								fdao.summerWrite(new File2DTO(0,oriName,sysName,null,board_seq));
								}
							}
						}
					
						Set<String> fileNames = multi.getFileNameSet();
						
						for(String fileName :fileNames) {
						
							if(fileName.contentEquals("files")) {
								
							}else{String oriName = multi.getOriginalFileName(fileName);
							String sysName = multi.getFilesystemName(fileName);
							
							if(oriName!=null) {
								fdao.fileWrite(new File2DTO(0,oriName,sysName,null,board_seq));
							}
							}
						}
			
			
			
			response.sendRedirect("detail.bor2?board_seq2="+ board_seq);
			
		}
		
		
		
		
		
		
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
