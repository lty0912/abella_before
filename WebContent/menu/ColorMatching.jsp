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
		<div class="img-area" id="img-area"><img src="../images/hand1.png" alt="�÷� �̹���" id="colorView" 
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
				<h1>������ �̸�</h1> <br><br>
				<h3>��� �ϱ� ���� ���� �Դϴ�
					��Ʈ�� �ϴ�,�Ҷ���� Ǫ���迭�� �ÿ��� ���̴� �����⸦ ���� �մϴ�

					£������ ��� Ǯ��Ʈ ���ٴ� ���� ����ġ��
					������ ���� �������� �ٷ� �׷�������
					������� �ʰ� �ÿ��ϸ� �ڽ����� ������ ǥ�� �� �� �ֽ��ϴ�

					�߰��߰� ��Ż������ ��Ÿ���� ���������� ���� �̿��ؼ� ����Ʈ�� �ָ� ���� �ڽ�����
					������ ���� �մϴ�~
					</h3>
					<br><br><br><br>
					<h2>
					���� : 25,000 �� <br>
					�ҿ� �ð� : 2�ð�
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