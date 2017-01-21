<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="include/utility/md5.asp" -->
<!-- #include file="config.asp" -->
<!-- #include file="message.asp" -->
<%
response.expires=-1
if VCodeCount>0 and (Request.Form("ivcode")<>session("vcode") or session("vcode")="") then
	session("vcode")=""
	Call ErrorPage("ÑéÖ¤Âë´íÎó¡£","admin_login.asp")
	Response.End
else
	session("vcode")=""
end if

Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn
rs.Open "SELECT TOP 1 * FROM supervisor",cn,0,1,1

Session("adminpass")=md5(Request.Form("iadminpass"),16)
if Not rs.EOF then
	if Session("adminpass")=rs.Fields(0) then
		session.Timeout=clng(AdminTimeOut)
		Response.Redirect "admin.asp"
	else
		Call ErrorPage("ÃÜÂë´íÎó¡£","admin_login.asp")
		Response.End
	end if
else
	Call ErrorPage("ÃÜÂë´íÎó¡£","admin_login.asp")
	Response.End
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>