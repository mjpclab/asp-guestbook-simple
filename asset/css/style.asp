<%
Const TableWidth=500		'�����

Const PageBackColor="#FFFFFF"		'����ɫ
Const PageBackImage="asset/image/bg.jpg"			'����ͼƬ��ʹ�����·��
Const TableBorderColor="#80A8FF"		'���߿���ɫ
Const TableTitleBGC="#d1e0ff"			'������±��ⱳ��ɫ
Const TableTitleColor="#000000"		'������±�����ɫ
Const TableContentBGC="#EEEEEE"			'����������ݱ���ɫ
Const TableContentColor="#000000"		'�������������ɫ
Const TableInfoBGC="#d6deec"			'���������Ϣ����ɫ
Const TableInfoColor="#000000"		'���������Ϣ��ɫ

Const LinkNormal="#000000"		'�����ӣ�������ɫ
Const LinkVisited="#000000"		'�����ӣ��ѷ�����ɫ
Const LinkActive="#000000"		'�����ӣ����ɫ
Const LinkHover="#000000"			'�����ӣ������ͣ��ɫ
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
