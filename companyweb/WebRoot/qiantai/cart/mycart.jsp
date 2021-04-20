<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://"
 			+ request.getServerName() + ":" + request.getServerPort()
 			+ path + "/";
	Object message = request.getAttribute("message");
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
    <script language="javascript">
    <% if(message != null) { %>
		alert("<%=message%>");
	<% } %>
	
</script>
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
  <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>

    
    <script type="text/javascript">
            function delGoodsFromCart(goodsId)
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback111);
	        }
           
            function clearCart()
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.clearCart(callback111);
	        }
           
            function modiNum(goodsId,quantity)
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	                document.getElementById("indicator1").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback111);
	            }
	        }
	        
	        function callback111(data)
	        {
	            document.getElementById("indicator1").style.display="none";
	            if(data=="no")
			    {
			        alert("库存不足");
			    }
			    if(data=="yes")
			    {
			        document.location.reload(true);
			    }
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
    <td height="17"  valign="bottom"><img src="images/title_mycart.gif" width="523" height="32" border="0" usemap="#Map" /></td>
  </tr>
  <tr>
  <td>
  
      <table width="98%" border="0" cellpadding="2" cellspacing="1" align="center" style="margin-top:8px">
											<tr align="center" bgcolor="#FAFAF1" height="22">
												  <td>名称</td>
								                  <td>价格</td>
								                  <td>数量</td>
								                  <td>总价</td>
								                  <td>操作</td>
									        </tr>	
											<c:forEach items="${sessionScope.cart.items}" var="item">
											<tr align='center' bgcolor="#FFFFFF" height="22">
												<td bgcolor="#FFFFFF" align="center">${item.value.goods.mingcheng}</td>
												<td bgcolor="#FFFFFF" align="center">￥:${item.value.goods.tejia}</td>
												<td bgcolor="#FFFFFF" align="center"><input type="text" onChange="modiNum(${item.value.goods.id},this.value)" value="${item.value.goods_quantity}" size="4"/></td>
												<td bgcolor="#FFFFFF" align="center">${item.value.goods.tejia * item.value.goods_quantity}</td>
												<td bgcolor="#FFFFFF" align="center"><img src="<%=path %>/img/delete_01.gif" border="0" onClick="delGoodsFromCart(${item.value.goods.id})"/></td>
											</tr>
											</c:forEach>
											<tr>
								                 <td colspan="5" class="Order_Total" align="right">
								                    <br> 
												     总计：<span id="totalMoney">${sessionScope.cart.totalPrice}</span>
												    &nbsp;&nbsp;&nbsp;&nbsp;
												    <img id="indicator1" src="<%=path %>/img/loading.gif" style="display:none"/>
												 </td>
								              </tr>	
										</table>
										<table>
				        				   <tr height="7"><td></td></tr>
						                   <tr>
						                       <td width="120"></td>
						                       <td><a href="#" onclick="clearCart()"><img border="0" src="<%=path %>/img/qingkong.jpg"/></a></td>

						                       <td><a href="<%=path %>//buy?type=addOrder"><img border="0" src="<%=path %>/img/next.jpg"/></a></td>
						                   </tr>
						               </table>
  
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


