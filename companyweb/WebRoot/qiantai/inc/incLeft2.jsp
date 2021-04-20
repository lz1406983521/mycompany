<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table width="226" border="0" cellpadding="0" cellspacing="0">
<tr><td height="5"></td></tr>


  <tr>
    <td height="26" background="images/index_list.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="490" align="center" valign="top" class="tableBorder_LRB_dashed" style="padding:5px;"><table width="96%" border="0" cellpadding="0" cellspacing="0">
     
      	  <tr> 
    <td height="25" ><img src="images/rect.gif" width="4" height="4" border="0"> &nbsp;<a class="delink" href="single?type=xc1" >企业简介</a></td> 
  </tr>    
  <tr> 
    <td height="25" ><img src="images/rect.gif" width="4" height="4" border="0"> &nbsp;<a class="delink" href="single?type=xc2" >企业新闻</a></td> 
  </tr>
    <tr> 
    <td height="25" ><img src="images/rect.gif" width="4" height="4" border="0"> &nbsp;<a class="delink" href="single?type=contact" >联系我们</a></td> 
  </tr>
			
  
    </table></td>
  </tr>

  <tr>
   