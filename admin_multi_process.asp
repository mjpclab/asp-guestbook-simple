<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config.asp" -->
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
	CreateConn cn,dbtype

	if Not IsEmpty(Request.Form("multi_del")) then
		cn.Execute "DELETE FROM reply WHERE articleid IN(" & ids & ")",,1
		cn.Execute "DELETE FROM main WHERE id IN(" & ids & ")",,1
	elseif Not IsEmpty(Request.Form("multi_passaudit")) then
		cn.Execute "UPDATE main SET auditting=false WHERE id IN(" & ids & ")",,1
	end if

	cn.Close
	set cn=nothing
end if

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>