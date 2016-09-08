<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
// ------------------------- ������ ���� ����
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

// ------------------------- Ű���� ������ ����
String m_column = request.getParameter("column");
if(m_column == null) m_column = "";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key != null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}

// ------------------------- ���޵� ���̵�� �н����� ����
String user_id = request.getParameter("UserId");
String user_pass = request.getParameter("UserPass");

// ------------------------- ������ ��ü�� ����
String db_id = null;
String db_pass = null;
String db_name = null;

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	
	// ----------------------- JDBC ����
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ------------------------ �Է��� ���̵� ����� ���̵�� �н����� ����
	String Query1 = "SELECT UsrId, UsrPass, UsrName FROM member WHERE UsrId='" + user_id + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	if(rs.next()) {
		db_id = rs.getString(1);
		db_pass = rs.getString(2);
		db_name = rs.getString(3);
	} else {
		db_id = null;
		db_pass = null;
		db_name = null;
	}
	
	if( (user_id.equals(db_id)) && (user_pass.equals(db_pass)) ) {
		// ------------------------- ���̵�� �н����尡 ��ġ�� ���
		session.setAttribute("member_id", user_id);
		session.setAttribute("member_name", db_name);
		
		rs.close();
		stmt.close();
		conn.close();
		
		
		
		out.println("<script language=\"javascript\">");
		out.println("window.opener.location.reload()");
		out.println("window.close();");
		out.println("alert('ȯ���մϴ�.')");		
		out.println("</script>");
		out.flush();
	} else {
		// ------------------------ ���̵�� �н����尡 ��ġ���� ���� ���
		rs.close();
		stmt.close();
		conn.close();
		
		out.println("<script language=\"javascript\">");
		out.println("alert('���̵� �н����尡 �ٸ��ϴ�.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
} catch(SQLException e) {
	e.printStackTrace();
}



%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>



</body>
</html>