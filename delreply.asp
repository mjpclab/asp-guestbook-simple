<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
response.expires=-1
if Not isnumeric(Request.QueryString("id")) then
	Response.Redirect "index.asp"
	Response.End 
end if

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn,dbtype

cn.Execute "DELETE FROM reply WHERE articleid=" & Request.QueryString("id"),,1
cn.Execute "UPDATE main SET replied=false WHERE id=" & Request.QueryString("id"),,1

cn.Close
set cn=nothing

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>