<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="user" class="dao.UserBean">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>
<%  

    UserDAO dao = new UserDAO();

    if (dao.exists(user.getId())) {
        out.print("이미 사용중인 아이디입니다.");
        return;
    }
    else{
    	out.print("사용 가능한 아이디입니다.");
    }
    
   
%>