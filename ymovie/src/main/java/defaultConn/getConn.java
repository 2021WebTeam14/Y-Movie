package defaultConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import config.configLoad;

public class getConn {
	private String jdbcDriver = "jdbc:mysql://";
	private String jdbcDriverRear = "/ymovie?allowPublicKeyRetrieval=true&useSSL=false";
	private String dbUser;
	private String dbPass;
	public getConn() {
		ArrayList<String> Info = new ArrayList<String>();
		try {
			Info = configLoad.readByLine();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		jdbcDriver += Info.get(0);
		jdbcDriver += jdbcDriverRear;
		dbUser = Info.get(1);
		dbPass = Info.get(2);
	}
	public Connection getConnection() throws Exception {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return con;		
	}
}