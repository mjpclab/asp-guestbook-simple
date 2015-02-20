<%
if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)
%>
<script type="text/javascript">
	function submitcheck(cobject)
	{
		if (cobject.iname.value==="") {alert("请输入姓名。"); cobject.iname.focus(); return false;}
		if (cobject.ititle.value==="") {alert("请输入标题。"); cobject.ititle.focus(); return false;}
		return true;
	}
</script>

<div class="header">
	<h1 class="title">
	<%
	if HomeLogo<>"" then Response.Write "<img src=""" &HomeLogo& """ alt="""" style=""border:0px;"" />"
	if HomeName<>"" then
		if HomeAddr<>"" then
			Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a> &gt;&gt; 留言本"
		else
			Response.Write HomeName& " &gt;&gt; 留言本"
		end if
	end if
	%>
	</h1>
	<span><a href="admin_login.asp">管理</a></span>
</div>

<div class="topic write-words">
	<h2 class="title">欢迎您留言！</h2>
	<form class="content" method="post" action="write.asp" onsubmit="return submitcheck(this);" name="form1">
		<div class="contact">
			<div class="field">
				<span class="label">
					<img src="image/icon_name.gif" /><span class="text">姓名</span><span class="required">*</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="iname" maxlength="64" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_mail.gif" /><span class="text">邮件</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="imail" maxlength="48" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_qq.gif" /><span class="text">QQ号</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="iqq" maxlength="16" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<img src="image/icon_homepage.gif" /><span class="text">主页</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ihomepage" maxlength="192" />
				</span>
			</div>
		</div>
		<div class="article">
			<div class="field">
				<span class="label">
					<span class="text">标题</span><span class="required">*</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ititle" maxlength="64" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<span class="text">验证</span>
				</span>
				<span class="value">
					<input class="text" type="text" name="ivcode" autocomplete="off" /><img class="captcha" src="show_vcode.asp" />
				</span>
			</div>
			<div class="field">
				<span class="label">
					<span class="text">内容</span>
				</span>
				<span class="value">
					<textarea class="textarea" name="icontent"></textarea>
				</span>
			</div>
		</div>
		<div class="command">
			<input type="submit" value="发表留言" />
			<input type="reset" value="重写留言" />
		</div>
	</form>
</div>
