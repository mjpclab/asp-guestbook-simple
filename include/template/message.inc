<div class="topic">
	<h2 class="title"><%=rs.Fields("title") %></h2>
	<div class="content">
		<div class="words">
		<%
			Dim article
			article=rs.Fields("article")
			if article<>"" then
				Call convertstr(article, HTMLSupport, UBBSupport, false)
				Response.Write article
			else
				Response.Write "(无内容)"
			end if
		%>
		</div>
		<div class="icons">
		<%
		if rs.Fields("email")<>"" then Response.Write "<a href=""mailto:" &rs.Fields("email")& """ title=""作者邮箱：" &rs.Fields("email")& """><img src=""asset/image/icon_mail.gif"" alt="""" style=""border:0px;"" /></a>"
		if rs.Fields("qqid")<>"" then Response.Write "<span title=""作者QQ：" &rs.Fields("qqid")& """><img src=""asset/image/icon_qq.gif"" alt=""作者QQ：" &rs.Fields("qqid")& """ style=""border:0px;"" /></span>"
		if rs.Fields("homepage")<>"" then Response.Write "<a href=""" &rs.Fields("homepage")& """ target=""_blank"" title=""作者主页：" &rs.Fields("homepage")& """><img src=""asset/image/icon_homepage.gif"" alt="""" style=""border:0px;"" /></a>"
		%>
		</div>
		<%if rs.Fields("replied") then%>
		<div class="reply">
			<h3 class="title">版主回复：</h3>
			<div class="content">
			<div class="words">
			<%
				Dim reinfo
				reinfo=rs.Fields("reinfo")
				Call convertstr(reinfo, AdminHTMLSupport, AdminUBBSupport, true)
				Response.Write reinfo
			%>
			</div>
		</div>
		</div>
		<%end if%>
	</div>
	<div class="status">
		<span class="item author">作者: <% =rs.Fields("name") %></span>
		<span class="item logdate">发表于: <% =rs.Fields("logdate") %></span>
	</div>
</div>
