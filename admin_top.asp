<div class="header">
	<h1 class="title">
	<%
	    if HomeLogo<>"" then Response.Write "<img src=""" &HomeLogo& """ alt=""" & HomeName & """ />"
		if HomeName<>"" then
			if HomeAddr<>"" then
				Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a> &raquo; "
			else
				Response.Write HomeName& " &raquo; "
			end if
		end if
		Response.Write "<a href=""index.asp"">���Ա�</a> &raquo; ����"
		%>
	</h1>
	<span><a href="admin_chpass.asp">�޸�����</a><a href="compact.asp">ѹ�����ݿ�</a><a href="admin_logoff.asp">ע��</a></span>
</div>
