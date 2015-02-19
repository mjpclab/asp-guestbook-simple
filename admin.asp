<!-- #include file="config.asp" -->
<!-- #include file="md5.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
	<title><%=HomeName%> 留言本 管理</title>
	<!-- #include file="style.asp" -->
</head>

<body>
<!-- #include file="admin_top.asp" -->

<%
response.expires=-1

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT * FROM main","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<div class="outerborder">
<form method="post" action="mdel.asp" onsubmit="return confirm('确实要删除选定留言吗？')">
	<input type="submit" value="删除选定留言" style="margin-top:20px;" />
<%while rs.EOF=false and Response.IsClientConnected%>
	<!-- #include file="listword.asp" -->
	
	<table border="0" cellpadding="2" style="width:<%=TableWidth%>px; border-collapse:collapse;">
		<tr>
			<td>
			<input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" /><label for="id_<%=rs("id")%>">(选定)</label> 
			<a href="reply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="回复此留言"><img alt="" src="image/icon_reply.gif" style="border-width:0px;" />[回复]</a> 
			<a href="del.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="删除留言"><img alt="" src="image/icon_del.gif" style="border-width:0px;" />[删除]</a> 
			<% if rs("replied")=true then %><a href="delreply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="删除回复"><img alt="" src="image/icon_delreply.gif" style="border-width:0px;" />[删除回复]</a> <% end if %>
			</td>
		</tr>
	</table>
<%
rs.MoveNext
wend
%>
	<input type="submit" value="删除选定留言" style="margin-top:20px;" />
</form>

<table border="1" cellpadding="2" class="onetopic">
	<tr class="title">
		<td class="title centertitle">
			[留言分页]
		</td>
	</tr>
	<tr>
		<td class="content">
		<%
		for j=1 to PagesCount
			if j=ipage then
				Response.Write "<span style=""color:#FF0000"">[" &cstr(j)&"] </span>"
			else
				Response.Write "<a href=""admin.asp?page=" & cstr(j) & """>[" &cstr(j)&"]</a> "
			end if
		next
		%>
		</td>
	</tr>
</table>

</div>

<%
rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>

<!-- #include file="bottom.asp" -->
</body>
</html>