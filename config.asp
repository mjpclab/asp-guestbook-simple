<%@ CodePage="936" Language="VBScript" %>
<%
Response.Buffer=True
Response.ContentType="text/html; Charset=gbk"

Const dbtype=2
Const dbfile="database/data.mdb.db"		'数据库文件位置，使用相对路径，请自行更改
Const HomeLogo=""				'网站Logo地址
Const HomeName="MyHomePage"			'网站名称
Const HomeAddr="http://mjpclab.net/"	'网站地址
Const VCodeCount=4			'验证码长度

Const HTMLSupport=False			'是否支持HTML True:是 False:否
Const AdminHTMLSupport=True		'管理员回复是否支持HTML
Const AdminTimeOut=20		'管理员登录超时(分)

Const ItemsPerPage=5		'每页显示的留言数

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
<!-- #include file="common.asp" -->