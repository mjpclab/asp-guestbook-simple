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
%>
<!-- #include file="common.asp" -->