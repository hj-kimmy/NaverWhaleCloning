<%@ page import="com.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

  MemberDTO dto = (MemberDTO) request.getAttribute("memberDTO");
  String where = (String) request.getParameter("where");
  if(dto!=null) {
    session.setAttribute("sessionID", dto.getId());
  }
  System.out.println("회원정보 : " + dto.getId());

 response.sendRedirect("./index.jsp");
%>