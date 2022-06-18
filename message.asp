<%
sub ErrorPage(message, backPage)
	Call MessagePage(message, backPage)
end sub

sub MessagePage(message,backPage)
	%>
	<!-- #include file="include/template/dtd.inc" -->
	<html lang="zh-CN">
	<head>
		<!-- #include file="include/template/metatag.inc" -->
		<title><%=HomeName%> 留言本</title>
		<link rel="stylesheet" type="text/css" href="asset/css/style.css"/>
		<!-- #include file="asset/css/style.asp" -->
		<script type="text/javascript">
			window.onload = function() {
				alert('<%=message%>');
				window.location.replace('<%=backPage%>');
			};
		</script>
	</head>
	<body class="message-page">
		<p><%=message%></p>
		<p><a href="<%=backPage%>">[返回]</a></p>
	</body>
	</html>
	<%
end sub
%>
