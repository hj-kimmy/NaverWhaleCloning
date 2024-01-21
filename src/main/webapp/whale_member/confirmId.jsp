<%@ page import="com.model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
%>
<%
    MemberDAO dao = MemberDAO.getInstance();
    int result = dao.getMemberbyId(id);

    System.out.println(result);
    if (result > 0) {
%>
<span>사용이 불가능한 아이디입니다. (중복)</span>
<%
} else {
%>
<span></span>
<%
    }
%>