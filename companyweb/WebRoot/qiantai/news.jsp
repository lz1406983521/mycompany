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
        <c:if test="${sessionScope.type=='xc'||sessionScope.type=='jt'}">
<jsp:include flush="true" page="/qiantai/inc/incLeft2.jsp"></jsp:include>
</c:if>
        <c:if test="${sessionScope.type!='xc'&&sessionScope.type!='jt'}">
<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
</c:if>
</td>
  </tr>
</table>
</td>
    <td width="20">&nbsp;</td>
    <td align="left" valign="top">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>


<table width="525" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="9" valign="bottom"></td>
  </tr>
  <tr>
    <td height="17" valign="bottom"><img src="${sessionScope.img}" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td width="355" valign="middle">
    <table border="0" align="right" cellpadding="0" cellspacing="0">
    
      <tr>
											<table>
												<c:forEach items="${sessionScope.newsAll}" var="news">
													<tr>
														<td height="25" class="tableBorder_B_dashed">
															<img src="images/left_ico.GIF" width="4" height="7"
																border="0">
															<a
																href="<%=path%>/gonggao?type=gonggaoDetailQian&id=${news.id}"
																title="">${news.title}</a>
														</td>
													</tr>
												</c:forEach>
											</table>
										</tr>
      
    </table>
    </td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
<map name="Map" id="Map">
<area shape="rect" coords="458,8,499,22" href="list_new.jsp" />
</map></td>
        </tr>
        <tr>
          <td>






</td>
        </tr>
    </table>    </td>
  </tr>
  <tr>
    <td colspan="4" align="center">
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
</td>
  </tr>
</table>
</body>
</html>


