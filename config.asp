<%@ CodePage="936" %>
<%
Session.CodePage=936
Response.Buffer=True
if InStr(Request.ServerVariables("HTTP_ACCEPT"),"text/xml")>0 then
	Response.ContentType="text/xml"
elseif IsEmpty(Request.ServerVariables("HTTP_ACCEPT")) then
	Response.ContentType="text/xml"
elseif Trim(Request.ServerVariables("HTTP_ACCEPT"))="" then
	Response.ContentType="text/xml"
else
	Response.ContentType="text/html"
end if
Response.CharSet="gb2312"

Const dbtype=2
Const dbfile="database/data.asp"		'���ݿ��ļ�λ�ã�ʹ�����·���������и���
Const HomeLogo=""				'��վLogo��ַ
Const HomeName="MyHomePage"			'��վ����
Const HomeAddr="http://"	'��վ��ַ
Const VCodeCount=4			'��֤�볤��

Const HTMLSupport="False"			'�Ƿ�֧��HTML True:�� False:��
Const AdminHTMLSupport="True"		'����Ա�ظ��Ƿ�֧��HTML
Const AdminTimeOut="20"		'����Ա��¼��ʱ(��)

Const ItemsPerPage="5"		'ÿҳ��ʾ��������

Const TableWidth="500"		'�����
Const TableAlign="center"		'�����뷽ʽ left:����� center:���� right:�Ҷ���

Const PageBackColor="#FFFFFF"		'����ɫ
Const PageBackImage="image/bg.jpg"			'����ͼƬ��ʹ�����·��
Const TableBorderColor="#80A8FF"		'���߿���ɫ
Const TableTitleBGC="#FFFFFF"			'������±��ⱳ��ɫ
Const TableTitleColor="#000000"		'������±�����ɫ
Const TableContentBGC="#EEEEEE"			'����������ݱ���ɫ
Const TableContentColor="#000000"		'�������������ɫ
Const TableInfoBGC="#FFFFFF"			'���������Ϣ����ɫ
Const TableInfoColor="#000000"		'���������Ϣ��ɫ

Const LinkNormal="#000000"		'�����ӣ�������ɫ
Const LinkVisited="#000000"		'�����ӣ��ѷ�����ɫ
Const LinkActive="#000000"		'�����ӣ����ɫ
Const LinkHover="#000000"			'�����ӣ������ͣ��ɫ
%>
<!-- #include file="common.asp" -->