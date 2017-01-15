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

CreateConn cn,dbtype
dim content1,name1,title1,email1,qqid1,homepage1
'----------------------------------
name1=server.HTMLEncode(Request.Form("iname"))

title1=server.HTMLEncode(Request.Form("ititle"))

email1=server.HTMLEncode(Request.Form("imail"))
email1=replace(replace(email1," ",""),"script:","script",1,-1,1)

qqid1=server.HTMLEncode(Request.Form("iqq"))
qqid1=replace(qqid1," ","")

homepage1=server.HTMLEncode(Request.Form("ihomepage"))
homepage1=replace(replace(homepage1," ",""),"script:","script",1,-1,1)
if lcase(left(homepage1,7))<>"http://" and lcase(left(homepage1,6))<>"ftp://" and homepage1<>"" then homepage1="http://" & homepage1

if Not HtmlSupport then
	content1=server.HTMLEncode(Request.Form("icontent"))
else
	content1=Request.Form("icontent")
	content1=replace(content1,"<%","< %")
end if
'-------------------------------------
rs.Open "SELECT * FROM main WHERE id IS NULL",cn,0,3,1
rs.AddNew
rs("name")=name1
rs("title")=title1
rs("email")=email1
rs("qqid")=qqid1
rs("homepage")=homepage1
rs("logdate")=cstr(now())
rs("article")=content1
rs.Update

rs.Close
cn.Close
set rs=nothing
set cn=nothing

Response.Redirect "index.asp"
%>