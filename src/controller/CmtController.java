package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dao.CmtDAO;
import dao.GameDAO;
import dto.GameCmtDTO;
import dto.GameDTO;
import dto.MemberDTO;


@WebServlet("*.com")
public class CmtController extends HttpServlet {
	
	private String XSSFilter(String target) {
		if(target != null) {
			target = target.replaceAll("<", "&lt;");
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");
		}
		return target;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		 String uri = request.getRequestURI();
	     String ctxPath = request.getContextPath();
	      
	     String cmd = uri.substring(ctxPath.length());
	     
	     GameDAO gdao = GameDAO.getInstance();
	     CmtDAO cdao = CmtDAO.getInstance();
	     
	     try{
				
				if(cmd.contentEquals("/writeProc.com")) {
					
					  String comment = request.getParameter("comment");
			    	  int game_seq = Integer.parseInt(request.getParameter("game_seq"));		    	 

			    	  MemberDTO dto = (MemberDTO)request.getSession().getAttribute("login");
			    	  String id =dto.getId();

			    	  int result = cdao.insert(id,comment,game_seq);

			    	  
			    	  request.setAttribute("result", result);			
			    	  
			    	  JsonObject obj1 = new JsonObject();
			    	  obj1.addProperty("comment", comment);
			    	  obj1.addProperty("id", id);
			    	  obj1.addProperty("game_seq", game_seq);


			    	  response.setCharacterEncoding("utf8");
			          response.setContentType("text/html; charset=utf8;");
			          
			    	  response.getWriter().append(obj1.toString());	
			 	     
			    	
				}else if(cmd.contentEquals("/delete.com")) {   
					 
					 String cmt_seq = request.getParameter("cmt_seq");
					 int cmt_seq1 = Integer.parseUnsignedInt(cmt_seq);	
			    	 cdao.delete(cmt_seq1);

			    
			    }else if(cmd.contentEquals("/update.com")) {   
				 
			    String comments = request.getParameter("comments");
				 String cmt_seq = request.getParameter("cmt_seq");
				 int cmt_seq1 = Integer.parseUnsignedInt(cmt_seq);	
				 
		    	 cdao.modify(comments, cmt_seq1);

		    	  
		      }
				
				
			}catch(Exception e){
				 e.printStackTrace();
		    	 response.sendRedirect("error.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
