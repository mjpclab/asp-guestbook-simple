<div class="header">
	<h1 class="title">
	<%
	    if HomeLogo<>"" then Response.Write "<img src=""" &HomeLogo& """ alt="""" style=""border:0px;"" />"
		if HomeName<>"" then
			if HomeAddr<>"" then
				Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a> &gt;&gt; "
			else
				Response.Write HomeName& " &gt;&gt; "
			end if
		end if
		Response.Write "<a href=""admin.asp?page=" & Request.QueryString("page") & """>���Ա�</a>"
		%>
	</h1>
	<span><a href="admin_chpass.asp">�޸�����</a><a href="compact.asp">ѹ�����ݿ�</a><a href="admin_logoff.asp">ע��</a></span>
</div>
