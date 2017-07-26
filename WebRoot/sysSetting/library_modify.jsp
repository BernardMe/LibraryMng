<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head>
   <base href="${applicationScope.basePath }">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    $(function(){
    	//alert('${user.mname}');
    	if('${user.mname}'!='gz'){
    		$("input").attr("disabled","disabled");
    		$("textarea").attr("disabled","disabled");
    	}
    })
</script>
<body >


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF">
      <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
             class="tableBorder_gray">
        <tr>
          <td height="510" valign="top" style="padding:5px;">
            <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 图书馆信息 &gt;&gt;&gt;</td>
              </tr>
              <tr>
                <td align="center" valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="84%">&nbsp;      </td>
                    </tr>
                  </table>
                  <form name="form1" method="post" action="library.do?action=libraryModify">

                    <table width="58%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                           bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
                      <tr align="center">
                        <td width="20%" align="left" style="padding:5px;">图书馆名称：</td>
                        <td width="80%" align="left">
                          <input name="libraryname" type="text" id="libraryname" value="${lib.libraryname }" size="30">

                        </td>
                      <tr>
                        <td align="left" style="padding:5px;">馆长：</td>
                        <td align="left"><input name="curator" type="text" id="curator" size="30" value="${lib.curator }"></td>
                      </tr>
                      <tr>
                        <td align="left" style="padding:5px;">联系电话：</td>
                        <td align="left"><input name="tel" type="text" id="tel" size="30" value="${lib.tel }"></td>
                      </tr>
                      <tr>
                        <td align="left" style="padding:5px;">联系地址：</td>
                        <td align="left"><input name="address" type="text" id="address" size="30" value="${lib.address }"></td>
                      </tr>
                      <tr>
                        <td align="left" style="padding:5px;">联系邮箱：</td>
                        <td align="left"><input name="email" type="text" id="email" size="30" value="${lib.email }">
                        </td>
                      </tr>
                      <tr>
                        <td align="left" style="padding:5px;">图书馆网址：</td>
                        <td align="left"><input name="url" type="text" id="url" size="30" value="${lib.url }"></td>
                      </tr>
                      <tr>
                        <td align="left" style="padding:5px;">建馆时间：</td>
                        <td align="left"><input name="createDate" type="date" id="createDate" size="30"
                                                value="${lib.createdate }">
                          (日期格式：2007-11-22)
                        </td>
                      </tr>
                      <tr>
                        <td height="84" align="left" style="padding:5px;">图书馆简介：</td>
                        <td align="left"><textarea name="introduce" cols="50" rows="5" class="wenbenkuang"
                                                   id="introduce">${lib.introduce }</textarea></td>
                      </tr>
                      <tr>
                        <td height="65" align="left" style="padding:5px;">&nbsp;</td>
                        <td>
                          <input type="button" name="Submit" value="保存" class="button"
                                 />
                          &nbsp;
                          <input type="reset" name="Submit" value="取消" class="button"
                                />
                        </td>
                      </tr>
                    </table>
                  </form>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
