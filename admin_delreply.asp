<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
response.expires=-1
if Not isnumeric(Request.QueryString("id")) then
	Response.Redirect "index.asp"
	Response.End 
end if

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn

cn.Execute "DELETE FROM reply WHERE articleid=" & Request.QueryString("id"),,129

cn.Close
set cn=nothing

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>