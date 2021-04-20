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
<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>

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
    <td height="9" colspan="3" valign="bottom"></td>
  </tr>
  <tr>
    <td height="17" colspan="3" valign="bottom"><img src="images/title_introduce.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td width="8">&nbsp;</td>
    <td width="162" height="130" align="center"><img src="${sessionScope.intro[0].img}" width="132" height="104" /></td>
    <td width="355" valign="middle"><table width="351"  border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" height="4px"></td>
      </tr>
      
      <tr>
        <td width="17" height="24">&nbsp;</td>
        <td width="334"  ><a href="single?type=intro">${sessionScope.intro[0].content}</a></td>
      </tr>
      
      <tr>
        <td colspan="3" height="4px"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
<map name="Map" id="Map">
<area shape="rect" coords="458,8,499,22" href="single?type=jt1" />
</map></td>
        </tr>
        <tr>
          <td>





<table width="525" border="0" cellspacing="0" cellpadding="0">


    <tr>
    <td height="33" colspan="3" valign="bottom"><img src="images/title_product.gif" width="521" height="29" border="0" usemap="#Map" /></td>
  </tr>
    <tr>
    <td colspan="3"><table border="0" cellspacing="0" align="center" style="text-align:center">
	  <tr>
	  
<table cellspacing="6" cellpadding="1" align="center" border="0">
									          <tr>
									               <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
									                  <c:if test="${sta.index%3==0}">
									                     </tr><tr>
									                  </c:if>
									                  <td align="center">
														   <a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }">  
														      <img width="158" height="110" src="<%=path %>/${goods.fujian }" style="border:1px solid #ccc; padding:2px;"/>
														   </a>
														   <br>
									                       ${goods.mingcheng }

									                  </td>
									              </c:forEach>
									          </tr>
						                  </table>
  </tr>
</table>
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


