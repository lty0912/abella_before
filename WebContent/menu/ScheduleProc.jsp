<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
import="java.util.*,java.sql.*,java.net.URLEncoder,DAO.*,Bean.*"%>

<jsp:useBean id="dbcon" scope="session" class="DAO.ScheduleDB"></jsp:useBean>
<jsp:useBean id="schedule" scope="session" class="Bean.Schedule"></jsp:useBean>


<%request.setCharacterEncoding("utf-8");%>
<%
	
	dbcon.connect();
	// sno 값 지정
	int sno = dbcon.getSno();	
	sno = sno + 1;
	
	String name = request.getParameter("Name");
	String day = request.getParameter("Year") +" " + request.getParameter("Month") + " " + request.getParameter("Day");
	String menu = request.getParameter("Menu");
	String tel = request.getParameter("Tel1") + request.getParameter("Tel2") + request.getParameter("Tel3");
	int start_time = Integer.parseInt(request.getParameter("Stime"));
	int end_time = Integer.parseInt(request.getParameter("Etime"));
	int price = Integer.parseInt(request.getParameter("Price"));
	String designer = request.getParameter("Designer");
	String comment = request.getParameter("Comment");
	
	
	
	Schedule sche = new Schedule();
	sche.setSno(sno); 
	sche.setUserId(name);
	sche.setDay(day);
	sche.setMenu(menu);
	sche.setStart_time(start_time);
	sche.setEnd_time(end_time);
	sche.setPrice(price);
	sche.setDesigner(designer);
	sche.setComment(comment);
	
	dbcon.addSchedule(sche);
	
	dbcon.disconnect();
	
	%>
	
	
<script type="text/javascript">
	window.opener.location.replace('Schedule.jsp');
	window.close();
</script>
    