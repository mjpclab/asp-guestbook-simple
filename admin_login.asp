<!-- #include file="config.asp" -->
<%if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)%>

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> 留言本 管理登录</title>
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<!-- #include file="style.asp" -->
</head>

<body onload="document.getElementById('iadminpass').focus();">
<div class="outerborder">
	<div class="topic login">
		<h2 class="title">管理员登录</h2>
		<form class="content" method="post" action="login_verify.asp" id="form5" onsubmit="this.submit1.disabled=true;">
			<div class="field">
				<span class="label">密码：</span>
				<span class="value"><input class="password" type="password" name="iadminpass" id="iadminpass" maxlength="16" autofocus="autofocus" /></span>
			</div>
			<div class="field">
				<span class="label">验证：</span>
				<span class="value"><input class="text captcha" type="text" name="ivcode" id="ivcode" /><img class="captcha" src="show_vcode.asp" /></span>
			</div>
			<div class="command">
				<input type="submit" id="submit1" value="确定" />
			</div>
		</form>
	</div>
</div>

</body>
</html>