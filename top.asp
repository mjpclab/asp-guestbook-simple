<%
if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)
%>
<script type="text/javascript">
	function submitcheck(cobject)
	{
		if (cobject.iname.value=="") {alert("请输入姓名。"); cobject.iname.focus(); return (false);}
		if (cobject.ititle.value=="") {alert("请输入标题。"); cobject.ititle.focus(); return (false);}
		return (true);
	}
</script>


<table border="0" cellpadding="2" style="width:<%=TableWidth%>px; border-collapse:collapse;">
	<tr class="title">
		<td>
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
		</td>
		<td style="height:40px; text-align:right;" nowrap="nowrap">
			 | <a href="admin_login.asp">管理</a>
		</td>
	</tr>
</table>

<table border="1" cellpadding="2" class="onetopic" style="margin-top:0px;">
	<tr class="title">
		<td class="title" style="text-align:right; padding-right:30px;">欢迎您留言！</td>
	</tr>
	<tr>
		<td style="background-color:<%=TableContentBGC%>;">
		<br/>
		<form method="post" action="write.asp" onsubmit="return submitcheck(this);" name="form1">
			<table border="0" cellpadding="0" style="width:100%; border-collapse:collapse;">
				<tr>
					<td style="vertical-align:top;">
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_name.gif" />　姓名<span style="color:#FF0000">*</span><input type="text" name="iname" size="16" maxlength="64" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_mail.gif" />　邮件 <input type="text" name="imail" size="16" maxlength="48" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_qq.gif" />　QQ号 <input type="text" name="iqq" size="16" maxlength="16" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_homepage.gif" />　主页 <input type="text" name="ihomepage" size="16" maxlength="192" /></p>
					</td>
					<td style="width:30px;"></td>
					<td style="vertical-align:top;">
						<table border="0" cellpadding="0" style="border-collapse:collapse;">
							<tr>
								<td>
									标题<span style="color:#FF0000">*</span><input type="text" name="ititle" size="16" maxlength="64" />
									
									<br/><br/>
									验证 <input type="text" name="ivcode" size="10" /><img alt="" src="show_vcode.asp" style="border-width:0px;" />
								
									<br/><br/>
									内容<br/>
									<textarea rows="4" name="icontent" cols="28"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<p style="text-align:center;">
				<input type="submit" value="发表留言" />　<input type="reset" value="重写留言" />
			</p>
		</form>
		</td>
	</tr>
</table>
