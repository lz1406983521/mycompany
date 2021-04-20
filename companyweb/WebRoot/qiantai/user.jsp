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

            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    function check1()
		    {
		        if(document.form1.loginname.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form1.loginpw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        if(document.form1.loginpw.value!=document.form1.loginpw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		        document.form1.submit();
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
    <td height="9" valign="bottom"></td>
  </tr>
  <tr>
    <td height="17" valign="bottom"><img src="images/title_user.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
    <td  valign="middle">
    <table border="0" align="left" cellpadding="0" cellspacing="0">
    
      <tr>
      
        <td >
        <form action="<%=path %>/user?type=userEdit" name="form1" method="post">
				<table width="500px" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<th height="40" colspan="2" bgcolor="#FFFFFF" class="f12b-red" style="font-size: 11px;">
							用 户 信 息
						</th>
					</tr>
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							用户名：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="loginname" id="loginname" value="${sessionScope.user.loginname}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密 码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="loginpw" value="${sessionScope.user.loginpw}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密码确认：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="loginpw1" value="${sessionScope.user.loginpw}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							真实姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="name" value="${sessionScope.user.name}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="radio" name="sex" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							年龄：
						</td>
						<td bgcolor="#FFFFFF">
						    &nbsp;
							<input type="text" name="age" value="${sessionScope.user.age}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							住址：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="address" value="${sessionScope.user.address}" />
						</td>
					</tr>
					
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							联系方式：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="tel" value="${sessionScope.user.tel}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							E-mail：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="email" value="${sessionScope.user.email}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							QQ：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="qq" value="${sessionScope.user.qq}" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="hidden" name="id" value="${sessionScope.user.id}"/>
							<input type="button" value="确定" onclick="check1();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
        </td>
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


