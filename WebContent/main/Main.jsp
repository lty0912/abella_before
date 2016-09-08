<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    <%
    int CurrentPage = 0;
    String column = "";
    String encoded_key = "";    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta property="og:title" content="당신의 nail을 디자인하라. 아벨라 뷰티하우스" />
<meta property="og:url" content="http://blog.naver.com/abellabeautyhouse"/>
<meta property="og:description" content="당신의 nail을 디자인하라. 아벨라 뷰티하우스"/>
<meta property="og:image" content="http://postfiles13.naver.net/20160505_220/abellabeautyhouse_14624540431793bPv1_JPEG/IMG_20160505_4_edit.jpg?type=w2"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">




<title>당신의 nail을 디자인하라. 아벨라 뷰티하우스</title>
<link rel="stylesheet" type="text/css" href="../include/style-layout.css"/>




<script type="text/javascript">  

	function share_facebook() { // Facebook 공유하기
		window.open("http://www.facebook.com/sharer/sharer.php?u=http://blog.naver.com/abellabeautyhouse");
	}
	
	function share_tw(){	// 트위터 공유하기
		  var content = "당신의 nail을 디자인하라. 아벨라 뷰티하우스";
		  var link = "http://blog.naver.com/abellabeautyhouse";
		  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		  var wp = window.open("http://twitter.com/share?url=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'twitter', popOption); 
		  if ( wp ) {
		    wp.focus();
		  }     
		}
	
	function share_pstGoogle() {	//구글 플러스 공유하기
		var content = "당신의 nail을 디자인하라. 아벨라 뷰티하우스";	
	    var href ="https://plus.google.com/share?url=http://blog.naver.com/abellabeautyhouse&t=" + encodeURIComponent(content) ;
	    var a = window.open(href, 'Google', 'width=800, height=500');
	    if ( a ) {
	     a.focus();
	    }
	   }

 	function share_band() {  //밴드 공유하기 
		var msg=encodeURIComponent('당신의 nail을 디자인하라. 아벨라 뷰티하우스.');
 		var sUrl = encodeURIComponent('http://blog.naver.com/abellabeautyhouse'); 
		var shareUrl = "http://www.band.us/plugin/share?body="+msg+"&route="+sUrl;
   		window.open(shareUrl,"share_band", "width=400, height=500, resizable=yes");
  	}
 		 
 		 

</script>

</head>
<body>
	
  <div class="wrap">
  <header>
     <div class="right" >
     <% 
     String member_id = (String)session.getAttribute("member_id");
     String member_name = (String)session.getAttribute("member_name");
     if(member_id == null) {    // 로그인 상태인지 검사
     %>
       	<a href="" onClick="window.open('../member/LoginForm.jsp', 'LogIn', 'top=10px, left=830px, width=240px, height=110px',  'no')">로그인  </a><a>|</a>
        <a href="../member/BeMember.jsp">회원가입</a><br/>
        <%} else {        	
        	%><%=member_name %>님 환영합니다.  <a href="../member/LogOut.jsp">마이 페이지  </a><a>|</a>
        <a href="../member/LogOut.jsp">로그아웃</a>
        	<%
        }
       %>

  	</div >
      	<a id ="logo" href="Main.jsp">  <!-- 로고를 누르면 페이지 홈으로-->
        <CENTER><img src="../images/Logo.png"  width=480 height=150/></a></CENTER> 

   </header>
   
 
   

 <nav>
    <ul>
        <li><a href="../menu/Info.jsp" target="display_area" >샵안내</a></li>
        <li><a href="" >공지사항</a></li>
		<li><a href="" >이벤트</a></li>
		<li><a href="../menu/ColorMatching.jsp" target="display_area" >컬러매치</a></li>
        <li><a href="" >갤러리</a></li>
        <li><a href="" >문 의</a></li>
        <li><a href="../board/BoardList.jsp"  target="display_area"  >후 기</a></li>
        <li><a href="../menu/Schedule.jsp?SelectedDay=" target="display_area" >예 약</a></li>
        <li><a href="" >히스토리</a></li>
    </ul>
</nav>	 


<article class="inner">  
	<iframe name="display_area" id="display_area" src="InnerMain.jsp" seamless="true" frameborder=0 width=800px height=1180px>
	</iframe>

</article>

<footer>  	

   <div id="copyright">
       	서울시 강남구 테헤란로 4길 46,1층 104호 (역삼동, 쌍용플레티넘밸류) <br>
       	 팩스 : 02-535-8872 / 사업자번호 : 231-22-00251 / 상호 : 아벨라 뷰티하우스<br>
        Copyright (c) www.abella.co.kr All rights reserved
   </div>
   
   <div id="SNS">
  
       <a href="javascript:share_facebook()" target="_blank">
           <img src="../images/facebook.gif" height="32" alt="Facebook">
       </a>
       <a href="javascript:share_tw()" target="_blank">
           <img src="../images/twitter.gif" height="32" alt="Twitter">
       </a>
       <a href="javascript:share_pstGoogle()" target="_blank">
           <img src="../images/googleplus-icon.png" height="32" alt="Google Plus">
       </a>
       <!-- 밴드 공유 버튼 -->
       <a href="javascript:share_band()"> 
          <img src="../images/band.jpg" height="32px"/></a>       
    </div>
    
</footer>
    
    
    
    
    </div>
    
   
    
  
    
    
    
     

</body>
</html>