<%@ CodePage="936" Language="VBScript" %>
<%
Response.Buffer=True
Response.ContentType="text/html; Charset=gbk"

Const dbtype=2
Const dbfile="database/data.mdb.db"		'���ݿ��ļ�λ�ã�ʹ�����·���������и���
Const HomeLogo=""				'��վLogo��ַ
Const HomeName="MyHomePage"			'��վ����
Const HomeAddr="http://mjpclab.net/"	'��վ��ַ
Const VCodeCount=4			'��֤�볤��

Const HTMLSupport=False			'�Ƿ�֧��HTML True:�� False:��
Const AdminHTMLSupport=True		'����Ա�ظ��Ƿ�֧��HTML
Const AdminTimeOut=20		'����Ա��¼��ʱ(��)

Const ItemsPerPage=5		'ÿҳ��ʾ��������

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
<!-- #include file="common.asp" -->