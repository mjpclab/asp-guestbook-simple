<div class="header">
	<h1 class="title">
	<%
	    if HomeLogo<>"" then Response.Write "<img src=""" &HomeLogo& """ alt=""" & HomeName & """ />"
		if HomeName<>"" then
			if HomeAddr<>"" then
				Response.Write "<a href=""" &HomeAddr& """>" &HomeName& "</a>"
			else
				Response.Write HomeName
			end if
		end if

		Dim page
		if IsEmpty(Request.QueryString("page")) then
			page=""
		else
			page=Request.QueryString("page")
		end if
		%>
		 &raquo; <a href="index.asp<%if page<>"" then%>?page=<%=page%><%end if%>">留言本</a>
		 &raquo; <a href="admin.asp<%if page<>"" then%>?page=<%=page%><%end if%>">管理</a>
	</h1>
	<span><a href="admin_chpass.asp">修改密码</a><a href="admin_compact.asp">压缩数据库</a><a href="admin_logoff.asp">注销</a></span>
</div>
