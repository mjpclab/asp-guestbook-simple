<div class="topic">
	<h3 class="title">[���Է�ҳ]</h3>
	<div class="content">
	<%
	for j=1 to PagesCount
		if j=ipage then
			Response.Write "<span class=""page-num"">" & j & "</span>"
		else
			Response.Write "<a class=""page-num"" href=""?page=" & j & """>" & j &"</a>"
		end if
	next
	%>
	</div>
</div>