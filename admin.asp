<!-- #include file="config.asp" -->
<!-- #include file="md5.asp" -->
<!-- #include file="admin_verify.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> ���Ա� ����</title>
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<!-- #include file="style.asp" -->
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
<%while rs.EOF=false and Response.IsClientConnected%>
	<!-- #include file="listword.asp" -->
	
	<table border="0" cellpadding="2" style="width:<%=TableWidth%>px; border-collapse:collapse;">
		<tr>
			<td>
			<input type="checkbox" name="id" id="id_<%=rs("id")%>" value="<%=rs("id")%>" /><label for="id_<%=rs("id")%>">(ѡ��)</label> 
			<a href="reply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="�ظ�������"><img alt="" src="image/icon_reply.gif" style="border-width:0px;" />[�ظ�]</a> 
			<a href="del.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="ɾ������"><img alt="" src="image/icon_del.gif" style="border-width:0px;" />[ɾ��]</a> 
			<% if rs("replied")=true then %><a href="delreply.asp?id=<%=rs("id")%>&amp;page=<%=ipage%>" title="ɾ���ظ�"><img alt="" src="image/icon_delreply.gif" style="border-width:0px;" />[ɾ���ظ�]</a> <% end if %>
			</td>
		</tr>
	</table>
<%
rs.MoveNext
wend
%>
	<input type="submit" value="ɾ��ѡ������" style="margin-top:20px;" />
</form>

<table border="1" cellpadding="2" class="onetopic">
	<tr class="title">
		<td class="title centertitle">
			[���Է�ҳ]
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