<%
response.expires=-1
Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn
rs.Open "SELECT TOP 1 adminpass FROM supervisor",cn,0,1,1

if Not rs.EOF then
	if Session("adminpass")<>rs.Fields(0) then
		Response.Redirect "admin_login.asp"
		Response.End
	end if
else
	Response.Redirect "admin_login.asp"
	Response.End
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>