package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDB {
	private String userID;
	private String userName;
	private String userPassword;
	private boolean userAttend;
	
	private Connection con;
	private ResultSet rs;
	private int r;
	
	public UserDB() {
		try {
			String DB_SERVER = "localhost:3306";  // MySQL ��ġ�� ����� ��Ʈ�� �����ʿ�
			String DB_USERNAME = "root";          // MySQL ��ġ�� ����� user �� �����ʿ�
			String DB_PASSWORD = "123456";   // MySQL ��ġ�� ����� user �� �����ʿ�
			String DB_DATABASE = "AUproject";       // db �׽�Ʈ �� ������ db �� ���� �ʿ�
			String DB_TABLE = "user";          // db �׽�Ʈ �� ������ table �� �����ʿ�

			String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(jdbcUrl, DB_USERNAME, DB_PASSWORD);
			  
			//String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			//String dbID = "root";
			//String dbPassword = "PASSWORD";
			//Class.forName("com.mysql.jdbc.Driver");
			//con = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// �α���
	/*
	 * -2: ���̵����
	 * -1: ��������
	 * 0: ��й�ȣ Ʋ��
	 * 1: ����
	 */
	public int login(String userID, String userPassword) {
		try {
			PreparedStatement pst = con.prepareStatement("SELECT password FROM user WHERE id_num = ?");
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getString(1).equals(userPassword) ? 1 : 0;
			} else {
				return -2;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// �ߺ����� Ȯ��
	public boolean ID_Check(String userID) {
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE id_num = ?");
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// ȸ������
	/*
	 * -1: ��������
	 * 0: �̹� �����ϴ� ���̵�
	 * 1: ����
	 */
	public int join(UserDB UserDB) {
		if(!ID_Check(UserDB.getUserID())) return 0;
		
		try {
			PreparedStatement pst = con.prepareStatement("insert into user(name, id_num, password) values (?,?,?)");
			pst.setString(2, UserDB.getUserID());
			pst.setString(3, UserDB.getUserPassword());
			pst.setString(1, UserDB.getUserName());
			return pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// Ư�� ���� ������ ��������
	public UserDB getUser(String userID) {
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE id_num = ?");
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				UserDB userDB = new UserDB();
				userDB.setUserID(rs.getString(1));
				userDB.setUserPassword(rs.getString(2));
				userDB.setUserName(rs.getString(3));
				userDB.setUserAttend(rs.getBoolean(4));
				return userDB;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ��� ������ ��������
	public ArrayList<UserDB> getUserAll() {
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user");
			rs = pst.executeQuery();
			ArrayList<UserDB> users = new ArrayList<UserDB>();
			
			while (rs.next()) {
				UserDB userDB = new UserDB();
				userDB.setUserName(rs.getString(2));
				userDB.setUserID(rs.getString(3));
				userDB.setUserPassword(rs.getString(4));
				userDB.setUserAttend(rs.getBoolean(5));
				users.add(userDB);
			}
			return users;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() { 
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAttend() {
		if(userAttend == false) {
			return "X";
		} else {
			return "O";
		}
	}
	public void setUserAttend(boolean userAttend) {
		this.userAttend = userAttend;
	}
	
	public void checkAttend(String userID) {  // ���� ���̵�� �ش� ���� �⼮ üũ
		try {
			PreparedStatement pst = con.prepareStatement("UPDATE user SET attend=true WHERE id_num = ?");
			pst.setString(1, userID);
			r = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}
	
	public String getUserNamefromID(String userID) {  // ���� ���̵�� ���� �̸� ��������
		try {
			PreparedStatement pst = con.prepareStatement("SELECT name FROM user WHERE id_num = ?");
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<String> getUserNameList() {  // ���� �̸� ����Ʈ�� ��������
		try {
			PreparedStatement pst = con.prepareStatement("SELECT name FROM user");
			rs = pst.executeQuery();
			
			ArrayList<String> users = new ArrayList<String>();
			while (rs.next()) {
				users.add(rs.getString(1));
			}
			return users;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
