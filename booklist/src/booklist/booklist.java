package booklist;

import java.sql.Connection;    // java��� ����, sql�̶�� ������ Connection�̶�� ���Ͼȿ� �ִ� �� import(����) ��� ���ڴ�.
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class booklist {
	Connection con;         /* 1�� DB�� ����(Connection�̶�� Ŭ������ �����Ѵ�.)
							   Ŭ������ ������ �޼ҵ�(procedure, function)�� ������ �ִ�. */
	public booklist() {     /* exec pkg1.proc1()  -- pkg1 ��Ű��(Ŭ����), proc1 ���ν���(�޼ҵ�) */
		String ur1 = "jdbc:oracle:thin:@localhost:1521:XE";  /* �ڿ� ������ ȣ��Ʈ �̸�:��Ʈ:SID */
		/* 11g express edition�� orcl ��� XE�� �Է��Ѵ�. */
		String userid = "madang";
		String pwd = "madang";
		
		try { /* ����̹��� ã�� ���� */
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹� �ε� ����");
		} catch (ClassNotFoundException e) {                  /* ojdbc.jar�� ã�� ���Ѵٸ� ������ ���� */
			e.printStackTrace();
		}
		
		try { /* �����ͺ��̽��� �����ϴ� ���� */
			System.out.println("�����ͺ��̽� ���� �غ� ...");
			con = DriverManager.getConnection(ur1, userid, pwd); // ojdbc6.jar�� ����(ur1, ���̵�, ��й�ȣ -> ���� ���� ����)
			System.out.println("�����ͺ��̽� ���� ����");
		} catch (SQLException e) {                           /* ���ǹ����� �߸��Ǹ� ������ ���� */
			e.printStackTrace();			
		}
	}
	
	private void sqlRun() {
		String query = "SELECT * FROM BOOK";                 /* SQL�� */
		try { /* �����ͺ��̽��� ���� ����� �������� ���� */
			Statement stmt = con.createStatement();          /* 2�� : ���� ���� */
			ResultSet rs = stmt.executeQuery(query);         /* 3�� : ResultSet���� �޴´� */
			System.out.println("BOOK NO \tBOOK NAME \t\tPUBLISHER \tPRICE");
			while (rs.next()) {                              /* rs�� ���â�ε� next �� �پ� ������(Oracle���� Cursoró��) */
				System.out.print("\t" + rs.getInt(1));       /* 1�� */
				System.out.print("\t" + rs.getString(2));    /* 2�� */
				System.out.print("\t\t" + rs.getString(3));  /* 3�� */
				System.out.println("\t" + rs.getInt(4));     /* 4�� */
			}                                                /* print ���, println ����ϰ� �ٹٲ� */
			
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
