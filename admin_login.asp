<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<%if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)%>

<!-- #include file="include/template/dtd.inc" -->
<html>
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> ���Ա� �����¼</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->
</head>

<body onload="document.getElementById('iadminpass').focus();">
<div class="outerborder">
	<div class="topic login">
		<h2 class="title">����Ա��¼</h2>
		<form class="content" method="post" action="login_verify.asp" id="form5" onsubmit="this.submit1.disabled=true;">
			<div class="field">
				<span class="label">���룺</span>
				<span class="value"><input class="password" type="password" name="iadminpass" id="iadminpass" maxlength="16" autofocus="autofocus" /></span>
			</div>
			<div class="field">
				<span class="label">��֤��</span>
				<span class="value"><input class="text captcha" type="text" name="ivcode" id="ivcode" autocomplete="off" /><img class="captcha" src="show_vcode.asp" /></span>
			</div>
			<div class="command">
				<input type="submit" id="submit1" value="ȷ��" />
			</div>
		</form>
	</div>
</div>

</body>
</html>