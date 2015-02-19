<!-- #include file="config.asp" -->
<!-- #include file="admin_verify.asp" -->
<!-- #include file="md5.asp" -->

<%
response.expires=-1

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn,dbtype
rs.Open "SELECT adminpass FROM supervisor",cn,1,3,1

if rs.EOF=false then
	if md5(Request.Form("ioldpass"),16)=rs(0) then
		pwd=md5(request("inewpass1"),16)
		session.Contents("adminpass")=pwd
		rs(0)=pwd
		rs.Update

		rs.Close:cn.Close : set rs=nothing : set cn=nothing
		response.Redirect "admin.asp"
	else
		Call MessagePage("ÃÜÂë´íÎó¡£","admin_chpass.asp")
	end if
else
	Call MessagePage("ÃÜÂë´íÎó¡£","admin_chpass.asp")
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>