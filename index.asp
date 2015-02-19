<!-- #include file="config.asp" -->
<!-- #include file="md5.asp" -->

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
	<title><%=HomeName%> 留言本</title>
	<!-- #include file="style.asp" -->
</head>

<body>
<!-- #include file="top.asp" -->

<%
response.expires=-1
Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT * FROM main","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>
<div class="outerborder">

<%while rs.EOF=false and Response.IsClientConnected%>
<!-- #include file="listword.asp" -->
<%
rs.MoveNext
wend
%>

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
				Response.Write "<a href=""index.asp?page=" & cstr(j) & """>[" &cstr(j)&"]</a> "
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