<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table width="226" border="0" cellpadding="0" cellspacing="0">
<tr><td height="5"></td></tr>
  <tr>
    <td width="233" height="26" colspan="2" background="images/index_login.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center"  valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;">
    
     <jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include> 
    
    </td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
  </tr>


  <tr>
    <td height="26" background="images/index_catelog.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center" valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;">
    
    <table width="96%" border="0" cellpadding="0" cellspacing="0">
       <c:forEach items="${sessionScope.catelogList}" var="catelog">
      <tr>
        <td  class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0" />&nbsp;&nbsp;<a href="<%=path %>/goods?type=goodsByCatelog&catelog_id=${catelog.id}" target="_parter" class="delink">${catelog.name}</a></td>
      </tr>
      </c:forEach>
    </table>
    
    </td>
  </tr>
  <tr>
    <td height="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="26" background="images/index_news.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="90" align="center" valign="middle" class="tableBorder_LRB_dashed" style="padding:5px;">
    

        <table width="96%" border="0" cellpadding="0" cellspacing="0">
      
      	     <c:forEach items="${sessionScope.gonggaoList}" var="gonggao">
						          <tr>
						             <td height="25" class="tableBorder_B_dashed"><img src="images/left_ico.GIF" width="4" height="7" border="0">
                                         <a href="<%=path %>/gonggao?type=gonggaoDetailQian&id=${gonggao.id}" title="">${gonggao.title}</a>
                                     </td>
						          </tr>
						     </c:forEach>
    </table>
