<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
//---------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

//---------------------- 키워드 데이터 추출
String m_column = request.getParameter("column");
if(m_column == null) m_column = "";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key != null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}

// --------------------- JDBC를 위한 객체 선언
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs1 = null;
ResultSet rs2 = null;


try {
	// -------------------- JDBC 설정
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
	// --------------------- 전송된 아이디와 동일한 아이디 추출
	String id = request.getParameter("UserId");

	String Query1 = "SELECT count(UsrNo) FROM member WHERE UsrId='" + id + "'";
	stmt = conn.createStatement();
	rs1 = stmt.executeQuery(Query1);
	rs1.next();
	
	int same_id = rs1.getInt(1);
	
	if(same_id == 0) {
		// -------------------------- 데이터베이스에 동일한 아이디가 존재하는 않는 경우
		
		// -------------------------- 전송된 나머지 <FORM> 데이터 추출
		
		String name = request.getParameter("UserName");
		String UserId = request.getParameter("UserId");
		String UserPass = request.getParameter("UserPass");
		String ReUserPass = request.getParameter("ReUserPass");
		String PassQ = request.getParameter("PassQ");
		String PassA = request.getParameter("PassA");
		String UserTel1 = request.getParameter("UserTel1");
		String UserTel2 = request.getParameter("UserTel2");
		String UserTel3 = request.getParameter("UserTel3");
		String UserBirth = request.getParameter("UserBirth");
		
		long now = System.currentTimeMillis();
		
		// -------------------------- 새로운 회원 정보 레코드의 UsrNo 필드 값 결정
		String Query2 = "SELECT max(UsrNo) FROM member";
		stmt = conn.createStatement();
		rs2 = stmt.executeQuery(Query2);
		
		rs2.next();
		int uno = (rs2.getInt(1)) + 1;
		
		
		
		// -------------------------- 새로운 회원 레코드 저장
		String Query3 = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query3);
		
		pstmt.setInt(1, uno);
		pstmt.setString(2, name);
		pstmt.setString(3, UserId);
		pstmt.setString(4, UserPass);
		pstmt.setString(5, PassQ);
		pstmt.setString(6, PassA);
		pstmt.setString(7, UserTel1);
		pstmt.setString(8, UserTel2);
		pstmt.setString(9, UserTel3);
		pstmt.setString(10, UserBirth);
		pstmt.setInt(11, 0);
		pstmt.setLong(12, now);
		
		pstmt.executeUpdate();
		
		// ---------------------------- 객체의 종료와 페이지의 이동
		rs2.close();
		rs1.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
		String retURL = "../board/BoardList.jsp?column=" + m_column + "&key=" + m_encoded_key + "&CurrentPage=" + m_cp;
		
		out.println("<script language=\"javascript\">");
		out.println("alert('회원가입이 완료되었습니다. \\n 아이디와 비밀번호로 로그인하세요.')");
		out.println("location.replace('" + retURL + "')");
		out.println("</script>");
		out.flush();
		
	} else {
		// ------------------------- DB에 동일한 아이디가 존재하는 경우
		rs1.close();
		stmt.close();
		conn.close();
		
		out.println("<script language=\"javascript\">");
		out.println("alert('동일한 아이디가 존재합니다.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
	
} catch (SQLException e) {
	out.print(e);
}
			
			
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>