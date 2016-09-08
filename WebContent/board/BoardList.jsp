<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%

// --------------------- 변수 및 객체 선언
	Connection conn = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	int TotalRecords = 0;
	
	// ----------------- 페이지 내비게이션에 필요한 변수 지정
	int CurrentPage=0;
	int Number=0;
	int TotalPages = 0;
	int TotalPageSets = 0;
	int CurrentPageSet = 0;
	
	// ------------------ 페이지의 크기와 페이지 집합의 크기 지정
	int PageRecords = 10;
	int PageSets = 10;
	
	// ------------------ 페이지 번호 전달이 없을 경우 페이지 번호의 지정
	if(request.getParameter("CurrentPage") == null) {
		CurrentPage = 1;
	} else {
		CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
	}
	
	String cntQuery="";
	String listQuery="";
	String encoded_key="";
	
	// ----------------- 페이지별 시작 레코드 인덱스 추출
	int FirstRecord = PageRecords*(CurrentPage-1);	
	
	// ----------------- 검색 데이터 추출
	String column = request.getParameter("column");		
	
	if (column == null)  column="";	
	
	String key = request.getParameter("key");
	if(key!=null) {
		encoded_key = URLEncoder.encode(key,"euc-kr");
	} else {
		key="";
	}
		
	try {
		// -------------- JDBC 설정
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
		String jdbcId = "jspuser";
		String jdbcPw = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		cntQuery = "SELECT count(RcdNo) FROM board WHERE 1=1 ";  // 레코드 수를 추출하기 위한 질의
		listQuery = "SELECT RcdNo, UsrSubject, UsrName, UsrDate, UsrRefer, RcdLevel FROM board WHERE 1=1 ";  // List에 출력할 레코드를 추출하는 질의
		// --------------- 질의의 생성과 객체의 생성
		if(!(column.equals("") || key.equals(""))) {
			cntQuery += "AND " + column + " LIKE '%" + key + "%'";
			listQuery += "AND " + column + " LIKE '%" + key + "%'"; 
		}
		listQuery += " ORDER BY GrpNo DESC, RcdOrder ASC LIMIT " + FirstRecord + "," + PageRecords;
		
		pstmt1 = conn.prepareStatement(cntQuery);
		rs1 = pstmt1.executeQuery();
		pstmt2 = conn.prepareStatement(listQuery);
		rs2 = pstmt2.executeQuery();
		
		// --------------- 전체 레코드 수 추출
		rs1.next();
		TotalRecords = rs1.getInt(1);		
		// --------------- 페이지별 가상 시작번호 생성		
		Number = TotalRecords - (CurrentPage-1)*PageRecords;

		
		
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>	
	<TITLE>게시글 리스트</TITLE>
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>후기 게시판 ( 리스트 )</B></FONT></TD>
	</TR>
</TABLE>


 
<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=45><B>번호</B></TD>
		<TD WIDTH=395><B>제목</B></TD>
		<TD WIDTH=65><B>작성자</B></TD>
		<TD WIDTH=70><B>작성일</B></TD>
		<TD WIDTH=45><B>조회수</B></TD>
	</TR>
	
	<%	
		// ----------- 순환문을 이용한 레코드 출력 시작
		while(rs2.next()) {
			int rno = rs2.getInt("RcdNo");
			
			String subject = rs2.getString("UsrSubject");
			
			String name = rs2.getString("UsrName");
			
			long date = rs2.getLong("UsrDate");
			SimpleDateFormat Current = new SimpleDateFormat("yyyy/MM/dd");
			String today = Current.format(date);
			
			int refer = rs2.getInt("UsrRefer");		
			int level = rs2.getInt("RcdLevel");

	%>
	
	<TR>
		<TD WIDTH=45 ALIGN=CENTER><%=Number%></TD>
		<TD WIDTH=395 ALIGN=LEFT>
		<%
			// ------------------------- 페이지 인덴테이션 및 이미지 출력
			for(int i=0; i<level; i++)out.println("&nbsp;&nbsp;");
			if(level>0) {	//123
				String IMGURL="../images/re.gif";
				out.println("<IMG ALIGN=ABSMIDDLE SRC=" + IMGURL + ">");
			}
			
			// -------------------------- 긴 제목 문자열 처리
			int max_length = 34;  // 한 라인으로 출력될 수 있는 제목의 최대 길이
			int cut_length = max_length-(level);
			
			if(subject.length() > cut_length) {
				subject = subject.substring(0, cut_length);
				subject = subject + "..";
			}
		%>
		
		<A HREF="BoardContent.jsp?rno=<%=rno%>&column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>"><%=subject%></A>
		<%
			// --------------------------- 최근 24시간 이전에 작성된 레코드에 이미지 출력
			long now = System.currentTimeMillis();
			long dist = (now-date)/1000;
			long during = 60*60*24;
			
			if(dist<during) {
				String IMGURL="../images/new.gif";
				out.println("<IMG ALIGN=ABSMIDDLE width=15 HEIGHT=12 SRC=" + IMGURL + ">");
			}
		%>
		
		</TD>
		<TD WIDTH=65 ALIGN=CENTER><%=name %></TD>
		<TD ALIGN=CENTER><%=today%></TD>
		<TD ALIGN=CENTER><%=refer%></TD>
	</TR>
	
	<%
	// ---------------- 순환문을 이용한 레코드 출력 종료
	Number--;
	}
	%>
	
	
	
</TABLE>

<FORM NAME="BoardSearch" METHOD=POST action="BoardList.jsp">

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR>
		<TD ALIGN=LEFT WIDTH=100>
			<IMG SRC="../images/btn_new.gif" onClick="javascript:location.replace('BoardWrite.jsp?column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>')" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=320 ALIGN=CENTER>
		<%
			// ------------------------ 전체 페이지 수, 전체 페이지집합의 수, 현재 페이지집합 번호 추출
			TotalPages = (int)Math.ceil((double)TotalRecords/PageRecords);
			TotalPageSets = (int)Math.ceil((double)TotalPages/PageSets);
			CurrentPageSet = (int)Math.ceil((double)CurrentPage/PageSets);
			
			
			// ------------------------- 내비게이션에서 사용할 이미지 지정
			String bf_block = "../images/btn_bf_block.gif";
			String bf_page = "../images/btn_bf_page.gif";
			String nxt_page = "../images/btn_nxt_page.gif";
			String nxt_block = "../images/btn_nxt_block.gif";
			
			// ------------------------- 이전 페이지 집합으로의 링크
			if(CurrentPageSet > 1) {
				int BeforePageSetLastPage = PageSets*(CurrentPageSet-1);
				String retUrl = "BoardList.jsp?CurrentPage=" + BeforePageSetLastPage + "&column=" + column + "&key=" + encoded_key;
				
				String click = "javascript:location.replace('" + retUrl + "')";
				out.println("<IMG SRC=" + bf_block + " onclick=" + click + " STYLE=CURSOR:HAND>");
				
			} else {
				out.println("<IMG SRC = " + bf_block + ">");
			}
			
			// -------------------------- 이전 페이지로의 링크 작성
			if(CurrentPage>1) {
				int BeforePage = CurrentPage-1;
				String retUrl = "BoardList.jsp?CurrentPage=" + BeforePage + "&column=" + column + "&key=" + encoded_key;
				
				String click = "javascript:location.replace('" + retUrl + "')";
				out.println("<IMG SRC=" + bf_page + " onclick=" + click + " STYLE=CURSOR:HAND>");
			} else {
				out.println("<IMG SRC = " + bf_page + ">");
			}
			
			// -------------------------- 현재 페이지 집합에서 출력할 첫 페이지 번호와 끝 페이지번호 추출
			int FirstPage = PageSets*(CurrentPageSet-1);
			int LastPage = PageSets*CurrentPageSet;
			
			if(CurrentPageSet == TotalPageSets) {
				LastPage = TotalPages;
			}
			
			// --------------------------- 현재 페이지 집합에서 페이지로의 링크 작성
			for( int i=FirstPage+1; i<=LastPage; i++) {
				if(CurrentPage == i) {
					out.println("<B>" + i + "</B>");
				} else {
					String retUrl = "BoardList.jsp?CurrentPage=" + i + "&column=" + column + "&key=" + encoded_key;
					out.println("<A HREF=" + retUrl + ">" + i + "</A>");
				}
			}
			
			// --------------------------- 다음 페이지로의 링크 작성
			if(TotalPages > CurrentPage) {
				int NextPage = CurrentPage + 1;
				String retUrl = "BoardList.jsp?CurrentPage=" + NextPage + "&column=" + column + "&key=" + encoded_key;
				
				String click = "javascript:location.replace('" + retUrl + "')";
				out.println("<IMG SRC=" + nxt_page + " onclick=" + click + " STYLE=CURSOR:HAND>");
			} else {
				out.println("<IMG SRC=" + nxt_page + ">"); 
			}
			
			// --------------------------- 다음 페이지 집합으로의 링크 작성
			if(TotalPageSets > CurrentPageSet) {
				int NextPageSet = PageSets * CurrentPageSet + 1;
				String retUrl = "BoardList.jsp?CurrentPage=" + NextPageSet + "&column=" + column + "&key=" + encoded_key;
				
				String click = "javascript:location.replace('" + retUrl + "')";
				out.println("<IMG SRC=" + nxt_block + " onclick=" + click + " STYLE=CURSOR:HAND>");
			} else {
				out.println("<IMG SRC=" + nxt_block + ">"); 				
			}
			
			
		%>
		
    		     
		</TD>
		<TD WIDTH=200 ALIGN=RIGHT>
			<SELECT NAME="column" SIZE=1>
				<OPTION VALUE="" SELECTED>선택</OPTION>
				<OPTION VALUE="UsrSubject">제목</OPTION>
				<OPTION VALUE="UsrContent">내용</OPTION>
			</SELECT> 
			<INPUT TYPE=TEXT NAME="key" SIZE=10 MAXLENGTH=20> 
			<IMG SRC="../images/btn_search.gif" ALIGN=absmiddle STYLE=CURSOR:HAND onclick="javascript:submit()">
		</TD>    
	</TR>
	
</TABLE>

</FORM>
<% 
} catch (SQLException e) {
	e.printStackTrace();
	} finally {
		if (rs2 != null) rs2.close();
		if (rs1 != null) rs1.close();
		if (pstmt1 != null) pstmt1.close();
		if (pstmt2 != null) pstmt2.close();
		if (conn != null) conn.close();
}
%>

</BODY>
</HTML>