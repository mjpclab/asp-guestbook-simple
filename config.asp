<%
Const dbtype = 2
Const dbfile = "database/data.mdb.db"		'���ݿ��ļ�λ�ã�ʹ�����·���������и���
Const HomeLogo = ""				'��վLogo��ַ
Const HomeName = "MyHomePage"			'��վ����
Const HomeAddr = "http://mjpclab.net/"	'��վ��ַ

Const VCodeCount = 4			'��֤�볤��
Const NeedAudit = False			'�����Ƿ���Ҫ��� True:�� False:��

Const HTMLSupport = False			'�ÿ������Ƿ�֧��HTML True:�� False:��
Const AdminHTMLSupport = True		'����Ա�ظ��Ƿ�֧��HTML

Const UBBSupport = True		'�ÿ������Ƿ�֧��UBB
Const UbbFlag_image = False		'�ÿ�UBBͼƬȨ��
Const UbbFlag_url = False		'�ÿ�UBB URL��EmailȨ��
Const UbbFlag_autourl = True		'�ÿ�UBB�Զ�ʶ����ַȨ��
Const UbbFlag_player = False		'�ÿ�UBB���ſؼ�Ȩ��
Const UbbFlag_paragraph = True		'�ÿ�UBB������ʽȨ��
Const UbbFlag_fontstyle = True		'�ÿ�UBB������ʽȨ��
Const UbbFlag_fontcolor = True		'�ÿ�UBB������ɫȨ��
Const UbbFlag_alignment = True		'�ÿ�UBB���뷽ʽȨ��
Const UbbFlag_markdown_paragraph = True		'�ÿ�UBB Markdown������ʽȨ��
Const UbbFlag_markdown_fontstyle = True		'�ÿ�UBB Markdown������ʽȨ��
Const AdminUBBSupport = True		'����Ա�ظ��Ƿ�֧��UBB

Const AdminTimeOut = 20		'����Ա��¼��ʱ(��)

Const ItemsPerPage = 5		'ÿҳ��ʾ��������
%>
<!-- #include file = "common.asp" -->