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
	
	//추가
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
		
	// 전체보기
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
	
	// 전체보기 검색
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
	
	// 상세보기
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
	
	// 수정하기
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
	
	// 삭제
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
		
	//개수
	public int addrCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		
		try {
			con = getConnection();
			String sql = "select count(*) from address"; // 결과 count(*) | 3 이런식으로 나옴
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs가 있다면, rx결과의 head를 보지 말고 내려가라 -> next(안해주면 column명만 가르킴..)!! 결과값은 count한 결과 개수 1개만 나오니까 if 썼고, 결과 값이 여러개(여러 행이 쭉~) 나오면 while(rs.next()) 이걸 써야 함 -> 값이 없을 때까지 next.. next.. 하면서 내려감. 값 없으면 false로 while문 그만 돔  
				count = rs.getInt(1); // rs에 column명으로 접근하거나 위치로 접근 가능 -> column명은 count(*)로 되어있는데 sql문실행 결과 열이름처럼 나오는것이지 그런 column명(0번째)은 없음, 그러므로 1번째에 있는 값(결과값) 가지고 옴 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// 검색 시 개수
	public int searchCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) from address where " + field + " like '%" + word + "%'"; // 결과 count(*) | 3 이런식으로 나옴
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // rs가 있다면, rx결과의 head를 보지 말고 내려가라 -> next(안해주면 column명만 가르킴..)!! 결과값은 count한 결과 개수 1개만 나오니까 if 썼고, 결과 값이 여러개(여러 행이 쭉~) 나오면 while(rs.next()) 이걸 써야 함 -> 값이 없을 때까지 next.. next.. 하면서 내려감. 값 없으면 false로 while문 그만 돔  
				count = rs.getInt(1); // rs에 column명으로 접근하거나 위치로 접근 가능 -> column명은 count(*)로 되어있는데 sql문실행 결과 열이름처럼 나오는것이지 그런 column명(0번째)은 없음, 그러므로 1번째에 있는 값(결과값) 가지고 옴 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
	// 우편번호검색
	public ArrayList<ZipCodeVO> getZipcode(String dong) {
		Connection con = null; // DB 연결 객체
		Statement st = null; // sql을 실행하기 위한 객체
		ResultSet rs = null; // sql 결과 객체 (select는 결과가 있음)
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
	
	// 닫기
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
