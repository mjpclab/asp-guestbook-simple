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
		| <a href="admin_chpass.asp">修改密码</a> | <a href="compact.asp">压缩数据库</a> | <a href="admin_logoff.asp">注销</a>
		</td>
	</tr>
</table>
