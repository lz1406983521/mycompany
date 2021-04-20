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
<script language="JavaScript">


	function check() {
		if (document.ThisForm.loginname.value == "") {
			alert("请输入用户名");
			return false;
		}
		if (document.ThisForm.loginpw.value == "") {
			alert("请输入密码");
			return false;
		}
		document.getElementById("indicator").style.display = "block";
		loginService.login(document.ThisForm.loginname.value,
				document.ThisForm.loginpw.value, 1, callback);
	}

	function callback(data) {
		document.getElementById("indicator").style.display = "none";
		if (data == "no") {
			alert("用户名或密码错误");
		}
		if (data == "yes") {
			alert("登陆成功");
			window.location.reload();
		}

	}

	function popUp(menu) {
		newX = window.event.x + document.body.scrollLeft
		newY = window.event.y + document.body.scrollTop
		if (menu.style.display == "") {
			menu.style.display = "none"
		} else {
			menu.style.display = ""
		}
		menu.style.position = "absolute"
		menu.style.left = newX - 5
		menu.style.top = newY - 5
	}
	function popmenu(menu) {
		if (menu.style.display == "") {
			menu.style.display = "none"
		} else {
			menu.style.display = ""
		}
	}
	function pu(e) {
		cc = e.srcElement;
		cc.style.background = "#eeeeee";
	}
	function po(e) {
		cc = e.srcElement;
		cc.style.background = "";
	}
</script>
 <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script type="text/javascript">
	        function buy1(kucun)
	        {
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
		            if(document.buy.quantity.value=="")
		            {
		                alert("请输入购买数量");
		                return false;
		            }
		            document.buy.submit();
	            </c:if>
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
    <td height="17"  valign="bottom"><img src="images/title_productdetail.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
  <td>
  
  <TABLE class=dragTable border="0" cellSpacing=0 cellPadding=0 width="100%" border=0>
						
						
								<TR align="left" height="527">
									<TD align="center">
									    <form action="<%=path %>/buy?type=addToCart" method="post" name="buy">
			                                  <table width="100%" border="0" cellpadding="2" cellspacing="2">
												    <tr>
												       <td align="left"><img width="220" height="180" src="<%=path %>/${requestScope.goods.fujian }" style="border:1px solid #ccc; padding:3px;"/></td>
												    </tr>
												    <tr>
												       <td align="left"><b>编号</b>：${requestScope.goods.bianhao }</td>
												    </tr>
												    <tr>
												       <td align="left"><b>名称</b>：${requestScope.goods.mingcheng }</td>
												    </tr>
												    
												    <tr>
												       <td align="left"><b>品牌</b>：${requestScope.goods.pinpai }</td>
												    </tr>
												    <tr>
												       <td align="left"><b>价格</b>：${requestScope.goods.shichangjia }</td>
												    </tr>
												    <tr>
												       <td align="left"><b>详情</b>：<c:out value="${requestScope.goods.jieshao }" escapeXml="false"></c:out></td>
												    </tr>
												    <tr>
												       <td align="left">
												           
												             <b>数量</b>：<input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
												           <input type="hidden" name="goods_id" value="${requestScope.goods.id }"/>
												           <img onclick="buy1(${requestScope.goods.kucun })" src="<%=path %>/img/goumai.jpg"/>
												       </td>
												    </tr>
						                      </table>
			                            </form>
									</TD>
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


