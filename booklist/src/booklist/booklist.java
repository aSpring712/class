package booklist;

import java.sql.Connection;    // java라는 폴더, sql이라는 폴더에 Connection이라는 파일안에 있는 걸 import(수입) 들고 오겠다.
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class booklist {
	Connection con;         /* 1번 DB와 연결(Connection이라는 클래스와 연결한다.)
							   클래스는 변수와 메소드(procedure, function)를 가지고 있다. */
	public booklist() {     /* exec pkg1.proc1()  -- pkg1 패키지(클래스), proc1 프로시저(메소드) */
		String ur1 = "jdbc:oracle:thin:@localhost:1521:XE";  /* 뒤에 세개는 호스트 이름:포트:SID */
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		String userid = "madang";
		String pwd = "madang";
		
		try { /* 드라이버를 찾는 과정 */
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {                  /* ojdbc.jar를 찾지 못한다면 오류가 난다 */
			e.printStackTrace();
		}
		
		try { /* 데이터베이스를 연결하는 과정 */
			System.out.println("데이터베이스 연결 준비 ...");
			con = DriverManager.getConnection(ur1, userid, pwd); // ojdbc6.jar에 연결(ur1, 아이디, 비밀번호 -> 각각 위에 있음)
			System.out.println("데이터베이스 연결 성공");
		} catch (SQLException e) {                           /* 질의문장이 잘못되면 오류가 난다 */
			e.printStackTrace();			
		}
	}
	
	private void sqlRun() {
		String query = "SELECT * FROM BOOK";                 /* SQL문 */
		try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
			Statement stmt = con.createStatement();          /* 2번 : 질의 날림 */
			ResultSet rs = stmt.executeQuery(query);         /* 3번 : ResultSet에서 받는다 */
			System.out.println("BOOK NO \tBOOK NAME \t\tPUBLISHER \tPRICE");
			while (rs.next()) {                              /* rs가 결과창인데 next 한 줄씩 내려감(Oracle에서 Cursor처럼) */
				System.out.print("\t" + rs.getInt(1));       /* 1열 */
				System.out.print("\t" + rs.getString(2));    /* 2열 */
				System.out.print("\t\t" + rs.getString(3));  /* 3열 */
				System.out.println("\t" + rs.getInt(4));     /* 4열 */
			}                                                /* print 출력, println 출력하고 줄바꿈 */
			
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		booklist so = new booklist();
		so.sqlRun();
	}
}
