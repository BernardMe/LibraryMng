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
    function checkdate(){
        $("#dateSpan").empty();
        
       if($.trim($("#createdate").val()).length==0){
                $("#dateSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>请进行选择</font>");
                return false;
       }else{
           return true;
       } 
    }
    function checkname(){
        $("#nameSpan").empty();
       if($.trim($("#libraryname").val()).length==0){
                $("#nameSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>不能为空</font>");
                return false;
       }else{
           return true;
       } 
    }
    function checkAll(){
    	var sub=checkname()&checkdate();
    	if(sub){
    		return true;
    	}else{
    		return false;
    	}
    }
    function update(){
    	
    	if(checkAll()){
        	var flag=window.confirm("确定要保存吗?");
        	if(flag){
            	$.post("library.action",
            			{"m":"updateLibrary",
            		    "libraryname":$("#libraryname").val(),
            		    "curator":$("#curator").val(),
            		    "tel":$("#tel").val(),
            		    "address":$("#address").val(),
            		    "email":$("#email").val(),
            		    "url":$("#url").val(),
            		    "createdate":$("#createdate").val(),
            		    "introduce":$("#introduce").val()},function(data){
            		    	if(data=="success"){
            		    		window.location="library.action?m=showLibrary";
            		    	}else{
            		    		alert("修改失败，请重新修改");
            		    		window.location="library.action?m=showLibrary";
            		    	}
            		    })
        		
        	}
    	}
    }
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
                          <input name="libraryname" type="text" id="libraryname" value="${lib.libraryname }" size="30" onblur="checkname()">
                           <span id="nameSpan"></span>
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
                        <td align="left"><input name="createdate" type="date" id="createdate" size="30"
                               onblur="checkdate();"   value="${lib.createdate }"><span id="dateSpan"></span>
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
                                 onclick="update();" />
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
