package com.jqueryAddress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JAddressDAO {
	private static JAddressDAO instance = new JAddressDAO();
	public static JAddressDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	//�߰�
	public void insert(AddressVO ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address values(address_seq.nextval, ?, ?, ?, ?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getAddr());
			ps.setString(3, ad.getZipcode());
			ps.setString(4, ad.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
		
	// ��ü����
	public ArrayList<AddressVO> getList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> arr = new ArrayList<>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddressVO avo = new AddressVO();
				avo.setAddr(rs.getString("addr"));
				avo.setName(rs.getString("name"));
				avo.setNum(rs.getInt("num"));
				avo.setTel(rs.getString("tel"));
				avo.setZipcode(rs.getString("zipcode"));
				arr.add(avo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return arr;
	}
	
	// ��ü���� �˻�
	public ArrayList<AddressVO> searchList(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> sarr = new ArrayList<>();
		
		try {
			con = getConnection();
			String sql = "select * from address where " + field + " like '%" + word + "%' order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddressVO avo = new AddressVO();
				avo.setAddr(rs.getString("addr"));
				avo.setName(rs.getString("name"));
				avo.setNum(rs.getInt("num"));
				avo.setTel(rs.getString("tel"));
				avo.setZipcode(rs.getString("zipcode"));
				sarr.add(avo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return sarr;
	}
	
	// �󼼺���
	public AddressVO detail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		AddressVO ad = null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num = " + num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				ad = new AddressVO();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return ad;
	}
	
	// �����ϱ�
	public void update(AddressVO avo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "update address set name =?, zipcode =?, addr =?, tel =? where num =?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getZipcode());
			ps.setString(3, avo.getAddr());
			ps.setString(4, avo.getTel());
			ps.setInt(5, avo.getNum());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	
	// ����
		public void delete(int num) {
			Connection con = null;
			Statement st = null;
			
			try {
				con = getConnection();
				String sql = "delete from address where num =" + num;
				st = con.createStatement();
				st.executeUpdate(sql);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeConnection(con, null, st, null);
			}
		}
		
	//����
	public int addrCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		
		try {
			con = getConnection();
			String sql = "select count(*) from address"; // ��� count(*) | 3 �̷������� ����
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs�� �ִٸ�, rx����� head�� ���� ���� �������� -> next(�����ָ� column�� ����Ŵ..)!! ������� count�� ��� ���� 1���� �����ϱ� if ���, ��� ���� ������(���� ���� ��~) ������ while(rs.next()) �̰� ��� �� -> ���� ���� ������ next.. next.. �ϸ鼭 ������. �� ������ false�� while�� �׸� ��  
				count = rs.getInt(1); // rs�� column������ �����ϰų� ��ġ�� ���� ���� -> column���� count(*)�� �Ǿ��ִµ� sql������ ��� ���̸�ó�� �����°����� �׷� column��(0��°)�� ����, �׷��Ƿ� 1��°�� �ִ� ��(�����) ������ �� 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// �˻� �� ����
	public int searchCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) from address where " + field + " like '%" + word + "%'"; // ��� count(*) | 3 �̷������� ����
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs�� �ִٸ�, rx����� head�� ���� ���� �������� -> next(�����ָ� column�� ����Ŵ..)!! ������� count�� ��� ���� 1���� �����ϱ� if ���, ��� ���� ������(���� ���� ��~) ������ while(rs.next()) �̰� ��� �� -> ���� ���� ������ next.. next.. �ϸ鼭 ������. �� ������ false�� while�� �׸� ��  
				count = rs.getInt(1); // rs�� column������ �����ϰų� ��ġ�� ���� ���� -> column���� count(*)�� �Ǿ��ִµ� sql������ ��� ���̸�ó�� �����°����� �׷� column��(0��°)�� ����, �׷��Ƿ� 1��°�� �ִ� ��(�����) ������ �� 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// �����ȣ�˻�
	public ArrayList<ZipCodeVO> getZipcode(String dong) {
		Connection con = null; // DB ���� ��ü
		Statement st = null; // sql�� �����ϱ� ���� ��ü
		ResultSet rs = null; // sql ��� ��ü (select�� ����� ����)
		ArrayList<ZipCodeVO> zarr = new ArrayList<>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%" + dong + "%'";
			
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCodeVO zip = new ZipCodeVO();
				zip.setBunji(rs.getString("bunji"));
				zip.setDong(rs.getString("dong"));
				zip.setGugun(rs.getString("gugun"));
				zip.setSeq(rs.getInt("seq"));
				zip.setSido(rs.getString("sido"));
				zip.setZipcode(rs.getString("zipcode"));
				zarr.add(zip);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return zarr;
	}
	
	// �ݱ�
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		try {
			if(rs != null) 
				rs.close();
			if(st != null) 
				st.close();
			if(ps != null) 
				ps.close();
			if(con != null) 
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
