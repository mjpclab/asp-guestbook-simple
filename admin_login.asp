<!-- #include file="config.asp" -->
<%if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)%>

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
	<title><%=HomeName%> ���Ա� �����¼</title>
	<!-- #include file="style.asp" -->
</head>

<body onload="document.getElementById('iadminpass').focus();">
	<table border="1" cellpadding="2" style="width:200px; margin:20px auto; border:solid 1px <%=TableBorderColor%>; border-collapse:collapse;">
		<tr class="title">
			<td class="title centertitle">����Ա��¼</td>
		</tr>
		<tr><td class="content" style="padding-left:10px;">
		<br />
			<form method="post" action="login_verify.asp" id="form5" onsubmit="this.submit1.disabled=true;">
			���룺<input type="password" name="iadminpass" id="iadminpass" size="20" maxlength="16" /><br/><br/>
			��֤��<input type="text" name="ivcode" id="ivcode" size="10" /><img alt="" src="show_vcode.asp" style="border:0px;" /><br/><br/>
			<div style="width:100%; text-align:center;"><input type="submit" id="submit1" value="ȷ��" /></div>
			</form>
		<br />
		</td></tr>
	</table>
</body>
</html>