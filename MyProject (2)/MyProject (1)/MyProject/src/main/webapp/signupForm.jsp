<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

	<script type="text/javascript">
function confirm_id(id){
	if (id==""){
		alert("ID를 입력하세요");
		return;
	}
	url = "idCheckForm.jsp?id="+id;
	window.open(url,"confirm","width=500, height=300")
}
</script>
<script>
function check_pw(){
	if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}
</script>

<body>

<form action="signup.jsp" method="post">
<table align=center>
<tr><td colspan=2 align=center height=40><b>회원가입</b><td></tr>

<tr>
    <td align=right>아이디&nbsp;</td>
    
    <td><input type="text" name="id" placeholder="아이디를 입력해주세요" onkeydown="inputIdChk()"/>
  <input type="button" value="중복확인" onclick="confirm_id(this.form.id.value)">
  
    </td>
</tr>
<tr>
    <td align=right>패스워드&nbsp;</td>
    <td><input type="password" name="ps" id="pw" onchange="check_pw()"required></td>
</tr>
<tr> 
    <td align=right>패스워드(확인)&nbsp;</td>
    <td><input type="password" required name="ps2" id="pw2" onchange="check_pw()">&nbsp:<span id="check"></span></td>
</tr>
<tr>
    <td align=right>이름&nbsp;</td>
    <td><input type="text" name="name" required></td> 
</tr>

<tr>
    <td colspan=2 align=center height=50>
        <input type="submit" value="회원가입하기">
    </td>
</tr>
</table>
</form>
</body>
</html>