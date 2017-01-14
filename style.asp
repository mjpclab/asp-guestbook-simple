<style type="text/css">
body {
	background-color:<%=PageBackColor%>;
	background-image:url(<%=PageBackImage%>);
}

input,textarea {
	border-color:<%=TableBorderColor%>;
}

a:link {color:<%=LinkNormal%>;}
a:visited {color:<%=LinkVisited%>;}
a:active {color:<%=LinkActive%>;}
a:hover {color:<%=LinkHover%>;}

.outerborder {
	max-width:<%=TableWidth%>px;
}
*html .outerborder {
	width:<%=TableWidth%>px;
}

.topic {
	border-color:<%=TableBorderColor%>;
}

.topic .title {
	border-color:<%=TableBorderColor%>;
	color:<%=TableTitleColor%>;
	background-color:<%=TableTitleBGC%>;
}

.topic .content {
	color:<%=TableContentColor%>;
	background-color:<%=TableContentBGC%>;
}

.topic .reply {
	border-color:<%=TableBorderColor%>;
}

.topic .status {
	border-color:<%=TableBorderColor%>;
	color:<%=TableInfoColor%>;
	background-color:<%=TableInfoBGC%>;
}

.topic .page-num {
	border-color:<%=TableContentBGC%>;
}
.topic a.page-num:hover {
	border-color:<%=TableBorderColor%>;
}
</style>
