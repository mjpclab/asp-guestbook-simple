<!-- #include file="config.asp" -->
<!-- #include file="include/utility/md5.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> 留言本 管理</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->
</head>

<body>
<div class="outerborder">
<!-- #include file="admin_top.asp" -->

<%
response.expires=-1

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT * FROM main","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<form method="post" action="mdel.asp" onsubmit="return confirm('确实要删除选定留言吗？')">
	<input type="submit" value="删除选定留言" style="margin-top:20px;" />
	<%while rs.EOF=false%>
	<!-- #include file="listword.asp" -->
	
	<div class="admin-tools">
		<span class="tool"><input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" /><label for="id_<%=rs("id")%>">(选定)</label></span>
		<a class="tool" href="reply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="回复此留言"><img alt="" src="asset/image/icon_reply.gif" />[回复]</a>
		<a class="tool" href="del.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="删除留言"><img alt="" src="asset/image/icon_del.gif" />[删除]</a>
		<% if rs("replied")=true then %><a class="tool" href="delreply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="删除回复"><img alt="" src="asset/image/icon_delreply.gif" />[删除回复]</a> <% end if %>
	</div>
	<%
	rs.MoveNext
	wend
	%>

	<input type="submit" value="删除选定留言" style="margin-top:20px;" />
</form>

<!-- #include file="listpagenum.asp" -->

<%
rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>

<!-- #include file="bottom.asp" -->
</div>
</body>
</html>