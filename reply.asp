<!-- #include file="config.asp" -->
<!-- #include file="include/utility/md5.asp" -->

<%
Response.Expires=-1
if Not isnumeric(Request.QueryString("id")) or Request.QueryString("id")="" then
	Response.Redirect "admin.asp"
	Response.End 
end if
%>

<!-- #include file="include/template/dtd.inc" -->
<html>
<head>
	<!-- #include file="include/template/metatag.inc" -->
	<title><%=HomeName%> 留言本 回复留言</title>
	<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
	<!-- #include file="asset/css/style.asp" -->

	<script type="text/javascript">
		function submitcheck(cobject)
		{
			if (cobject.rcontent.value==='') {alert('请输入回复内容！'); cobject.rcontent.focus(); return false;}
			return (true);
		}
		function sfocus()
		{
			var e=document.getElementById('rcontent');
			if(e && e.value==='') e.focus();
		}
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

if Not rs.EOF then
	c_old=rs("reinfo")
else
	c_old=""
end if

rs.Close
cn.close
%>

<div class="topic reply">
	<h2 class="title">回复留言</h2>
	<form class="content" method="post" action="save_reply.asp" onsubmit="return submitcheck(this)" name="form3">
		<div class="field">
			<span class="value">
				<textarea class="textarea" name="rcontent" id="rcontent" autofocus="autofocus"><%=c_old%></textarea>
			</span>
		</div>
		<div class="command">
			<input type="hidden" name="page" id="page" value="<%=Server.HTMLEncode(Request.QueryString("page"))%>" />
			<input type="hidden" name="mainid" id="mainid" value="<%=Server.HTMLEncode(Request.QueryString("id"))%>" />
			<input type="submit" value="发表回复" />
		</div>
	</form>
</div>

<%
CreateConn cn,dbtype
rs.Open "SELECT * FROM main WHERE id=" &Request.QueryString("id"),cn,0,1,1
	
if Not rs.EOF then
%>
	<!-- #include file="listword.asp" -->
<%
end if

rs.Close
cn.Close
set rs=nothing
set cn=nothing	
%>

<!-- #include file="include/template/footer.inc" -->
</div>
</body>
</html>