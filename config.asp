<%
Const dbtype = 2
Const dbfile = "database/data.mdb.db"		'数据库文件位置，使用相对路径，请自行更改
Const HomeLogo = ""				'网站Logo地址
Const HomeName = "MyHomePage"			'网站名称
Const HomeAddr = "http://mjpclab.net/"	'网站地址

Const VCodeCount = 4			'验证码长度
Const NeedAudit = False			'留言是否需要审核 True:是 False:否

Const HTMLSupport = False			'访客留言是否支持HTML True:是 False:否
Const AdminHTMLSupport = True		'管理员回复是否支持HTML

Const UBBSupport = True		'访客留言是否支持UBB
Const UbbFlag_image = False		'访客UBB图片权限
Const UbbFlag_url = False		'访客UBB URL、Email权限
Const UbbFlag_autourl = True		'访客UBB自动识别网址权限
Const UbbFlag_player = False		'访客UBB播放控件权限
Const UbbFlag_paragraph = True		'访客UBB段落样式权限
Const UbbFlag_fontstyle = True		'访客UBB字体样式权限
Const UbbFlag_fontcolor = True		'访客UBB字体颜色权限
Const UbbFlag_alignment = True		'访客UBB对齐方式权限
Const UbbFlag_markdown_paragraph = True		'访客UBB Markdown段落样式权限
Const UbbFlag_markdown_fontstyle = True		'访客UBB Markdown字体样式权限
Const AdminUBBSupport = True		'管理员回复是否支持UBB

Const AdminTimeOut = 20		'管理员登录超时(分)

Const ItemsPerPage = 5		'每页显示的留言数
%>
<!-- #include file = "common.asp" -->