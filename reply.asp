<!-- #include file="config.asp" -->
<!-- #include file="md5.asp" -->

<%
Response.Expires=-1
if isnumeric(Request.QueryString("id"))=false or Request.QueryString("id")="" then
	Response.Redirect "admin.asp"
	Response.End 
end if
%>

<!-- #include file="inc_dtd.asp" -->
<html>
<head>
	<!-- #include file="inc_metatag.asp" -->
	<title><%=HomeName%> 留言本 回复留言</title>
	<link rel="stylesheet" type="text/css" href="style.css"/>
	<!-- #include file="style.asp" -->

	<script type="text/javascript">
	//<![CDATA[
		function submitcheck(cobject)
		{
			if (cobject.rcontent.value=='') {alert('请输入回复内容！'); cobject.rcontent.focus(); return false;}
			return (true);
		}
		function sfocus()
		{
			var e=document.getElementById('rcontent');
			if(e && e.value=='') e.focus();
		}
	//]]>
	</script>
</head>

<body onload="sfocus()">
<div class="outerborder">
<!-- #include file="admin_verify.asp" -->
<!-- #include file="admin_top.asp" -->

<%
set cn=server.CreateObject("ADODB.Connection")
set rs=server.CreateObject("ADODB.Recordset")

CreateConn cn,dbtype
rs.Open "SELECT * FROM reply WHERE articleid=" &Request.QueryString("id"),cn,0,1,1

if rs.EOF=false then 
	c_old=rs("reinfo")
else
	c_old=""
end if

rs.Close
cn.close
%>


	<table border="1" cellpadding="2" class="onetopic">
		<tr class="title">
			<td class="title"></td>
		</tr>
		<tr>
			<td class="content" style="text-align:center;">
				<br/>
				<form method="post" action="save_reply.asp" onsubmit="return submitcheck(this)" name="form3">
					回复内容<br/>
					<textarea rows="5" name="rcontent" id="rcontent" cols="50"><%=c_old%></textarea><br/><br/>
					<input type="hidden" name="page" id="page" value="<%=Server.HTMLEncode(Request.QueryString("page"))%>" />
					<input type="hidden" name="mainid" id="mainid" value="<%=Server.HTMLEncode(Request.QueryString("id"))%>" />
					<input type="submit" value="发表回复" />
				</form>
			</td>
		</tr>
	</table>

<%
CreateConn cn,dbtype
rs.Open "SELECT * FROM main WHERE id=" &Request.QueryString("id"),cn,0,1,1
	
if rs.EOF=false then
%>
	<!-- #include file="listword.asp" -->
<%
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing	
%>

<!-- #include file="bottom.asp" -->
</div>
</body>
</html>