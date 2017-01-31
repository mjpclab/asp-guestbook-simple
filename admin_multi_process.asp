<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="admin_verify.asp" -->

<%
response.expires=-1
dim ids
ids=Request.Form("id")
ids=Replace(ids,"'","")
ids=Replace(ids,"[","")
ids=Replace(ids,";","")
ids=Replace(ids,"/","")
ids=Replace(ids,"-","")
ids=Replace(ids,chr(39),"")
ids=Replace(ids,"#","")
ids=Replace(ids,"%","")
ids=Replace(ids,"_","")
ids=Replace(ids,"=","")
ids=Replace(ids,">","")
ids=Replace(ids,"<","")

if ids<>"" then
	set cn=server.CreateObject("ADODB.Connection")
	CreateConn cn

	if Not IsEmpty(Request.Form("multi_del")) then
		cn.Execute "DELETE FROM reply WHERE articleid IN(" & ids & ")",,129
		cn.Execute "DELETE FROM main WHERE id IN(" & ids & ")",,129
	elseif Not IsEmpty(Request.Form("multi_passaudit")) then
		cn.Execute "UPDATE main SET auditting=false WHERE id IN(" & ids & ")",,129
	end if

	cn.Close
	set cn=nothing
end if

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>