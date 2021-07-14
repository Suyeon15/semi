package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	
	 //XSSFilter 역으로 다시 해서 화면에 뿌리기
		public String ReXSSFilter(String target) {
			if(target!=null){
				target = target.replaceAll("&lt;","<");	
				target = target.replaceAll("&gt;",">");		
				target = target.replaceAll("&amp;","&");		
			}
			return target;
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		try {
			// 쓰는 이유 : https://yi-chi.tistory.com/12
			String requestURI = request.getRequestURI();
			String ctxPath = request.getContextPath();
			String url = requestURI.substring(ctxPath.length());
			System.out.println(url);
			MemberDAO dao = MemberDAO.getInstance();
				
			
			// 회원가입 창으로 이동
			if (url.contentEquals("/member/membership.mem")) {
				System.out.println("요청");
				response.sendRedirect("memberShip.jsp"); 
				
				// 로그인 뷰로 가기
			}else if(url.contentEquals("/loginProc.mem")) {
				System.out.println("로그인");
				String id= request.getParameter("id");
				String pw = request.getParameter("pw");
				MemberDTO dto = dao.login(id, pw);
				if (dto != null) {
					request.getSession().setAttribute("login", dto); // 로그인 성공했다의 의미 =dto=> ""님 환영합니다.
				}
				response.sendRedirect("member/loginView.jsp");
				
			// 게스트 모드
			}else if(url.contentEquals("/guest.mem")) {
				System.out.println("게스트");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				
				System.out.println(id);
				System.out.println(pw);
				
				MemberDTO dto = dao.guest(id, pw);
				if (dto != null) {
					request.getSession().setAttribute("login", dto); // 로그인 성공했다의 의미 =dto=> ""님 환영합니다.
				}
				response.sendRedirect("member/loginView.jsp");
					
				
				// 로그인 설정하기
			}else if(url.contentEquals("/member/loginView.mem")) {
				String id= request.getParameter("id");
				String pw = request.getParameter("pw");
				MemberDTO dto = dao.login(id, pw);
				if (dto != null) {
					request.getSession().setAttribute("login", dto); // 로그인 성공했다의 의미 =dto=> ""님 환영합니다.
				}
				response.sendRedirect("Main.jsp");	
			
				
				// 회원가입을 해보아요
			} else if (url.contentEquals("/join.mem")) {
				System.out.println("회원가입창");
				String id = request.getParameter("id");
				String pw =request.getParameter("pswd2");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String phone=request.getParameter("phone");
				String postal =request.getParameter("postal");
				String address1 =request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				int result = dao.join(new MemberDTO(id, pw, name, email, phone, postal, address1, address2));
				System.out.println(result);
				System.out.println("받음");
				request.setAttribute("result", result); // 회원가입 결과? 
				RequestDispatcher rd = request.getRequestDispatcher("/member/joinView.jsp");
				rd.forward(request,response);
					
				
				// 회원정보 정보 - 출력 내정보관리
			}else if(url.contentEquals("/mypage.mem")) {
				String id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
				MemberDTO dto = dao.selectOne(id);
				System.out.println("출력");
				request.setAttribute("my", dto);
				request.getRequestDispatcher("member/Modify_Membership.jsp").forward(request, response);
			
				
				// 삭제하기
			}else if(url.contentEquals("/delete.mem")) {
				String id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
				int result = dao.delete(id);
				if(result > 0) {
					response.sendRedirect("member/index.jsp");
					request.getSession().invalidate();
				}
				
			// 회원 수정
			}else if(url.contentEquals("/update.mem")) {
				String id = ((MemberDTO)request.getSession().getAttribute("login")).getId();
				String pw =request.getParameter("pswd2");
				String postal=request.getParameter("postal");
				String address1=request.getParameter("address1");
				String address2 = request.getParameter("address2");
				int result = dao.update(new MemberDTO(pw, postal, address1, address2, id));
				System.out.println(result);
				request.setAttribute("result", result);
				RequestDispatcher rd = request.getRequestDispatcher("member/modyView.jsp");
				rd.forward(request,response);
			
				
				// id 찾기
			}else if(url.contentEquals("/findid.mem")) {
				System.out.println("아이디 찾나요?");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				MemberDTO dto = dao.findid(name, phone);
				if (dto != null) {
					request.getSession().setAttribute("find", dto);
				}
				response.sendRedirect("member/findIdView.jsp");
				
				
			// 비밀번호 찾기
			}else if(url.contentEquals("/findpw.mem")) {
				System.out.println("비밀번호 찾나요?");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				MemberDTO dto = dao.findpw(name, phone);
				if (dto != null) {
					request.getSession().setAttribute("finded", dto);
				}
				response.sendRedirect("member/findPw.jsp");
				
			 // 비밀번호 변경
			} else if(url.contentEquals("/findpw2.mem")) {
				 String uId = request.getParameter("uId");
			     String uPassword = request.getParameter("uPassword");
			     int result = dao.update(new MemberDTO(uId,uPassword));
			     System.out.println(result);
			     request.setAttribute("result", result);
			     RequestDispatcher rd = request.getRequestDispatcher("/member/findPwView.jsp");
				 rd.forward(request,response);
			
			// 로그아웃 하기 
			} else if (url.contentEquals("/logoutProc.mem")) {
				// 로그아웃 하기  : https://joalog.tistory.com/81			
				request.getSession().invalidate();
				response.sendRedirect("member/Main.jsp");
				
			// 관리자 리스트
			}else if (url.contentEquals("/adminlist.mem")) {
				ArrayList<MemberDTO> list = dao.getMemberList();
				request.setAttribute("list", list);
				System.out.println(list);
				RequestDispatcher rd = request.getRequestDispatcher("adminMember/memberlish1.jsp");
	            rd.forward(request, response);    
				
		
			// 관리자 삭제
			}else if(url.contentEquals("/delete1.mem")) {
				String id = request.getParameter("id");
				System.out.println(id);
				int result = dao.delete(id);
				if(result > 0) {
				response.sendRedirect("adminlist.mem");
				}
			}
			
			
		}	catch (Exception e){
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
