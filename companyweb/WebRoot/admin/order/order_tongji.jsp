<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.orm.Torder"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
    String path = request.getContextPath();
    int kk=0;
    List orderList=(List)request.getAttribute("orderList");
    for(int i=0;i<orderList.size();i++)
    {
         Torder order=(Torder)orderList.get(i);
         kk=kk+order.getJine();
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
            function orderDetail(order_id)
	        {
	                 var url="<%=path %>/buy?type=orderDetail&order_id="+order_id;
	                 var n="";
	                 var w="600px";
	                 var h="500px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
				     openWin(url,n,w,h,s);
	        }
	        
           function userXinxi(user_id)
           {
                     var url="<%=path %>/user?type=userXinxi&user_id="+user_id;
	                 var n="";
	                 var w="700px";
	                 var h="200px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
				     openWin(url,n,w,h,s);
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/order?type=order_tongji" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="44" background="<%=path %>/img/tbg.gif">&nbsp;??????????????????&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="100%" bgcolor="#FFFFFF" align="left">
						         ?????????
						        <input type="text" name="shijian" size="40" value="${requestScope.shijian }"/>
						        <input type="submit" value="??????"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
			
			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="44" background="<%=path %>/img/tbg.gif">&nbsp;??????????????????&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">????????????</td>
					<td width="15%">????????????</td>
					<td width="15%">??????</td>
					
					<td width="15%">????????????</td>
					<td width="10%">????????????</td>
					<td width="5%">?????????</td>
					<td width="5%">??????</td>
					<td width="5%">????????????</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order">
				<tr align='center' bgcolor="#FFFFFF" height="22">
					<td bgcolor="#FFFFFF" align="center">${order.bianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${order.shijian}</td>
					<td bgcolor="#FFFFFF" align="center">
					     <c:if test="${order.zhuangtai=='no'}">
					         ?????????&nbsp;&nbsp;&nbsp;<a href="#" style="color: red" onclick="orderShouli(${order.id})" class="pn-loperator">????????????</a>
					     </c:if>
					     <c:if test="${order.zhuangtai=='yes'}">
					        ?????????
					     </c:if>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">${order.songhuodizhi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.fukuanfangshi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.jine}</td>
					<td><input value="??????" type="button" onclick="orderDetail(${order.id})"/></td>
					<td>
					    <input type="button" onclick="userXinxi(${order.user_id})" value="??????????????????"/>
					</td>
				</tr>
				</c:forEach>
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="44" align="center" background="<%=path %>/img/tbg.gif">????????????<font color="red"><%=kk %></font></td>
				</tr>
			</table>
	</body>
</html>
