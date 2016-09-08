package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import Bean.Menu;
import Bean.Schedule;


public class ScheduleDB {

		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		public void connect() {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
			String jdbcId = "jspuser";
			String jdbcPw = "jsppass";
			try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);	
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		

		public void disconnect()
		{
			try{
				if(rs!=null) rs.close(); 				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		public ArrayList<Schedule> getBookedSchedule(String key)
		{
			if(key == "") {
				return null;
			}
			ArrayList<Schedule> list = new ArrayList<Schedule>();
			String sql = "select * from schedule where day = ?";
			try {
				stmt=conn.prepareStatement(sql);
				stmt.setString(1,key);
				rs =  stmt.executeQuery();
				
				while(rs.next())
				{
					Schedule schedule = new Schedule();
					schedule.setSno(rs.getInt(1));
					schedule.setDay(rs.getString(2));
					schedule.setStart_time(rs.getInt(3));
					schedule.setEnd_time(rs.getInt(4));
					schedule.setUserId(rs.getString(5));
					schedule.setMenu(rs.getString(6));
					schedule.setDesigner(rs.getString(7));
					schedule.setComment(rs.getString(8));
					schedule.setPrice(rs.getInt(9));											
					
					list.add(schedule);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
			
		}
		
		
		public ArrayList<Menu> getAllMenu()
		{
			
			ArrayList<Menu> list = new ArrayList<Menu>();
			String sql = "SELECT * FROM menu";
			
			try {
				stmt = conn.prepareStatement(sql);
				rs =  stmt.executeQuery();
				
				while(rs.next())
				{
					Menu menu = new Menu();
					menu.setMname(rs.getString(1));
					menu.setLeadtime(rs.getInt(2));
					menu.setPrice(rs.getInt(3));																
					
					list.add(menu);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
			
		}
		
		
		public int getSno() {
			int sno=0;
			String sql = "SELECT max(sno) FROM schedule";
			
			try {
				stmt = conn.prepareStatement(sql);
				rs =  stmt.executeQuery();
				rs.next();
				sno = rs.getInt(1);
			} catch(SQLException e) {
				e.printStackTrace();
			}				
			return sno;
		}
		
		
		public void addSchedule(Schedule sche) {
			
			String sql = "INSERT into schedule values(?,?,?,?,?,?,?,?,?);";
			
			try{				
				stmt=conn.prepareStatement(sql);
				
				stmt.setInt(1, sche.getSno());				
				stmt.setString(2, sche.getDay());				
				stmt.setInt(3,sche.getStart_time());
				stmt.setInt(4, sche.getEnd_time());
				stmt.setString(5, sche.getUserId());
				stmt.setString(6, getMenuName(sche.getMenu()));
				stmt.setString(7, sche.getDesigner());
				stmt.setString(8, sche.getComment());
				stmt.setInt(9, sche.getPrice());				
				
				stmt.executeUpdate();				
				
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}				
		
		public String getMenuName(String menu) {
			if(menu.equals("Menu1")) {
				menu = "각질&파라핀";
			}
			if(menu.equals("Menu2")) {
				menu = "젤기본";
			}
			if(menu.equals("Menu3")) {
				menu = "젤패디기본";
			}
			
			return menu;
		}
		
		
		
		
		
		
		
		
}
