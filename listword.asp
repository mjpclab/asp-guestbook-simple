<div class="topic">
	<h2 class="title"><%=rs("title") %></h2>
	<div class="content">
		<div class="words">
		<%
			article=rs("article")
			if article<>"" then
				Response.Write article
			else
				Response.Write "(������)"
			end if
		%>
		</div>
		<div class="icons">
		<%
		if rs("email")<>"" then Response.Write "<a href=""mailto:" &rs("email")& """ title=""�������䣺" &rs("email")& """><img src=""image/icon_mail.gif"" alt="""" style=""border:0px;"" /></a>"
		if rs("qqid")<>"" then Response.Write "<span title=""����QQ��" &rs("qqid")& """><img src=""image/icon_qq.gif"" alt=""����QQ��" &rs("qqid")& """ style=""border:0px;"" /></span>"
		if rs("homepage")<>"" then Response.Write "<a href=""" &rs("homepage")& """ target=""_blank"" title=""������ҳ��" &rs("homepage")& """><img src=""image/icon_homepage.gif"" alt="""" style=""border:0px;"" /></a>"
		%>
		</div>
		<%if rs("replied")=true then%>
		<div class="reply">
			<h3 class="title">�����ظ���</h3>
			<div class="content">
			<div class="words">
			<%
				set rs1=server.CreateObject("ADODB.Recordset")
				rs1.open "select TOP 1 * from reply where articleid=" &rs("id"),cn
				response.write rs1("reinfo")
				rs1.close
				set rs1=nothing
			%>
			</div>
		</div>
		</div>
		<%end if%>
	</div>
	<div class="status">
		<span class="item author">����: <% =rs("name") %></span>
		<span class="item logdate">������: <% =rs("logdate") %></span>
	</div>
</div>
