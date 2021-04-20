<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://"
 			+ request.getServerName() + ":" + request.getServerPort()
 			+ path + "/";

 %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>企业门户网站</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="JavaScript" src="<%=path%>/js/public.js" type="text/javascript"></script>
	<script type='text/javascript' src='<%=path%>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
  <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>

    
 <script type="text/javascript">
	        function orderDetail(order_id)
	        {
	                 var url="<%=path %>/buy?type=orderDetail&order_id="+order_id;
	                 var n="";
	                 var w="600px";
	                 var h="500px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
				     window.open(url,n,w,h,s);
	        }
    </script>
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr align="center">
    <td height="165" colspan="4">

<jsp:include flush="true" page="/qiantai/inc/incTop1.jsp"></jsp:include>


</td>
  </tr>
  <tr>
    <td width="11" align="left" valign="top">&nbsp;</td>
    <td width="117" align="left" valign="top">
<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>

</td>
  </tr>
</table>
</td>
    <td width="20">&nbsp;</td>
    <td align="left" valign="top">



<table width="525" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="9"  valign="bottom"></td>
  </tr>
  <tr>
    <td height="17"  valign="bottom"><img src="images/title_order.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
  <td>
  
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
								
								<TR align="left" >
									<TD>
				                        <table width="100%" border="0"  align="center" style="margin-top:8px">
											<tr align="center" bgcolor="#FAFAF1" height="22">
												<td width="15%">订单编号</td>
												<td width="15%">下单时间</td>
												<td width="5%">状态</td>
												
												
												
												<td width="5%">总额</td>
												<td width="5%">明细</td>
									        </tr>	
											<c:forEach items="${requestScope.orderList}" var="order">
											<tr align='center' bgcolor="#FFFFFF" height="22">
												<td bgcolor="#FFFFFF" align="center">${order.bianhao}</td>
												<td bgcolor="#FFFFFF" align="center">${order.shijian}</td>
												<td bgcolor="#FFFFFF" align="center">
												     <c:if test="${order.zhuangtai=='no'}">
												         未受理
												     </c:if>
												     <c:if test="${order.zhuangtai=='yes'}">
												        已受理
												     </c:if>
												</td>
												
												
												
												<td bgcolor="#FFFFFF" align="center">${order.jine}</td>
												<td><input value="明细" type="button" onclick="orderDetail(${order.id})"/></td>
											</tr>
											</c:forEach>
										</table>
									</TD>
								</TR>
								<TR align="left">
									<TD height="5"></TD>
								</TR>
						</TABLE>
 
  
  </td>
  </tr>
</table>


	
</td>
        </tr>

  <tr>
    <td colspan="4" align="center">
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
</td>
  </tr>
</table>
</body>
</html>


