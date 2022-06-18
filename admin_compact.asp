<!-- #include file="include/template/page_instruction.inc" -->
<!-- #include file="config/config.asp" -->
<!-- #include file="include/utility/common.asp" -->
<!-- #include file="admin_verify.asp" -->
<!-- #include file="message.asp" -->
<%
sub fsosupported()
	dim tfso
	on error resume next
	err.number=0
	set tfso=Server.CreateObject("Scripting.FileSystemObject")
	set tfso=nothing
	if err.number<>0 then
		
		response.end
	end if
	on error goto 0
end sub

Response.Expires=-1
Call fsosupported
Dim fso, Engine, r_dbfile, r_dbfile_tmp
r_dbfile=server.mappath(dbfile)
r_dbfile_tmp=server.mappath(dbfile) & ".tmp"
Set fso = Server.CreateObject("Scripting.FileSystemObject")
If fso.FileExists(r_dbfile_tmp) Then fso.DeleteFile r_dbfile_tmp

If fso.FileExists(r_dbfile) Then
	Set Engine = Server.CreateObject("JRO.JetEngine")
	Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=""" & r_dbfile & """","Provider=Microsoft.Jet.OLEDB.4.0;Data Source=""" & r_dbfile_tmp & """;Jet OLEDB:Engine Type=5"
	fso.CopyFile r_dbfile_tmp,r_dbfile
	fso.DeleteFile (r_dbfile_tmp)
End If
Set fso = nothing
Set Engine = nothing

Call MessagePage("数据库压缩完成。","admin.asp")
%>