
<%
response.expires=-1
Dim cn,rs
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")
CreateConn cn,dbtype
rs.Open "SELECT adminpass FROM supervisor",cn,0,1,1

if rs.EOF=false then
	if Session("adminpass")<>rs(0) then
		Call MessagePage("ÃÜÂë´íÎó¡£","admin_login.asp")
		Response.End
	end if
else
	Call MessagePage("ÃÜÂë´íÎó¡£","admin_login.asp")
	Response.End
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing
%>