<%
if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)
%>
<script type="text/javascript">
	function submitcheck(cobject)
	{
		if (cobject.iname.value==="") {alert("������������"); cobject.iname.focus(); return false;}
		if (cobject.ititle.value==="") {alert("��������⡣"); cobject.ititle.focus(); return false;}
		return true;
	}
</script>

<div class="header">
	<h1 class="title">
	<%
	if HomeLogo<>"" then Response.Write "<img src=""" &HomeLogo& """ alt="""" style=""border:0px;"" />"
	if HomeName<>"" then
		if HomeAddr<>"" then
			Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a> &gt;&gt; ���Ա�"
		else
			Response.Write HomeName& " &gt;&gt; ���Ա�"
		end if
	end if
	%>
	</h1>
	<span><a href="admin_login.asp">����</a></span>
</div>

<div class="topic write-words">
	<h2 class="title">��ӭ�����ԣ�</h2>
	<form class="content" method="post" action="write.asp" onsubmit="return submitcheck(this);" name="form1">
		<div class="contact">
			<div class="field">
				<span class="label">
					<img src="image/icon_name.gif" /><span class="text">����</span><span class="required">*</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="iname" maxlength="64" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_mail.gif" /><span class="text">�ʼ�</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="imail" maxlength="48" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_qq.gif" /><span class="text">QQ��</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="iqq" maxlength="16" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_homepage.gif" /><span class="text">��ҳ</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ihomepage" maxlength="192" />
				</span>
			</div>
		</div>
		<div class="article">
			<div class="field">
				<span class="label">
					<span class="text">����</span><span class="required">*</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ititle" maxlength="64" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<span class="text">��֤</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ivcode" autocomplete="off" /><img class="captcha" src="show_vcode.asp" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<span class="text">����</span>
				</span>
				<span class="value">
					<textarea class="textarea" name="icontent"></textarea>
				</span>
			</div>
		</div>
		<div class="command">
			<input type="submit" value="��������" />
			<input type="reset" value="��д����" />
		</div>
	</form>
</div>
