<!-- #include file="config.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> ���Ա� �޸Ĺ���Ա����</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->

	<script type="text/javascript">
		function checkpass(cobject)
		{
			if (cobject.ioldpass.value==="") {alert("������ԭ���룡"); cobject.ioldpass.focus(); return false;}
			if (cobject.inewpass1.value==="") {alert("�����������룡"); cobject.inewpass1.focus(); return false;}
			if (cobject.inewpass2.value==="") {alert("������ȷ�����룡"); cobject.inewpass2.focus(); return false;}
			if (cobject.inewpass1.value!==cobject.inewpass2.value) {alert("��������ȷ�����벻ͬ�����������룡"); cobject.inewpass1.focus(); return false;}
			
			return true;
		}
	</script>
</head>

<body onload="document.getElementById('ioldpass').focus();">
<div class="outerborder">

<div class="topic chpass">
	<h2 class="title">�޸�����</h2>
	<form class="content" method="post" action="admin_savepass.asp" onsubmit="return checkpass(this)" name="form4">
		<div class="field">
			<span class="label">ԭ���룺</span>
			<span class="value"><input type="password" name="ioldpass" id="ioldpass" maxlength="16" autofocus="autofocus" /></span>
		</div>
		<div class="field">
			<span class="label">�����룺</span>
			<span class="value"><input type="password" name="inewpass1" id="inewpass1" maxlength="16" /></span>
		</div>
		<div class="field">
			<span class="label">ȷ�����룺</span>
			<span class="value"><input type="password" name="inewpass2" id="inewpass2" maxlength="16" /></span>
		</div>
		<div class="command">
			<input value="ȷ��" type="submit" />
		</div>
	</form>
</div>

</div>
</body>
</html>