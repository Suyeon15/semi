package controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("*.game")
public class GameController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("요청 URL : " + cmd);

		GameDAO dao = GameDAO.getInstance();
		CmtDAO cdao = CmtDAO.getInstance();

		try {
			
			if(cmd.contentEquals("/allGames.game")) {

				List<GameDTO> allList = dao.getAllList();
				
//				for(GameDTO gdt : list) {
//					System.out.println("game_ID : "+gdt.getGame_img());
//				}
//				
//				for(int i=0; i<list.size(); i++) {
//					System.out.println("game_ID : "+list.get(i).getGame_id());
//				}
				
				request.getSession().setAttribute("allList", allList);
				response.sendRedirect("game/allGames.jsp");

			}else if(cmd.contentEquals("/popularGames.game")) {
				List<GameDTO> poList = dao.getPopularList();
				
				
				request.getSession().setAttribute("poList", poList);
				response.sendRedirect("game/popularGames.jsp");
			
			}else if(cmd.contentEquals("/rpgGames.game")) {
				String rpg = "rpg";
				List<GameDTO> rList = dao.rpgList(rpg);
			
				request.getSession().setAttribute("rList", rList);
				response.sendRedirect("game/rpgGames.jsp");
			
				
			}else if(cmd.contentEquals("/shootingGames.game")) {
				String shooting = "shooting";
				List<GameDTO> sList = dao.shootList(shooting);
				request.getSession().setAttribute("sList", sList);
				response.sendRedirect("game/shootingGames.jsp");
			
			}else if(cmd.contentEquals("/arcadeGames.game")) {
				String arcade = "arcade";
				List<GameDTO> aList = dao.arcadeList(arcade);
				
				request.getSession().setAttribute("aList", aList);
				response.sendRedirect("game/arcadeGames.jsp");
				
			}else if(cmd.contentEquals("/etcGames.game")) {
				String etc = "etc";
				List<GameDTO> eList = dao.etcList(etc);
				
				request.getSession().setAttribute("eList", eList);
				response.sendRedirect("game/etcGames.jsp");
			}else if(cmd.contentEquals("/detail.game")) {
		    	  
		    	  int game_seq = Integer.parseInt(request.getParameter("game_seq"));	          
		    	  
		    	  GameDTO list=  dao.selectContents(game_seq);
		    	  List<GameCmtDTO> cmtlist = cdao.getAllList(game_seq);
		    	  
		          request.setAttribute("list",list);
		          request.setAttribute("cmtlist", cmtlist);
		          
		          request.getRequestDispatcher("game/detail.jsp").forward(request, response);
		         
		      }else if(cmd.contentEquals("/rating.game")){

		    	  //System.out.println(dto.getId());int game_seq = Integer.parseInt(request.getParameter("game_seq"));
		    	  int game_seq =101;
		          
		    	  //원래 평점 
		    	  double orirating =  dao.Getrating(game_seq);
		    	  System.out.println("orirating: " + orirating);
		    	  
		    	  // 입력 받은 평점
		    	  int newrating = Integer.parseInt(request.getParameter("newrating"));
		    	  System.out.println("new: " + newrating);
		    	  
		    	  //이제까지 평가 받은 수
		    	  int count = dao.GetCount(game_seq);
		    	  System.out.println("count=" +count);
		    	  
		    	  // 평가 수 +1
		    	  dao.SetCount(count, game_seq);
		    	  
		    	  // 추가된 평가수 뽑아오기
		    	  count = dao.GetCount(game_seq);
		    	  System.out.println("setcount=" +count);
		    	  
		    	  //평점 평균 구해서 업데이트
		    	  double rating = ((orirating*(count-1)) + newrating)/count;
		    	  System.out.println("final rating: " + rating);
		    	  
		    	  //평점 업데이트
		    	  dao.Setrating(rating, game_seq);
		    	  
		    	  //업데이트된 결과 뽑기
		    	  rating = dao.Getrating(game_seq);
		    	  
		    	  
		    	  JsonObject obj1 = new JsonObject();
		    	  obj1.addProperty("rating", rating);

		    	  response.getWriter().append(obj1.toString());		    	  	     
		    	  
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
