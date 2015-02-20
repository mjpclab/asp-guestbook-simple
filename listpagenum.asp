<div class="topic">
	<h3 class="title">[¡Ù—‘∑÷“≥]</h3>
	<div class="content">
	<%
	for j=1 to PagesCount
		if j=ipage then
			Response.Write "<span class=""page-num"">[" &cstr(j)&"]</span>"
		else
			Response.Write "<a class=""page-num"" href=""index.asp?page=" & cstr(j) & """>[" &cstr(j)&"]</a>"
		end if
	next
	%>
	</div>
</div>