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

CreateConn cn
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT main.*,reply.reinfo FROM main LEFT JOIN reply ON main.id=reply.articleid","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<form method="post" action="admin_multi_process.asp">
	<input type="submit" name="multi_passaudit" value="ͨ�����ѡ������" class="admin-multi-submit" onclick="return confirm('ȷʵҪͨ�����ѡ��������');"/>
	<input type="submit" name="multi_del" value="ɾ��ѡ������" class="admin-multi-submit" onclick="return confirm('ȷʵҪɾ��ѡ��������');"/>
	<%while Not rs.EOF%>
	<!-- #include file="include/template/message_admin.inc" -->
	<div class="admin-tools">
		<span class="tool"><input type="checkbox" name="id" id="id_<%=rs.Fields("id")%>" value="<%=rs.Fields("id")%>" /><label for="id_<%=rs.Fields("id")%>">(ѡ��)</label></span>
		<%if auditting then%><a class="tool" href="admin_passaudit.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="ͨ�����"><img alt="" src="asset/image/icon_pass.gif" />[ͨ�����]</a><%end if%>
		<a class="tool" href="admin_del.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="ɾ������"><img alt="" src="asset/image/icon_del.gif" />[ɾ��]</a>
		<a class="tool" href="admin_reply.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="<%if auditting then%>ͨ����˲�<%end if%>�ظ�����"><img alt="" src="asset/image/icon_reply.gif" />[<%if auditting then%>ͨ����˲�<%end if%>�ظ�]</a>
		<% if rs.Fields("reinfo").ActualSize>0 then %><a class="tool" href="admin_delreply.asp?id=<%=rs.Fields("id")%>&page=<%=ipage%>" title="ɾ���ظ�"><img alt="" src="asset/image/icon_delreply.gif" />[ɾ���ظ�]</a> <% end if %>
	</div>
	<%
	rs.MoveNext
	wend
	%>

	<input type="submit" name="multi_passaudit" value="ͨ�����ѡ������" class="admin-multi-submit" onclick="return confirm('ȷʵҪͨ�����ѡ��������');"/>
	<input type="submit" name="multi_del" value="ɾ��ѡ������" class="admin-multi-submit" onclick="return confirm('ȷʵҪɾ��ѡ��������');"/>
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