<%
if VCodeCount>0 then session("vcode")=getvcode(VCodeCount)
%>
<script type="text/javascript">
	function submitcheck(cobject)
	{
		if (cobject.iname.value=="") {alert("������������"); cobject.iname.focus(); return (false);}
		if (cobject.ititle.value=="") {alert("��������⡣"); cobject.ititle.focus(); return (false);}
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
				Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a> &gt;&gt; ���Ա�"
			else
				Response.Write HomeName& " &gt;&gt; ���Ա�"
			end if
		end if
		%>
		</td>
		<td style="height:40px; text-align:right;" nowrap="nowrap">
			 | <a href="admin_login.asp">����</a>
		</td>
	</tr>
</table>

<table border="1" cellpadding="2" class="onetopic" style="margin-top:0px;">
	<tr class="title">
		<td class="title" style="text-align:right; padding-right:30px;">��ӭ�����ԣ�</td>
	</tr>
	<tr>
		<td style="background-color:<%=TableContentBGC%>;">
		<br/>
		<form method="post" action="write.asp" onsubmit="return submitcheck(this);" name="form1">
			<table border="0" cellpadding="0" style="width:100%; border-collapse:collapse;">
				<tr>
					<td style="vertical-align:top;">
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_name.gif" />������<span style="color:#FF0000">*</span><input type="text" name="iname" size="16" maxlength="64" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_mail.gif" />���ʼ� <input type="text" name="imail" size="16" maxlength="48" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_qq.gif" />��QQ�� <input type="text" name="iqq" size="16" maxlength="16" /></p>
						<p style="text-align:right"><img alt="" style="border-width:0px;" src="image/icon_homepage.gif" />����ҳ <input type="text" name="ihomepage" size="16" maxlength="192" /></p>
					</td>
					<td style="width:30px;"></td>
					<td style="vertical-align:top;">
						<table border="0" cellpadding="0" style="border-collapse:collapse;">
							<tr>
								<td>
									����<span style="color:#FF0000">*</span><input type="text" name="ititle" size="16" maxlength="64" />
									
									<br/><br/>
									��֤ <input type="text" name="ivcode" size="10" /><img alt="" src="show_vcode.asp" style="border-width:0px;" />
								
									<br/><br/>
									����<br/>
									<textarea rows="4" name="icontent" cols="28"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<p style="text-align:center;">
				<input type="submit" value="��������" />��<input type="reset" value="��д����" />
			</p>
		</form>
		</td>
	</tr>
</table>
