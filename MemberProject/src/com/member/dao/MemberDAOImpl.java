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

// ���Ǹ� �س��Ҵ� �������̽� MemberDAO�� ����
public class MemberDAOImpl implements MemberDAO {

	// DB ����
	private static MemberDAOImpl instance = new MemberDAOImpl(); // �̱������� ����
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	@Override // �߰�
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
			ps.executeUpdate(); // ����
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

	@Override // ��ü����
	public ArrayList<MemberDTO> memList() {
		Connection con = null;
		Statement st = null; // sql���� ?�� �ȵ��Ƿ�
		ResultSet rs = null;
		ArrayList<MemberDTO> arr = new ArrayList<>(); // �������� ��� ���̹Ƿ�
		
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
				arr.add(member); // dao���� ����ϴ� arr
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// �����ϱ�
	@Override
	public int memUpdate(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "update memberdb set name=?, pwd=?, email=?, admin=?, phone=? where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName()); // 1, 2 �̷��� ?�� ��ġ
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getEmail());
			ps.setInt(4, member.getAdmin());
			ps.setString(5, member.getPhone());
			ps.setString(6, member.getUserid());
			flag = ps.executeUpdate(); //update�Ǹ� ó���� ���� ���� return �Ǿ���, ó���� ���� ������ 0
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
		
		return flag;
	}

	@Override //�����ϱ�
	public void memDelete(String userid) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from memberdb where userid ='" + userid + "'"; // userid�� ���ڿ��̹Ƿ� ''�� ���ξ� ��
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}
	
	// �󼼺���
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

	// ���̵� �ߺ� Ȯ��
	@Override
	public String idCheck(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes"; // id ��� ����
		
		try {
			con = getConnection();
			String sql = "select * from memberdb where userid = '" + userid + "'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs�� �����Ѵ� -> ���̺� �̹� �����ϴ� userid��� �� -> �ߺ��ǹǷ� ��� �Ұ���
				flag="no"; // id ��� �Ұ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}

	//�α���üũ
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int flag = -1; // ȸ�� �ƴ�
		
		try {
			con = getConnection();
			String sql = "select userid, pwd, admin from memberdb where userid='" + userid +"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { //rs�� �ִ� -> userid�� DB�� ����(ȸ���� ����)
				if(rs.getString("pwd").equals(pwd)) { // id, pwd�� �� ���� -> ����ڰ� �Է��� pwd�� rs�� ������ �ִ� pwd�� ������ ��
					flag = rs.getInt("admin"); //0 : �Ϲ�ȸ��, 1 : ������
				} else { // ��� ���� -> id�� ������ ��й�ȣ�� Ʋ��
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
	
	// ����
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
	
	// �ݱ�
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
