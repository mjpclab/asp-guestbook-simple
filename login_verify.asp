<!-- #include file="config.asp" -->
<!-- #include file="md5.asp" -->

<%
response.expires=-1
if VCodeCount>0 and (Request.Form("ivcode")<>session("vcode") or session("vcode")="") then
	session("vcode")=""
	Call MessagePage("��֤�����","admin_login.asp")
	Response.End
else
	session("vcode")=""
end if

Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
rs.Open "SELECT * FROM supervisor",cn,0,1,1

session.Contents("adminpass")=md5(request("iadminpass"),16)
if rs.EOF=false then
	if session.Contents("adminpass")=rs(0) then
		session.Timeout=clng(AdminTimeOut)
		Response.Redirect "admin.asp"
	else
		Call MessagePage("�������","admin_login.asp")
		Response.End
	end if
else
	Call MessagePage("�������","admin_login.asp")
	Response.End
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>