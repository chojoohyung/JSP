<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
	    response.sendRedirect("loginForm.jsp");
	    return;
	}
	UserDAO dao = new UserDAO();
	UserBean user = dao.getUser(uid);
%>

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
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action="update.jsp" method="post">
<table align=center>
<tr><td colspan=2 align=center height=40><b>회원정보 수정</b><td></tr>
<tr>
    <td align=right>아이디&nbsp;</td>
    <td><input type="text" name="id" value=<%=user.getId()%> readonly></td>
</tr>
<tr>
    <td align=right>패스워드&nbsp;</td>
    <td><input type="password" name="ps" id="pw" onchange="check_pw()"required></td>
</tr>
<tr> 
    <td align=right>패스워드(확인)&nbsp;</td>
    <td><input type="password" required name="ps2" id="pw2" onchange="check_pw()">:<span id="check"></span></td>
</tr>
<tr>
    <td align=right>이름&nbsp;</td>
    <td><input type="text" name="name" value=<%=user.getName()%>></td> 
</tr> 


<tr>
    <td colspan=2 align=center height=50>
        <input type="submit" value="회원정보수정하기">
    </td>
</tr>
</table>
</form>
</body>
</html>