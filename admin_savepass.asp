<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="include/utility/md5.asp" -->
<!-- #include file="admin_verify.asp" -->
<!-- #include file="message.asp" -->
<%
response.expires=-1

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn
rs.Open "SELECT adminpass FROM supervisor",cn,1,3,1

if Not rs.EOF then
	if md5(Request.Form("ioldpass"),16)=rs.Fields(0) then
		Dim pwd
		pwd=md5(Request.Form("inewpass1"),16)
		Session("adminpass")=pwd
		rs.Fields(0)=pwd
		rs.Update

		rs.Close:cn.Close : set rs=nothing : set cn=nothing
		response.Redirect "admin.asp"
	else
		Call ErrorPage("密码错误。","admin_chpass.asp")
	end if
else
	Call ErrorPage("密码错误。","admin_chpass.asp")
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>