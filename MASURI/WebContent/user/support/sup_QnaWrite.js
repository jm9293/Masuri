
function chkSubmit(){
	frm = document.forms['frm'];
	
	var title = frm["title"].value.trim();
	var content = frm["content"].value.trim();
	
	if(title == ""){
		alert("제목은 반드시 입력해야 합니다.");
		frm["title"].focus();
		return false;
	}
	if(content == ""){
		alert("내용을 반드시 입력해야 합니다.");
		frm["title"].focus();
		return false;
	}
	
	return true;	
		
}
