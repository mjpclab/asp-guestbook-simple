<!-- #include file="config.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
response.expires=-1
if Not isnumeric(Request.QueryString("id")) then
	Response.Redirect "index.asp"
	Response.End 
end if

set cn=server.CreateObject("ADODB.Connection")
CreateConn cn,dbtype

cn.Execute "DELETE FROM reply WHERE articleid=" & Request.QueryString("id"),,1
cn.Execute "DELETE FROM main WHERE id=" & Request.QueryString("id"),,1

cn.Close
set cn=nothing

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>