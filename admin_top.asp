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
		| <a href="admin_chpass.asp">�޸�����</a> | <a href="compact.asp">ѹ�����ݿ�</a> | <a href="admin_logoff.asp">ע��</a>
		</td>
	</tr>
</table>
