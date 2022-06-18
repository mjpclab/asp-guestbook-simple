<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="include/utility/ubbcode.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="include/template/dtd.inc" -->
<html lang="zh-CN">
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> 留言本 管理</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->
</head>

<body>
<div class="outerborder">
<!-- #include file="include/template/top_admin.inc" -->

<%
response.expires=-1

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT main.*,reply.reinfo FROM main LEFT JOIN reply ON main.id=reply.articleid","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<form method="post" action="admin_multi_process.asp">
	<input type="submit" name="multi_passaudit" value="通过审核选定留言" class="admin-multi-submit" onclick="return confirm('确实要通过审核选定留言吗？');"/>
	<input type="submit" name="multi_del" value="删除选定留言" class="admin-multi-submit" onclick="return confirm('确实要删除选定留言吗？');"/>
	<%while Not rs.EOF%>
	<!-- #include file="include/template/message_admin.inc" -->
	<div class="admin-tools">
		<span class="tool"><input type="checkbox" name="id" id="id_<%=rs.Fields("id")%>" value="<%=rs.Fields("id")%>" /><label for="id_<%=rs.Fields("id")%>">(选定)</label></span>
		<%if auditting then%><a class="tool" href="admin_passaudit.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="通过审核"><img alt="" src="asset/image/icon_pass.gif" />[通过审核]</a><%end if%>
		<a class="tool" href="admin_del.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="删除留言"><img alt="" src="asset/image/icon_del.gif" />[删除]</a>
		<a class="tool" href="admin_reply.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="<%if auditting then%>通过审核并<%end if%>回复留言"><img alt="" src="asset/image/icon_reply.gif" />[<%if auditting then%>通过审核并<%end if%>回复]</a>
		<% if rs.Fields("reinfo").ActualSize>0 then %><a class="tool" href="admin_delreply.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="删除回复"><img alt="" src="asset/image/icon_delreply.gif" />[删除回复]</a> <% end if %>
	</div>
	<%
	rs.MoveNext
	wend
	%>

	<input type="submit" name="multi_passaudit" value="通过审核选定留言" class="admin-multi-submit" onclick="return confirm('确实要通过审核选定留言吗？');"/>
	<input type="submit" name="multi_del" value="删除选定留言" class="admin-multi-submit" onclick="return confirm('确实要删除选定留言吗？');"/>
</form>

<!-- #include file="include/template/page_number.inc" -->

<%
rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>

<!-- #include file="include/template/footer.inc" -->
</div>
</body>
</html>