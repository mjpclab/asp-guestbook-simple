<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config.asp" -->
<%
Response.Expires=-1
if Request.Form("iname")="" then
	Call MessagePage("姓名不能为空。","index.asp")
	Response.End
elseif Request.Form("ititle")="" then
	Call MessagePage("标题不能为空。","index.asp")
	Response.End
elseif VCodeCount>0 and (Request.Form("ivcode")<>session("vcode") or session("vcode")="") then
	session("vcode")=""
	Call MessagePage("验证码错误。","index.asp")
	Response.End
else
	session("vcode")=""
end if

Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn
dim content1,name1,title1,email1,qqid1,homepage1
'----------------------------------
name1=server.HTMLEncode(Request.Form("iname"))

title1=server.HTMLEncode(Request.Form("ititle"))

email1=server.HTMLEncode(Request.Form("imail"))
email1=replace(replace(email1," ",""),"script:","script",1,-1,1)

qqid1=server.HTMLEncode(Request.Form("iqq"))
qqid1=replace(qqid1," ","")

homepage1=server.HTMLEncode(Request.Form("ihomepage"))
homepage1=replace(homepage1,"script:","script",1,-1,1)
if homepage1<>"" then
	if InStr(homepage1,"//")=0 then homepage1="http://" & homepage1
end if
content1=replace(Request.Form("icontent"),"<%","< %")
'-------------------------------------
rs.Open "SELECT TOP 1 * FROM main WHERE id IS NULL",cn,0,3,1
rs.AddNew
rs.Fields("name")=name1
rs.Fields("title")=title1
rs.Fields("email")=email1
rs.Fields("qqid")=qqid1
rs.Fields("homepage")=homepage1
rs.Fields("logdate")=cstr(now())
rs.Fields("article")=content1
rs.Fields("auditting")=NeedAudit
rs.Update

rs.Close
cn.Close
set rs=nothing
set cn=nothing

Response.Redirect "index.asp"
%>