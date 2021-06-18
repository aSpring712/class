package com.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.sql.DataSource;
import javax.websocket.CloseReason.CloseCode;

import com.sun.jdi.connect.spi.ClosedConnectionException;

public class AddressDAO {
	// DB ���� ==> �̱���(��ü�� new�ؼ� ��ü���� ����� ���� �ƴϰ�, ��ü�� �ϳ��� ���� ����ϰڴٴ� �ǹ� -> static :
	// �ϳ��� ���� �����ϴ� ����)
	private static AddressDAO instance = new AddressDAO();

	public static AddressDAO getInstance() {
		return instance; // �� �� ������� ���� ��� return ���Ѽ� ����ϰڴ�
	} // �긦 ��򰡿��� ȣ���� ������ new �ؼ� ���� ����� ���� �ƴ϶� ���� �ѹ� ����� ���� �� ��� �����

	private Connection getConnection() throws Exception { // java.sql import
		Context initCtx = new InitialContext(); // javax.naming import
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); // �� ������ ���� �ؿ� jdbc/jsp �̸� ��� -> ��Ĺ���� �� ������ �������� �Ʒ���
																	// �̸��� ã�ƶ�
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); // java.sql import, lookup() ã�ƶ� -> �׷��� hr������ ���� ����
		// return null; // �ϴ� ���� ���ֱ� ���ؼ� return
		return ds.getConnection();
	}

	// �߰� -> ���� �Է��ϰ� [���] ��ư Ŭ�� �� �Է��� ������ DB�� ����
	public void addressInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = getConnection(); // DriverManager �� ��
			String sql = "insert into address values(address_seq.nextval, ?, ?, ?, ?)"; // �� ���̸� �Ƚ��ְ� ? ������ ���� �� �𸣰��� ->
																						// ?�� ���� �ִ´ٰ� ��
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName()); // ù��° ?���� �̸�
			ps.setString(2, ad.getAddr()); // �ι�° ?���� �ּ�
			ps.setString(3, ad.getZipcode()); // ����° ?���� �����ȣ
			ps.setString(4, ad.getTel()); // �׹�° ?���� ��ȭ��ȣ -> DB������ ����
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null); // ����ϸ� �� �ݾ��ֱ�
		}
	}

	// ����
	public int getCount(String field, String word) { // ��ü���⿡ ǥ�õǴ� ����Ʈ�� � �ִ��� ǥ��(�˻����� ���� �˻� ���ǿ� �´� ����Ʈ�� ǥ�õǰ� �� ������ ī��Ʈ �ؾ���)
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			if(word.equals("")) {
				sql = "select count(*) from address"; // �˻� ������ ���
			} else {
				sql = "select count(*) from address where " + field + " like '%" + word + "%'"; // �˻��� �� ���
			}
			
			st = con.createStatement();
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
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	// ��ü����(�˻�����) -> �̺κ� �ּ� �� list2.jsp���� ������
	public ArrayList<Address> getList() { 
		Connection con = null;
		Statement st = null; 
		ResultSet rs = null; 
		ArrayList<Address> arr = new ArrayList<>();
		
		try { 
			con = getConnection(); 
			String sql = "select * from address order by num"; 
			st = con.createStatement(); 
			rs = st.executeQuery(sql); 
			while(rs.next()) { 
				Address ad = new Address();
				ad.setAddr(rs.getString("addr")); 
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num")); 
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode")); 
				arr.add(ad); 
				} 
			} catch (Exception e) { 
				e.printStackTrace(); 
			} finally { 
				closeConnection(con, null, st, rs); 
			}
		return arr; 
	  }
	 

	// ��ü����(�˻� ����)
	public ArrayList<Address> getList(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<>();
		String sql = "";

		try {
			con = getConnection();
			if (word.equals("")) {
				sql = "select * from address order by num";
			} else {
				sql = "select * from address where " + field + " like '%" + word + "%' order by num";
			}
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Address ad = new Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getInt("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				arr.add(ad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	// �󼼺���
	public Address findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;

		try {
			con = getConnection();
			String sql = "select * from address where num = " + num; // num�� �����̹Ƿ� ����ǥX
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) { // �� ���� ���
				ad = new Address();
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

	// ����
	public void addressUpdate(Address ad) {
		Connection con = null;
		// Statement st = null; -> ����ǥ �����ϹǷ� PreparedStatement ���
		PreparedStatement ps = null;

		try {
			con = getConnection();
			String sql = "update address set name =?, zipcode=?, addr=?, tel=?  where num =?"; // detail.jsp���� �ѱ�� ����
																								// num ���� 4���̹Ƿ� ���� �ȵ�
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getAddr());
			ps.setString(4, ad.getTel());
			ps.setInt(5, ad.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

	// ����
	public void addressDelete(int num) { // ������ �����Ұ���, �⺻Ű num�� ���ڷ� �޾Ƽ� �ش� ���� ���� -> ���� �ʿ�
		// DB���� �۾�
		Connection con = null;
		Statement st = null;

		try {
			con = getConnection();
			String sql = "delete from address where num =" + num;
			// sql�� ����
			st = con.createStatement();
			st.executeUpdate(sql); // --> ����� ��(1���� �����Ǿ���), execute --> boolean(�����Ǿ���, �ȵǾ���..)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}

	// �����ȣ ã��
	public ArrayList<ZipCodeBean> zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeBean> zarr = new ArrayList<>();

		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%" + dong + "%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				ZipCodeBean zip = new ZipCodeBean();
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
}
