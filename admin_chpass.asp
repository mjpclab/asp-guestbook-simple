<!-- #include file="config.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn">
<head>
	<title><%=HomeName%> ���Ա� �޸Ĺ���Ա����</title>
	<!-- #include file="style.asp" -->

	<script type="text/javascript">
		function checkpass(cobject)
		{
			if (cobject.ioldpass.value=="") {alert("������ԭ���룡"); cobject.ioldpass.focus(); return(false);}
			if (cobject.inewpass1.value=="") {alert("�����������룡"); cobject.inewpass1.focus(); return(false);}
			if (cobject.inewpass2.value=="") {alert("������ȷ�����룡"); cobject.inewpass2.focus(); return(false);}
			if (cobject.inewpass1.value!=cobject.inewpass2.value) {alert("��������ȷ�����벻ͬ�����������룡"); cobject.inewpass1.focus(); return(false);}
			
			return (true);
		}
	</script>
</head>

<body onload="document.getElementById('ioldpass').focus();">

<div class="outerborder">
<table border="1" cellpadding="2" style="width:260px; margin:20px auto; border:solid 1px <%=TableBorderColor%>; border-collapse:collapse">
	<tr class="title">
		<td class="title centertitle">�޸�����</td>
	</tr>
	<tr>
		<td class="content" style="padding-left:25px;">
			<br/>
			<form method="post" action="admin_savepass.asp" onsubmit="return checkpass(this)" name="form4">
			ԭ���롡��<input type="password" name="ioldpass" id="ioldpass" size="20" maxlength="16" /><br/>
			�����롡��<input type="password" name="inewpass1" id="inewpass1" size="20" maxlength="16" /><br/>
			ȷ�����룺<input type="password" name="inewpass2" id="inewpass2" size="20" maxlength="16" /><br/><br/>
			<div style="width:100%; text-align:center;"><input value="ȷ��" type="submit" /></div>
			</form>
			<br/>
		</td>
	</tr>
</table>
</div>
</body>

</html>