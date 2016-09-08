
// ----------------------- 아이디 중복검사 윈도우
function IdCheck(ref, fname, ename, myname, w, h, scroll) {
	
	var userid = eval("document." + fname + "." + ename);
	
	if(!userid.value) {
		alert("아이디를 입력한 후 버튼을 눌러주세요.");
		userid.focus();
		return;
	} else {
		ref = ref + "?" + ename + "=" + userid.value;
		var winl = (screen.width - w) / 2;
		var wint = (screen.height - h) / 2;
		winprops = 'height=' + h + ', width=' + w + ', top=' + wint + ', left=' + winl + ', scrollbars=' + scroll;
		NewWin3 = window.open(ref, myname, winprops);
	}
	
	
}

// ----------------------- 아이디 패스워드 찾기 윈도우
function IdPwSearchWin(ref, myname, w, h, scroll) {	
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height=' + h + ', width=' + w + ', top=' + wint + ', left=' + winl + ', scrollbars=' + scroll;
	NewWin2 = window.open(ref, myname, winprops);
}

//----------------------- 예약하기 윈도우
function BookWin(ref, myname, w, h, scroll) {	
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height=' + h + ', width=' + w + ', top=' + wint + ', left=' + winl + ', scrollbars=' + scroll;
	NewWin2 = window.open(ref, myname, winprops);
}





