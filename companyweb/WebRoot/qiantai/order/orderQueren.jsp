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
            function back1()
	        {
	           window.history.go(-1);
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
									    <form action="<%=path %>/buy?type=orderSubmit" name="fq" method="post">
					                        <table width="98%" align="center" border="0" cellpadding="9" cellspacing="9">
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          用户名：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.loginname}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          姓名：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.name}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          联系方式：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.tel}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												           地址：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.address}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          快递地址：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" name="songhuodizhi"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          付款方式：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <select name="fukuanfangshi" style="width:155px;">
					   		                               <option value="货到付款">货到付款</option>
					   		                               <option value="银行付款">银行付款</option>
					   		                             </select>
												    </td>
												 </tr>
										    </table>
					        				<table>
					        				   <tr height="7"><td></td></tr>
							                   <tr>
							                       <td width="120"></td>
							                       <td><a href="#" onclick="back1()"><img border="0" src="<%=path %>/img/fanhui.jpg"/></a></td>
							                       <td><img border="0" src="<%=path %>/img/tijiao.jpg" onclick="javascript:document.fq.submit();"/></td>
							                   </tr>
							               </table>
							            </form>
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


