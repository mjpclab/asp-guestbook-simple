<!-- #include file="config.asp" -->
<!-- #include file="include/utility/md5.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> ���Ա� ����</title>
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

<form method="post" action="mdel.asp" onsubmit="return confirm('ȷʵҪɾ��ѡ��������')">
	<input type="submit" value="ɾ��ѡ������" style="margin-top:20px;" />
	<%while rs.EOF=false%>
	<!-- #include file="listword.asp" -->
	
	<div class="admin-tools">
		<span class="tool"><input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" /><label for="id_<%=rs("id")%>">(ѡ��)</label></span>
		<a class="tool" href="reply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="�ظ�������"><img alt="" src="asset/image/icon_reply.gif" />[�ظ�]</a>
		<a class="tool" href="del.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="ɾ������"><img alt="" src="asset/image/icon_del.gif" />[ɾ��]</a>
		<% if rs("replied")=true then %><a class="tool" href="delreply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="ɾ���ظ�"><img alt="" src="asset/image/icon_delreply.gif" />[ɾ���ظ�]</a> <% end if %>
	</div>
	<%
	rs.MoveNext
	wend
	%>

	<input type="submit" value="ɾ��ѡ������" style="margin-top:20px;" />
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