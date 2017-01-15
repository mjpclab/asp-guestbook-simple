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
		Response.Write "<a href=""index.asp"">留言本</a> &raquo; 管理"
		%>
	</h1>
	<span><a href="admin_chpass.asp">修改密码</a><a href="admin_compact.asp">压缩数据库</a><a href="admin_logoff.asp">注销</a></span>
</div>
