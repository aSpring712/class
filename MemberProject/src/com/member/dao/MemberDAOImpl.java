package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.member.dto.MemberDTO;

// 정의만 해놓았던 인터페이스 MemberDAO를 구현
public class MemberDAOImpl implements MemberDAO {

	// DB 세팅
	private static MemberDAOImpl instance = new MemberDAOImpl(); // 싱글톤으로 만듦
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	@Override // 추가
	public void memInsert(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into memberdb values(?, ?, ?, ?, ?, ?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getPhone());
			ps.setInt(6, member.getAdmin());
			ps.executeUpdate(); // 수행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

	@Override // 전체보기
	public ArrayList<MemberDTO> memList() {
		Connection con = null;
		Statement st = null; // sql문에 ?가 안들어가므로
		ResultSet rs = null;
		ArrayList<MemberDTO> arr = new ArrayList<>(); // 여러개가 담길 것이므로
		
		try {
			con = getConnection();
			String sql = "select * from memberdb";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setName(rs.getString("name"));
				member.setUserid(rs.getString("userid"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAdmin(rs.getInt("admin"));
				arr.add(member); // dao에서 사용하는 arr
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// 수정하기
	@Override
	public int memUpdate(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "update memberdb set name=?, pwd=?, email=?, admin=?, phone=? where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName()); // 1, 2 이런건 ?의 위치
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getEmail());
			ps.setInt(4, member.getAdmin());
			ps.setString(5, member.getPhone());
			ps.setString(6, member.getUserid());
			flag = ps.executeUpdate(); //update되면 처리된 행의 수가 return 되어짐, 처리된 것이 없으면 0
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
		
		return flag;
	}

	@Override //삭제하기
	public void memDelete(String userid) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from memberdb where userid ='" + userid + "'"; // userid는 문자열이므로 ''로 감싸야 함
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}
	
	// 상세보기
	@Override
	public MemberDTO findById(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		MemberDTO member = null;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from memberdb where userid = '" + userid + "'";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				member = new MemberDTO();
				member.setName(rs.getString("name"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAdmin(rs.getInt("admin"));
				member.setUserid(rs.getString("userid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return member;
	}

	// 아이디 중복 확인
	@Override
	public String idCheck(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes"; // id 사용 가능
		
		try {
			con = getConnection();
			String sql = "select * from memberdb where userid = '" + userid + "'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs가 존재한다 -> 테이블에 이미 존재하는 userid라는 뜻 -> 중복되므로 사용 불가능
				flag="no"; // id 사용 불가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}

	//로그인체크
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int flag = -1; // 회원 아님
		
		try {
			con = getConnection();
			String sql = "select userid, pwd, admin from memberdb where userid='" + userid +"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { //rs가 있다 -> userid가 DB에 있음(회원은 맞음)
				if(rs.getString("pwd").equals(pwd)) { // id, pwd가 다 맞음 -> 사용자가 입력한 pwd와 rs가 가지고 있는 pwd가 동일할 때
					flag = rs.getInt("admin"); //0 : 일반회원, 1 : 관리자
				} else { // 비번 오류 -> id는 맞지만 비밀번호는 틀림
					flag = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}
	
	// 개수
	@Override
	public int getCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select count(*) from memberdb";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// 닫기
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
