<%
sub ErrorPage(message, backPage)
	Call MessagePage(message, backPage)
end sub

sub MessagePage(message,backPage)
	%>
	<!-- #include file="include/template/dtd.inc" -->
	<html>
	<head>
		<!-- #include file="include/template/metatag.inc" -->
		<title><%=HomeName%> ¡Ù—‘±æ</title>
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
		<p><a href="<%=backPage%>">[∑µªÿ]</a></p>
	</body>
	</html>
	<%
end sub
%>
