<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID")!=null){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPassword")!=null){
		userPassword = (String) request.getParameter("userPassword");
	}
	if(userID == null|| userPassword ==null){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('입력하지 않은 사항이 있습니다');");
		pw.println("history.back();");
		pw.println("</script>");
		pw.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPassword);
	if(result ==1){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('회원가입 환영합니다.');");
		pw.println("location.href='index.jsp';");
		pw.println("</script>");
		pw.close();
		return;
	}
%>