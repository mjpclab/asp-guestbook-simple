<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="include/utility/ubbcode.asp" -->
<!-- #include file="config.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="include/template/dtd.inc" -->
<html>
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> ���Ա� ����</title>
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

CreateConn cn,dbtype
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT main.*,reply.reinfo FROM main LEFT JOIN reply ON main.id=reply.articleid","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<form method="post" action="admin_multi_process.asp" onsubmit="return confirm('ȷʵҪɾ��ѡ��������')">
	<input type="submit" name="multi_del" value="ɾ��ѡ������" class="admin-multi-submit"/>
	<%while Not rs.EOF%>
	<!-- #include file="include/template/message.inc" -->
	
	<div class="admin-tools">
		<span class="tool"><input type="checkbox" name="id" id="id_<%=rs.Fields("id")%>" value="<%=rs.Fields("id")%>" /><label for="id_<%=rs.Fields("id")%>">(ѡ��)</label></span>
		<a class="tool" href="admin_reply.asp?id=<%=rs.Fields("id")%>&amp;page=<%=ipage%>" title="�ظ�������"><img alt="" src="asset/image/icon_reply.gif" />[�ظ�]</a>
		<a class="tool" href="admin_del.asp?id=<%=rs.Fields("id")%>&amp;page=<%=ipage%>" title="ɾ������"><img alt="" src="asset/image/icon_del.gif" />[ɾ��]</a>
		<% if rs.Fields("replied") then %><a class="tool" href="admin_delreply.asp?id=<%=rs.Fields("id")%>&amp;page=<%=ipage%>" title="ɾ���ظ�"><img alt="" src="asset/image/icon_delreply.gif" />[ɾ���ظ�]</a> <% end if %>
	</div>
	<%
	rs.MoveNext
	wend
	%>

	<input type="submit" name="multi_del" value="ɾ��ѡ������" class="admin-multi-submit"/>
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