<!-- #include file="config.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
	<title><%=HomeName%> 留言本 修改管理员密码</title>
	<!-- #include file="style.asp" -->

	<script type="text/javascript">
		function checkpass(cobject)
		{
			if (cobject.ioldpass.value=="") {alert("请输入原密码！"); cobject.ioldpass.focus(); return(false);}
			if (cobject.inewpass1.value=="") {alert("请输入新密码！"); cobject.inewpass1.focus(); return(false);}
			if (cobject.inewpass2.value=="") {alert("请输入确认密码！"); cobject.inewpass2.focus(); return(false);}
			if (cobject.inewpass1.value!=cobject.inewpass2.value) {alert("新密码与确认密码不同，请重新输入！"); cobject.inewpass1.focus(); return(false);}
			
			return (true);
		}
	</script>
</head>

<body onload="document.getElementById('ioldpass').focus();">

<div class="outerborder">
<table border="1" cellpadding="2" style="width:260px; margin:20px auto; border:solid 1px <%=TableBorderColor%>; border-collapse:collapse">
	<tr class="title">
		<td class="title centertitle">修改密码</td>
	</tr>
	<tr>
		<td class="content" style="padding-left:25px;">
			<br/>
			<form method="post" action="admin_savepass.asp" onsubmit="return checkpass(this)" name="form4">
			原密码　：<input type="password" name="ioldpass" id="ioldpass" size="20" maxlength="16" /><br/>
			新密码　：<input type="password" name="inewpass1" id="inewpass1" size="20" maxlength="16" /><br/>
			确认密码：<input type="password" name="inewpass2" id="inewpass2" size="20" maxlength="16" /><br/><br/>
			<div style="width:100%; text-align:center;"><input value="确定" type="submit" /></div>
			</form>
			<br/>
		</td>
	</tr>
</table>
</div>
</body>

</html>