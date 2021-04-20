<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
         function admin()
         {
            var url="<%=path %>/login.jsp";
            window.open(url,"_blank");
         } 
         
         function liuyanAll()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/liuyan?type=liuyanAll";
				var targetWinName="newWin";
				var features="width="+screen.width-200+" ,height="+screen.height-150+" ,toolbar=no, top=0, left=0, menubar=no, scrollbars=yes, resizable=no,location=no, status=no"
				var new_win=window.open(url,targetWinName,features);
            </c:if>
         } 
         
        
         
         function mycart()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/buy?type=mycart";
                window.open(url,"_self");
            </c:if>
         } 
         
         function userOrder()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/buy?type=mycart";
                window.open(url,"_self");
            </c:if>
         } 
         
         function myorder()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/buy?type=myorder";
                window.open(url,"_self");
            </c:if>
         } 
         
      </script>
<table id="cpdd" class='box'  style='display:none' onMouseOver="popmenu(this)" onMouseOut="popmenu(this)"  align="center" > 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='single?type=intro';" style="cursor:hand; color:#000000">企业简介</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='single?type=news';" style="cursor:hand; color:#000000">企业新闻</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='single?type=contact';" style="cursor:hand; color:#000000">联系我们</td> 
  </tr>
</table> 
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="31" height="76" background="images/banner_bg.gif">&nbsp;</td>
    <td width="175" background="images/banner_bg.gif"><img src="images/logo.gif" width="173" height="76" /></td>
    <td width="267" background="images/banner_bg.gif">企业门户网站欢迎您！</td>
    <td width="267" background="images/banner_bg.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>

       
      </tr>
    </table></td>
  </tr>
</table>
<table width="781" height="252" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11" height="252" rowspan="2" align="center" valign="top" background="images/bg_ad.GIF">&nbsp;</td>
    <td width="189" height="30" align="center" background="images/bg_navigation.GIF"><div id="bgclock" class="word_white"></div></td>
    <td width="570" align="center" background="images/bg_navigation.GIF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0"> 
  <tr> 
    <td width="20" height="22" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"><a href="index" class="word_white">首页</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"><a onMouseOver="popUp(cpdd)" onMouseOut="popUp(cpdd)"  class="word_white">企业信息</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a href="goods?type=goodsByCatelog&catelog_id=0"  class="word_white">产品信息</a> </td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a href="#" onclick="mycart()" class="word_white">购物车</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td>
					  <c:if test="${sessionScope.user!=null}">
						<td>
							<a href="user?type=top" class="word_white">用户中心</a>
						</td>
					</c:if>
					<c:if test="${sessionScope.user==null}">
						<td>
							<a href="user?type=reg" class="word_white">用户注册</a>
						</td>
					</c:if>

					<td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a href="reply?type=list" class="word_white">留言信息</a></td> 
  </tr> 
</table></td>
    <td width="11" rowspan="2" align="center" valign="top" background="images/bg_ad.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><img src="images/ad.jpg" width="759" height="222" /></td>
  </tr>
</table>
