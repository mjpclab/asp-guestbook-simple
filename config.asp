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
%>
<!-- #include file="common.asp" -->