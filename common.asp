<%
'===================
function CreateConn(byref tconn,byval tDBType)
	select case tDBType
	case 1
		tconn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=""" & server.Mappath(dbfile) & """"
		tconn.Open
	case 2
		tconn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=""" & server.Mappath(dbfile) & """"
		tconn.Open
	end select
end function
'==================================
function getvcode(byval codelen)
dim rvalue
randomize

rvalue=cstr(fix(abs(rnd*(10^codelen))))
if len(rvalue)<codelen then rvalue=string(codelen-len(rvalue),"0") & rvalue

getvcode=rvalue
end function
'==================================
sub get_divided_page(byref cn,byref rs,byval countsql,byval sql,byval keyword,byval request_page,byval ItemsEachPage,byref ItemsCount,byref PagesCount,byref CurrentItemsCount,byref ipage)
if clng(ItemsEachPage)>0 then 
	ItemsEachPage=clng(ItemsEachPage)
else
	ItemsEachPage=10
end if

rs.Open countsql,cn,,,1
ItemsCount=rs(0)
rs.Close

if ItemsCount mod ItemsEachPage <>0 then
	PagesCount=ItemsCount \ ItemsEachPage +1
else
	PagesCount=ItemsCount \ ItemsEachPage
end if

if ItemsCount=0 then ItemsCount=1
if CurrentItemsCount=0 then CurrentItemsCount=1
if PagesCount=0 then PagesCount=1

if isnumeric(request_page) and request_page<>"" then
	if clng(request_page)>PagesCount then
		ipage=PagesCount
	elseif clng(request_page)>0 then
		ipage=clng(request_page)
	else
		ipage=1
	end if
else
	ipage=1
end if

if ipage=PagesCount then
	CurrentItemsCount=ItemsCount - ItemsEachPage*(ipage -1)
else
	CurrentItemsCount=ItemsEachPage
end if

if lcase(left(sql,6))="select" then sql=right(sql,len(sql)-6)
if left(sql,1)<>" " then sql=" " & sql

rs.Open "SELECT * FROM (" & _
			"SELECT TOP " &cstr(CurrentItemsCount)& " * FROM (" & _
				"SELECT TOP " & cstr(ItemsEachPage*(ipage-1)+CurrentItemsCount) & sql & " ORDER BY " &replace(replace(keyword,"INC","ASC"),"DEC","DESC")& _
			") ORDER BY " &replace(replace(keyword,"INC","DESC"),"DEC","ASC")& _
		") ORDER BY " &replace(replace(keyword,"INC","ASC"),"DEC","DESC"),cn,,,1
end sub
'==================================
sub MessagePage(strMessage,backPage)
	%>
	<!-- #include file="inc_dtd.asp" -->
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn">
	<head>
		<title><%=HomeName%> ¡Ù—‘±æ</title>
		<!-- #include file="style.asp" -->
	</head>
	<body>
		<%=strMessage%><br />
		<a href="<%=backPage%>">[∑µªÿ]</a>
		<script type="text/javascript" defer="defer">
			alert('<%=strMessage%>');window.location.replace('<%=backPage%>');
		</script>
	</body>
	</html>
	<%
end sub
%>