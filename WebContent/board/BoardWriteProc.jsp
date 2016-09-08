<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>

<%request.setCharacterEncoding("euc-kr"); %>

<%
// ------------------ ������ �̸��� ũ�⸦ ���� ���� ����
String filename = null;
int filesize = 0;

// ------------------ ���� ���ε� ������ ����
String saveFolder = "upload_files";


// -------------------- MultipartRequest ��ü ����
MultipartRequest multi = null;

// ------------------ MultipartRequest Ŭ���� �������� �Ķ���� ����
ServletContext context = getServletContext();
String realFolder = context.getRealPath(saveFolder);

int sizeLimit = 10*1024*1024;
String encType = "euc-kr";
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

// ------------------ ��ü ����
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	// ----------------- JDBC ����
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ----------------- MultipartRequest ��ü ����(���Ͼ��ε� �߻�)
	multi = new MultipartRequest(request, realFolder, sizeLimit, encType, policy);
	
	// ----------------- ���ε�Ǿ� ������ ����� ���� �̸�
	filename = multi.getFilesystemName("filename");
	
	// ----------------- ������ ���ε� �Ǹ� ����Ǵ� ����   file��ü�� ����� ������ ũ�� ����
	if(filename != null) {
		// -------------------- <FORM>�� ���� �Է¾�� �̸�
		Enumeration files = multi.getFileNames();
		
		// -------------------- Enumeration ��ü�� �ִ� ������ �̸��� ����
		String fname = (String)files.nextElement();
		// -------------------- �Է¾���� ���� ���ε�� File ��ü�� ����
		File file = multi.getFile(fname);
		
		// -------------------- ������ ũ�� ��� (����Ʈ)
		filesize = (int)file.length();
		
	}
	
	// ------------------- ���۵� ������ ����
	String name = multi.getParameter("name");
	String mail = multi.getParameter("mail");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String pass = multi.getParameter("pass");
	
	// -------------------- ���ο� ���ڵ��� RcdNo�� GrpNo ����
	String Query1 = "SELECT max(RcdNo), max(GrpNo) FROM board";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	rs.next();
	
	int uid = (rs.getInt(1)) + 1;
	int gid = (rs.getInt(2)) + 1;
	
	// -------------------- ��Ÿ �Է� ������ ����
	
	int refer = 0;
	int level = 0;
	int order = 1;
	long now = System.currentTimeMillis();
	
	// --------------------- �Է� ���� ����
	String Query2 = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(Query2);
	pstmt.setInt(1,uid);
	pstmt.setInt(2,gid);
	pstmt.setString(3,name);
	pstmt.setString(4,mail);
	pstmt.setString(5,subject);
	pstmt.setString(6,content);
	pstmt.setString(7,pass);
	pstmt.setString(8,filename);
	pstmt.setInt(9,filesize);
	pstmt.setLong(10,now);
	pstmt.setInt(11,refer);
	pstmt.setInt(12,level);
	pstmt.setInt(13,order);
	
	pstmt.executeUpdate();
	
} catch (IOException e) {
	e.printStackTrace();
} catch (SQLException e) {
	out.print(e);
} finally {
	// ------------------------ ������ ��ü�� ���ſ� ������ �̵�
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	response.sendRedirect("BoardList.jsp");
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