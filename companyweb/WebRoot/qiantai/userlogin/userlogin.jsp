<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

       <c:if test="${sessionScope.user==null}">
			<form action="<%=path %>/user?type=userLogin" name="ThisForm" method="post">
			
			      <table width="86%" align="center" border="0" cellpadding="0" cellspacing="4">
      
                   <tr><td>账号: <input class="input" title="用户名不能为空" name="loginname" type="text" value="abc123" /></td></tr>
	               <tr><td>密码: <input class="input" title="密码不能为空" type="password" name="loginpw" value="abc123" /></td></tr>
	               <tr><td><center><span> <input type="button" value="提交" onclick="check()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" /> &nbsp;&nbsp;<a href="user?type=reg">注册</a><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/></span></center></td></tr>
      
                  </table>
		    </form>
		    </c:if>
		    <c:if test="${sessionScope.user!=null}">
		        <br/>
			     &nbsp;&nbsp;&nbsp;&nbsp;欢迎您：${sessionScope.user.loginname } &nbsp;&nbsp;&nbsp;&nbsp;<br>
			    &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/user?type=userLogout">退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
			     &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/buy?type=myorder">我的订单</a> &nbsp;&nbsp;&nbsp;&nbsp;
			    <br/><br/><br/>
			</c:if>
