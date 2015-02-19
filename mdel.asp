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

	cn.Execute "DELETE FROM reply WHERE articleid IN(" & ids & ")",,1
	cn.Execute "DELETE FROM main WHERE id IN(" & ids & ")",,1

	cn.Close
	set cn=nothing
end if

Response.Redirect "admin.asp?page=" &Request.QueryString("page")
%>