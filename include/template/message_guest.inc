<%
if rs.Fields("auditting") then %>
<div class="topic">
	<h2 class="title">(���Դ���ˡ���)</h2>
	<div class="content">
		<div class="words">(���Դ���ˡ���)</div>
	</div>
	<div class="status">
		<span class="item author">����: (����ˡ���)</span>
		<span class="item logdate">������: <% =rs.Fields("logdate") %></span>
	</div>
</div>
<%else
	Dim article
	article=rs.Fields("article")
	if article<>"" then
		Call convertstr(article, HTMLSupport, UBBSupport, false)
	else
		article = "(������)"
	end if

	Dim reinfo
	reinfo=rs.Fields("reinfo")
	if reinfo<>"" then
		Call convertstr(reinfo, AdminHTMLSupport, AdminUBBSupport, true)
	else
		reinfo=""
	end if
	%>
	<div class="topic">
		<h2 class="title"><%=rs.Fields("title") %></h2>
		<div class="content">
			<div class="words"><%=article%></div>
			<div class="icons">
			<%
			if rs.Fields("email")<>"" then Response.Write "<a href=""mailto:" &rs.Fields("email")& """ title=""�������䣺" &rs.Fields("email")& """><img src=""asset/image/icon_mail.gif"" alt="""" style=""border:0px;"" /></a>"
			if rs.Fields("qqid")<>"" then Response.Write "<span title=""����QQ��" &rs.Fields("qqid")& """><img src=""asset/image/icon_qq.gif"" alt=""����QQ��" &rs.Fields("qqid")& """ style=""border:0px;"" /></span>"
			if rs.Fields("homepage")<>"" then Response.Write "<a href=""" &rs.Fields("homepage")& """ target=""_blank"" title=""������ҳ��" &rs.Fields("homepage")& """><img src=""asset/image/icon_homepage.gif"" alt="""" style=""border:0px;"" /></a>"
			%>
			</div>
			<%if reinfo<>"" then%>
			<div class="reply">
				<h3 class="title">�����ظ���</h3>
				<div class="content">
				<div class="words"><%=reinfo%></div>
			</div>
			</div>
			<%end if%>
		</div>
		<div class="status">
			<span class="item author">����: <% =rs.Fields("name") %></span>
			<span class="item logdate">������: <% =rs.Fields("logdate") %></span>
		</div>
	</div>
<%end if%>