package dao;

import java.awt.List;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;
import utils.Util;

public class MemberDAO {
	// volatile 사용이유 : https://nesoy.github.io/articles/2018-06/Java-volatile
	private volatile static MemberDAO instance;

	public MemberDAO() {
	}

	// 싱글 패턴 제약 조건 : https://iotsw.tistory.com/47 결국은 재탕
	public static MemberDAO getInstance() {

		if (instance == null) {
			synchronized (MemberDAO.class) {
				if (instance == null)
					instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	 //XSSFilter 역으로 다시 해서 화면에 뿌리기
		public String ReXSSFilter(String target) {
			if(target!=null){
				target = target.replaceAll("&lt;","<");	
				target = target.replaceAll("&gt;",">");		
				target = target.replaceAll("&amp;","&");		
			}
			return target;
		}
	
	
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// 로그인 기능
	public MemberDTO login(String id, String pw) throws Exception {
		String sql = "select * from member where id=? and pw=?";
		MemberDTO result = null;
		// Connection / PrepareStatement : https://sas-study.tistory.com/160
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, Util.getSHA512(pw));

			// executeQuery 사용 : https://mozi.tistory.com/26
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					String tmdId = rs.getNString("id");
					String name = rs.getNString("name");

					result = new MemberDTO(tmdId, name);
				}
			}
			System.out.println(result);
			return result;
		}
	}
	
//	public MemberDTO guest(String id, String pw) throws Exception {
//		String sql = "select * from member where id=? and pw=?";
//		MemberDTO result = null;
//		// Connection / PrepareStatement : https://sas-study.tistory.com/160
//		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//			pstat.setString(1, id);
//			pstat.setString(2, pw);
//
//			// executeQuery 사용 : https://mozi.tistory.com/26
//			try (ResultSet rs = pstat.executeQuery();) {
//				if (rs.next()) {
//					String tmdId = rs.getNString("id");
//					String name = rs.getNString("name");
//
//					result = new MemberDTO(tmdId, name);
//				}
//			}
//			System.out.println(result);
//			return result;
//		}
//	}
	
	public MemberDTO guest(String id, String pw) throws Exception {
		String sql = "select * from member where id=? and pw=?";
		MemberDTO result = null;
		// Connection / PrepareStatement : https://sas-study.tistory.com/160
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);

			// executeQuery 사용 : https://mozi.tistory.com/26
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					String tmdId = rs.getNString("id");
					String name = rs.getNString("name");

					result = new MemberDTO(tmdId, name);
				}
			}
			System.out.println(result);
			return result;
		}
	}
	
	
	
	
	

	// 회원가입
	public int join(MemberDTO dto) throws Exception {
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setNString(1, dto.getId());
			pstat.setNString(2, Util.getSHA512(dto.getPw()));
			pstat.setNString(3, dto.getName());
			pstat.setNString(4, dto.getEmail());
			pstat.setNString(5, dto.getPhone());
			pstat.setNString(6, dto.getPostal());
			pstat.setNString(7, dto.getAddress1());
			pstat.setNString(8, dto.getAddress2());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 아이디 중복 체크 하기
	public int joinIdCheck(String id) throws Exception {
		int result;
		String sql = "select * from member where id=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);

		) {
			pstat.setNString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					result = 0;
				} else {
					result = 1;
				}
			}
		}
		return result;
	}

	// 회원 탈퇴 기능!
	public int delete(String id) throws Exception {
		String sql = "delete from member where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 수정부분에 - 회원정보 출력
	public MemberDTO selectOne(String id) throws Exception {
		String sql = "select * from member where id=? ";
		MemberDTO temp = null;
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					String searchid = rs.getNString("id");
					String name = rs.getNString("name");
					String email = rs.getNString("email");
					String phone = rs.getNString("phone");

					temp = new MemberDTO(searchid, name, email, phone);
				}
			}
			return temp;
		}
	}

	// 수정 기능!!!
	public int update(MemberDTO dto) throws Exception {
		String sql = "update member set pw=?, Postal=?,address1=?,address2=? where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setNString(1, Util.getSHA512(dto.getPw()));
			pstat.setNString(2, dto.getPostal());
			pstat.setNString(3, dto.getAddress1());
			pstat.setNString(4, dto.getAddress2());
			pstat.setNString(5, dto.getId());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	// 아이디 찾기
	public MemberDTO findid(String name, String phone) throws Exception {
		String sql = "select * from member where name=? and phone=?";
		MemberDTO temp = null;
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			System.out.println(name);
			System.out.println(phone);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					System.out.println("존재 확인");
					String searchid = rs.getString("id");
					temp = new MemberDTO(searchid);
				}
			}
			System.out.println(temp);
			return temp;
		}
	}
	
	// 비밀번호 찾기
	public MemberDTO findpw(String name, String phone) throws Exception {
		String sql = "select * from member where name=? and phone=?";
		MemberDTO temp = null;
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			System.out.println(name);
			System.out.println(phone);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					System.out.println("존재 확인");
					String searchpw = rs.getNString("pw");
					temp = new MemberDTO(searchpw);
				}
			}
			System.out.println(temp);
			return temp;
		}
	}
	
	//  비밀번호 수정 !!
	public int ModifyFw(String uId, String uPassword) throws Exception {
		String sql = "update member set pw = ? where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setNString(1, Util.getSHA512(uPassword));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// 회원 전체 출력
	public ArrayList<MemberDTO> getMemberList() throws Exception{
		String sql = "select * from member";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getNString("id"));
				dto.setName(rs.getNString("name"));
				dto.setPhone(rs.getNString("phone"));
				dto.setEmail(rs.getNString("email"));
				dto.setPostal(rs.getNString("Postal"));
				dto.setAddress1(rs.getNString("address1"));
				dto.setAddress2(rs.getNString("address2"));
			
				list.add(dto);
				con.commit();
			}
			return list;
		}
	}

}
