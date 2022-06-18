<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="include/template/dtd.inc" -->
<html lang="zh-CN">
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> 留言本 修改管理员密码</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->

	<script type="text/javascript">
		function checkpass(cobject)
		{
			if (cobject.ioldpass.value==="") {alert("请输入原密码！"); cobject.ioldpass.focus(); return false;}
			if (cobject.inewpass1.value==="") {alert("请输入新密码！"); cobject.inewpass1.focus(); return false;}
			if (cobject.inewpass2.value==="") {alert("请输入确认密码！"); cobject.inewpass2.focus(); return false;}
			if (cobject.inewpass1.value!==cobject.inewpass2.value) {alert("新密码与确认密码不同，请重新输入！"); cobject.inewpass1.focus(); return false;}
			
			return true;
		}
	</script>
</head>

<body onload="document.getElementById('ioldpass').focus();">
<div class="outerborder">
<!-- #include file="include/template/top_admin.inc" -->
<div class="topic chpass">
	<h2 class="title">修改密码</h2>
	<form class="content" method="post" action="admin_savepass.asp" onsubmit="return checkpass(this)" name="form4">
		<div class="field">
			<span class="label">原密码：</span>
			<span class="value"><input type="password" name="ioldpass" id="ioldpass" maxlength="16" autofocus="autofocus" /></span>
		</div>
		<div class="field">
			<span class="label">新密码：</span>
			<span class="value"><input type="password" name="inewpass1" id="inewpass1" maxlength="16" /></span>
		</div>
		<div class="field">
			<span class="label">确认密码：</span>
			<span class="value"><input type="password" name="inewpass2" id="inewpass2" maxlength="16" /></span>
		</div>
		<div class="command">
			<input value="确定" type="submit" />
		</div>
	</form>
</div>

</div>
</body>
</html>