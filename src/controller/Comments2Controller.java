package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.Board2DAO;
import dao.Comments2DAO;
import dto.Comments2DTO;
import dto.MemberDTO;



@WebServlet("*.cmt2")
public class Comments2Controller extends HttpServlet {
	   
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	      request.setCharacterEncoding("utf-8");

	      String requestURI = request.getRequestURI();
	      String ctxPath = request.getContextPath();
	      String cmd = requestURI.substring(ctxPath.length());
	      System.out.println("요청된 url :" + cmd);
	      
	      Comments2DAO cdao = Comments2DAO.getInstance();
	      Board2DAO dao = Board2DAO.getInstance();
	      Gson g = new Gson();
	      
	      try {
	         if(cmd.contentEquals("/write.cmt2")) {
	        	 
	        	response.setCharacterEncoding("utf8");
		        response.setContentType("text/html; charset=utf8;");
	            MemberDTO dto = ((MemberDTO)request.getSession().getAttribute("login"));
	            String id2 =dto.getId();
	            
	            String cmt_content2 = request.getParameter("cmt_content2");
	            cmt_content2 = dao.XSSFilter(cmt_content2);
	            int board_seq2 = Integer.parseInt(request.getParameter("board_seq2"));
	            
	            int cmt_seq2 = cdao.getcmt_seq();
	            cdao.insert(cmt_seq2, id2, cmt_content2, board_seq2);
	            Comments2DTO cdto = cdao.getComments(cmt_seq2);
	           
	            String result = g.toJson(cdto);
	            response.getWriter().append(result);   
	            
	            
	            
//	            request.setAttribute("cmt",board_seq);
//	            response.sendRedirect("detail.bor?board_seq="+board_seq);
	            
	         }else if(cmd.contentEquals("/delete.cmt2")) {
	            int cmt_seq2 = Integer.parseInt(request.getParameter("cmt_seq2"));
	            cdao.delete(cmt_seq2);
	            
	         }else if(cmd.contentEquals("/modify.cmt2")){
	            
	            String cmt_content2 = request.getParameter("cmt_content2");
	            cmt_content2 = dao.XSSFilter(cmt_content2);
	            int cmt_seq2 = Integer.parseInt(request.getParameter("cmt_seq2"));
	         
	            
	            cdao.modify(cmt_content2,cmt_seq2);
	            Comments2DTO cdto = cdao.getComments(cmt_seq2);
	            
	            String result = g.toJson(cdto);
	            response.getWriter().append(result);
	            
	         }
	      
	      }catch(Exception e) {
	         e.printStackTrace();
	         
	      }
	   }


	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doGet(request, response);
	   }

	}

