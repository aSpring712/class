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
	// DB 세팅 ==> 싱글톤(객체를 new해서 객체마다 만드는 것이 아니고, 객체를 하나만 만들어서 사용하겠다는 의미 -> static :
	// 하나만 만들어서 공유하는 개념)
	private static AddressDAO instance = new AddressDAO();

	public static AddressDAO getInstance() {
		return instance; // 한 번 만들어진 것을 계속 return 시켜서 사용하겠다
	} // 얘를 어딘가에서 호출할 때마다 new 해서 새로 만드는 것이 아니라 위에 한번 만들어 놓은 걸 계속 사용함

	private Connection getConnection() throws Exception { // java.sql import
		Context initCtx = new InitialContext(); // javax.naming import
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 이 가상의 폴더 밑에 jdbc/jsp 이름 등록 -> 톰캣에서 이 가상의 폴더에서 아래의
																	// 이름을 찾아라
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); // java.sql import, lookup() 찾아라 -> 그러면 hr계정에 접근 가능
		// return null; // 일단 오류 없애기 위해서 return
		return ds.getConnection();
	}

	// 추가 -> 내용 입력하고 [등록] 버튼 클릭 시 입력한 내용을 DB에 저장
	public void addressInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = getConnection(); // DriverManager 안 씀
			String sql = "insert into address values(address_seq.nextval, ?, ?, ?, ?)"; // 왜 열이름 안써주고 ? 쓰는지 아직 잘 모르겠음 ->
																						// ?에 값을 넣는다고 함
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName()); // 첫번째 ?에는 이름
			ps.setString(2, ad.getAddr()); // 두번째 ?에는 주소
			ps.setString(3, ad.getZipcode()); // 세번째 ?에는 우편번호
			ps.setString(4, ad.getTel()); // 네번째 ?에는 전화번호 -> DB순서랑 동일
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null); // 사용하면 꼭 닫아주기
		}
	}

	// 개수
	public int getCount(String field, String word) { // 전체보기에 표시되는 리스트가 몇개 있는지 표시(검색했을 때는 검색 조건에 맞는 리스트만 표시되고 그 개수만 카운트 해야함)
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			if(word.equals("")) {
				sql = "select count(*) from address"; // 검색 안했을 경우
			} else {
				sql = "select count(*) from address where " + field + " like '%" + word + "%'"; // 검색을 한 경우
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


	// 닫기
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


	// 전체보기(검색없음) -> 이부분 주석 시 list2.jsp에서 오류남
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
	 

	// 전체보기(검색 포함)
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

	// 상세보기
	public Address findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;

		try {
			con = getConnection();
			String sql = "select * from address where num = " + num; // num은 변수이므로 따옴표X
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) { // 한 번만 사용
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

	// 수정
	public void addressUpdate(Address ad) {
		Connection con = null;
		// Statement st = null; -> 물음표 존재하므로 PreparedStatement 사용
		PreparedStatement ps = null;

		try {
			con = getConnection();
			String sql = "update address set name =?, zipcode=?, addr=?, tel=?  where num =?"; // detail.jsp에서 넘기는 값은
																								// num 빼고 4개이므로 수정 안됨
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

	// 삭제
	public void addressDelete(int num) { // 누구를 삭제할건지, 기본키 num을 인자로 받아서 해당 내용 삭제 -> 인자 필요
		// DB연결 작업
		Connection con = null;
		Statement st = null;

		try {
			con = getConnection();
			String sql = "delete from address where num =" + num;
			// sql문 실행
			st = con.createStatement();
			st.executeUpdate(sql); // --> 결과의 수(1개가 삭제되었다), execute --> boolean(삭제되었다, 안되었다..)
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}

	// 우편번호 찾기
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
