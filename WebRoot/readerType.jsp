<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head>
	<base href="${applicationScope.basePath}">
	
	<title>图书馆管理系统</title>
	<link href="css/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="118" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="100%" height="33"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="81%" height="10"></td>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td height="20">&nbsp;</td>
        <td width="10%"><a href="#" onClick="window.location.reload();" class="word_dark">刷新页面</a></td>
        <td width="9%"><a href="#" onClick="myclose()" class="word_dark">关闭系统</a></td>
		<script language="javascript">
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();			
				}
	
			}
		</script>
        </tr>
    </table>
      <table width="93%" height="79"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" align="right" valign="bottom">当前登录用户：java1234</td>
        </tr>
    </table></td>
  </tr>
</table>





<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/onclock.js" ></script>
<script src="js/menu.js" ></script>
<div class=menuskin id=popmenu
      onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr bgcolor="#DFA40C">
        <td width="3%" height="27">&nbsp;</td>
        <td width="29%"><div id="bgclock" class="word_white"></div></td>
		<script language="javascript">
			function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="login.html";
				}
			}
		</script>
        <td width="66%" align="right" bgcolor="#B0690B" class="word_white"><a href="main.html" class="word_white">首页</a> |
        <a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >系统设置</a> | <a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">读者管理</a> | <a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >图书管理</a> | <a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">图书借还</a> | <a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >系统查询</a> | <a  href="pwd_Modify.html" class="word_white">更改口令</a> | <a href="#" onClick="quit()" class="word_white">退出系统</a></td>
        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
  </tr>
      <tr bgcolor="#DFA40C">
        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
      </tr>
</table>

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者类型管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="91%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right">      
      <a href="add_readerType.html" >添加读者类型信息</a> </td>
</tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6b83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="35%" bgcolor="#F9D16B">读者类型名称</td>
    <td width="35%" bgcolor="#F9D16B">可借数量</td>
    <td width="16%" bgcolor="#F9D16B">修改</td>
    <td width="14%" bgcolor="#F9D16B">删除</td>
  </tr>
 
  <tr>
    <td style="padding:5px;">&nbsp;学生</td>
    <td style="padding:5px;">&nbsp;10</td>
    <td align="center"><a href="#" onClick="window.open('readerType.do?action=readerTypeModifyQuery&ID=1','','width=292,height=175')">修改</a></td>
    <td align="center"><a href="readerType.do?action=readerTypeDel&ID=1">删除</a></td>
  </tr>
  
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table>

<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td height="6"></td>
							</tr>
							<tr>
								<td height="33">
									<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
										<tr>
											<td width="50%">共 <span class="right-text09">5</span> 页 | 第 <span class="right-text09">1</span> 页</td>
											<td width="49%" align="right">[<a href="#" class="right-font08">首页</a> | <a href="#" class="right-font08">上一页</a> | <a href="#" class="right-font08">下一页</a> | <a href="#" class="right-font08">末页</a>] 转至：</td>
											<td width="1%">
												<table width="20" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="1%">
															<input name="textfield3" type="text" class="right-textfield03" size="1" />
														</td>
														<td width="87%">
															<input name="Submit23222" type="submit" class="right-button06" value=" " />
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>


<table width="778" height="66"  border="0" align="center" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
      <tr>
        <td height="11" colspan="4" background="Images/copyright_t.gif"></td>
  </tr>
      <tr>
        <td width="124" height="23">&nbsp;</td>
        <td valign="bottom" align="center"> CopyRight &copy; 2008 www.**********.com 长春市*****有限公司</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="23">&nbsp;</td>
        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="8"></td>
        <td height="8"></td>
        <td height="8"></td>
      </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>