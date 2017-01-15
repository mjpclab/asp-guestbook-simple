<%
Const TableWidth=500		'表格宽度

Const PageBackColor="#FFFFFF"		'背景色
Const PageBackImage="asset/image/bg.jpg"			'背景图片，使用相对路径
Const TableBorderColor="#80A8FF"		'表格边框颜色
Const TableTitleBGC="#d1e0ff"			'表格－文章标题背景色
Const TableTitleColor="#000000"		'表格－文章标题颜色
Const TableContentBGC="#EEEEEE"			'表格－文章内容背景色
Const TableContentColor="#000000"		'表格－文章内容颜色
Const TableInfoBGC="#d6deec"			'表格－作者信息背景色
Const TableInfoColor="#000000"		'表格－作者信息颜色

Const LinkNormal="#000000"		'超链接－正常颜色
Const LinkVisited="#000000"		'超链接－已访问颜色
Const LinkActive="#000000"		'超链接－活动颜色
Const LinkHover="#000000"			'超链接－鼠标悬停颜色
%>

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
