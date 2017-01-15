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
CreateConn cn

cn.Execute "UPDATE main SET auditting=false WHERE id=" & Request.QueryString("id"),,1

cn.Close
set cn=nothing

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>