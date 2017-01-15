<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="include/utility/ubbcode.asp" -->
<!-- #include file="config.asp" -->

<!-- #include file="include/template/dtd.inc" -->
<html>
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> ¡Ù—‘±æ</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->
</head>

<body>
<div class="outerborder">

<!-- #include file="include/template/top_guest.inc" -->

<%
response.expires=-1
Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
Dim ItemsCount,PagesCount,CurrentItemsCount,ipage
get_divided_page cn,rs,"SELECT COUNT(id) FROM main","SELECT main.*,reply.reinfo FROM main LEFT JOIN reply ON main.id=reply.articleid","id DEC",Request.QueryString("page"),ItemsPerPage,ItemsCount,PagesCount,CurrentItemsCount,ipage
%>

<%while Not rs.EOF%>
<!-- #include file="include/template/message.inc" -->
<%
rs.MoveNext
wend
%>

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