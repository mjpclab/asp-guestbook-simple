<%
if rs.Fields("auditting") then %>
<div class="topic">
	<h2 class="title">(留言待审核……)</h2>
	<div class="content">
		<div class="words">(留言待审核……)</div>
	</div>
	<div class="status">
		<span class="item author">作者: (待审核……)</span>
		<span class="item logdate">发表于: <% =rs.Fields("logdate") %></span>
	</div>
</div>
<%else
	Dim article
	article=rs.Fields("article")
	if article<>"" then
		Call convertstr(article, HTMLSupport, UBBSupport, false)
	else
		article = "(无内容)"
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
			dim email, qqid, wechatid
			email=rs.Fields("email")
			qqid=rs.Fields("qqid")
			wechatid=rs.Fields("wechatid")
			if email<>"" then Response.Write "<a href=""mailto:" &email& """ title=""邮箱：" &email& """><img src=""asset/image/icon_mail.gif"" alt=""邮箱"" /></a>"
			if qqid<>"" then Response.Write "<a href=""tencent://message/?uin=" &qqid& """ title=""QQ：" &qqid& """><img src=""asset/image/icon_qq.gif"" alt=""QQ" &qqid& """ /></a>"
			if wechatid<>"" then Response.Write "<span title=""微信：" &wechatid& """><img src=""asset/image/icon_wechat.gif"" alt=""微信" &wechatid& """ /></span>"
			%>
			</div>
			<%if reinfo<>"" then%>
			<div class="reply">
				<h3 class="title">版主回复：</h3>
				<div class="content">
				<div class="words"><%=reinfo%></div>
			</div>
			</div>
			<%end if%>
		</div>
		<div class="status">
			<span class="item author">作者: <% =rs.Fields("name") %></span>
			<span class="item logdate">发表于: <% =rs.Fields("logdate") %></span>
		</div>
	</div>
<%end if%>
