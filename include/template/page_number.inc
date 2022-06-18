<div class="topic">
	<h3 class="title">[留言分页]</h3>
	<div class="content">
	<%
	Dim j
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