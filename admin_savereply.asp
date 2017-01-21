<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
Response.Expires=-1
if Not isnumeric(Request.Form("mainid")) then
	Response.Redirect "index.asp"
	Response.End 
end if

set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn

if isnumeric(request.Form("mainid")) then
	dim reinfo
	reinfo=replace(Request.Form("rcontent"),"<%","< %")

	rs.Open "SELECT TOP 1 auditting FROM main WHERE id=" & Request.Form("mainid"),cn,0,3,1
	if Not rs.EOF then		'ÁôÑÔ´æÔÚ
		rs.Fields("auditting")=False
		rs.Update
		rs.Close
		rs.Open "SELECT TOP 1 * FROM reply WHERE articleid=" & Request.Form("mainid"),cn,0,3,1
		if rs.EOF then	'ÐÂ»Ø¸´
			rs.AddNew
			rs.Fields("articleid")=Request.Form("mainid")
		end if
		rs.Fields("reinfo")=reinfo
		rs.Update
		rs.Close
	else
		rs.Close
	end if

	cn.close
	set rs=nothing
	set cn=nothing
	Response.Redirect "admin.asp?page=" & Request.Form("page")
end if
%>
