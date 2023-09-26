<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>

<%-- 회원정보 수정 기능 구현 --%>

	<jsp:useBean id="user" class="dao.UserBean">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>
	



<% 
	UserDAO dao = new UserDAO();
	
	
	if(dao.update(user)){
		session.invalidate();
%>
		<script type="text/javascript">
		alert("회원정보수정 완료!")
		location.href="main.jsp";
		</script>
<%		
	}
%>



