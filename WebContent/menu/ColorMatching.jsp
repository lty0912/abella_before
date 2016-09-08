<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.color-item, .cm-imgs{cursor:pointer;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../include/style-layout.css"/>

<SCRIPT language="javascript">

	function ChangeColor(c) {
		var changeTarget = document.getElementById("img-area");	
		changeTarget.style.background = c;
	}
	
	function ChangeNail(selectObj) {		
		var changeTarget = document.getElementById("colorView");
		changeTarget.src = selectObj.id;
	}

</SCRIPT>

</head>
<body>
	
	<div class="menu-cont">
		<div class="img-area" id="img-area"><img src="../images/hand1.png" alt="컬러 이미지" id="colorView" 
		style="width:370px; height:420px;"></div>
			<div class="color-wrap">										
			<ul class="skin-color-list">
			
				<li class="color-item default" style="background-color:#fff"></li>
								 
				<li class="color-item" style="backgroud-color: #f5d1b9" onClick="ChangeColor('#f5d1b9');"></li>
								
				<li class="color-item" style="background-color:#f4d0b6" onClick="ChangeColor('#f4d0b6');"></li>
								
				<li class="color-item" style="background-color:#f3ccb3" onClick="ChangeColor('#f3ccb3');"></li>
								
				<li class="color-item" style="background-color:#efc6ab" onClick="ChangeColor('#efc6ab');"></li>
									
				<li class="color-item" style="background-color:#ecbfa2" onClick="ChangeColor('#ecbfa2');"></li>
								
				<li class="color-item" style="background-color:#e9b89b" onClick="ChangeColor('#e9b89b');"></li>
								
				<li class="color-item" style="background-color:#e4b091" onClick="ChangeColor('#e4b091');"></li>
								
				<li class="color-item" style="background-color:#e0a888" onClick="ChangeColor('#e0a888');"></li>
								
				<li class="color-item" style="background-color:#dea380" onClick="ChangeColor('#dea380');"></li>
								
				<li class="color-item" style="background-color:#d99a76" onClick="ChangeColor('#d99a76');"></li>
										
				<li class="color-item" style="background-color:#d5916c" onClick="ChangeColor('#d5916c');"></li>
								
				<li class="color-item" style="background-color:#d18a64" onClick="ChangeColor('#d18a64');"></li>
								
				<li class="color-item" style="background-color:#cd845c" onClick="ChangeColor('#cd845c');"></li>
								
				<li class="color-item" style="background-color:#ca7f55" onClick="ChangeColor('#ca7f55');"></li>
								
				<li class="color-item" style="background-color:#c9794f" onClick="ChangeColor('#c9794f');"></li>
								
				<li class="color-item" style="background-color:#c7744a" onClick="ChangeColor('#c7744a');"></li>				
								
			</ul>	
			</div>
			<div class="content" > 
			
			<br><br><br><br><br><br>
				<h1>디자인 이름</h1> <br><br>
				<h3>더운날 하기 좋은 네일 입니다
					민트와 하늘,소라색등 푸른계열은 시원해 보이는 분위기를 연출 합니다

					짙은색의 경우 풀코트 보다는 변형 프렌치나
					바탕색 없이 디자인을 바로 그려넣으면
					답답하지 않고 시원하며 멋스러운 느낌를 표현 할 수 있습니다

					중간중간 메탈느낌의 스타츠나 라인테이프 등을 이용해서 포인트를 주면 더욱 멋스럽게
					연출이 가능 합니다~
					</h3>
					<br><br><br><br>
					<h2>
					가격 : 25,000 원 <br>
					소요 시간 : 2시간
					</h2>
			</div>	
		</div>
			<hr>
			
			
			<div class="other-cm">
				<img id="../images/cm2.png" class="cm-imgs" src="../images/color1.jpg" onClick="javascript:ChangeNail(this)" STYLE=CURSOR:HAND> 
				<img id="../images/cm3.png" class="cm-imgs" src="../images/color2.jpg" onClick="javascript:ChangeNail(this)" STYLE=CURSOR:HAND>
				<img id="../images/hand1.png" class="cm-imgs" src="../images/color3.JPG" onClick="javascript:ChangeNail(this)">
				<img class="cm-imgs" src="../images/color4.JPG">
				<img class="cm-imgs" src="../images/color5.JPG">
				<img class="cm-imgs" src="../images/color6.JPG">
				<img class="cm-imgs" src="../images/color7.JPG">
				<img class="cm-imgs" src="../images/color8.JPG">			
			</div>					
</body>
</html>