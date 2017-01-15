<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
Response.Expires=-1
if Not isnumeric(request("mainid")) then
	Response.Redirect "index.asp"
	Response.End 
end if

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn,dbtype

if isnumeric(request.Form("mainid"))=true then
	dim tcon
	tcon=replace(Request.Form("rcontent"),"<%","< %")

	rs.Open "SELECT TOP 1 * FROM main WHERE id=" & request("mainid"),cn,0,3,1
	if Not rs.EOF then		'留言存在
		rs("replied")=true
		rs.Update
		rs.Close
		rs.Open "SELECT TOP 1 * FROM reply WHERE articleid=" &request("mainid"),cn,0,3,1
		if rs.EOF=true then	'新回复
			rs.Close 
			rs.Open "INSERT INTO reply VALUES('" &Request.Form("mainid")& "','" &tcon& "')",cn
		else	'更新回复
			rs("reinfo")=tcon
			rs.Update
			rs.close
		end if
	end if

	cn.close
	set rs=nothing
	set cn=nothing
	Response.Redirect "admin.asp?page=" & Request.Form("page")
end if
%>
