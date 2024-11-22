package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	
	private static GetConn _instance = null;
	
	private Connection conn = null;
	
	private String driver ="com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javagroup3";
	private String user = "root";
	private String password = "1234";  // 학원은 bodum1004 , 집은 bodum1004
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!");
		}catch(SQLException e) {
			System.out.println("데이터베이스 연동 실패!");
		}
	}
	
	public static GetConn getInstance() {
		if(_instance == null) {
			_instance = new GetConn();
		}
		return _instance;
	}
	
	public Connection getConnection() {
		return conn;
	}
		
	/**
	 * 데이터베이스 컨넥션을 닫는다. 만들어만 놨다. 호출하진 말자..
	 */
	public void closeConnection() {
		 try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("closeConnection e:"+e.getMessage());
		}
	}
	
}
