<table border="1" cellpadding="2" class="onetopic">
	<tr class="title">
		<td class="title"><%=rs("title") %></td>
	</tr>
	<tr>
		<td class="content">
			<%
			t_rs=rs("article")
			if t_rs<>"" then
				Response.Write t_rs
			else
				Response.Write "(������)"
			end if
			%>
			
			<%if rs("replied")=true then%>
				<table border="0" cellpadding="2" class="reply" style="border:dashed 1px <%=TableBorderColor%>; margin:20px;">
					<tr class="title noborder">
						<td class="title noborder" style="font-weight:bold;">�����ظ���</td>
					</tr>
					<tr>
						<td class="content noborder" style="border-style:none; border-width:0px;">
							<%
							set rs1=server.CreateObject("ADODB.Recordset")
							rs1.open "select * from reply where articleid=" &rs("id"),cn
							response.write rs1("reinfo")
							rs1.close
							set rs1=nothing
							%>
						</td>
					</tr>
				</table>
			<%end if%>
			
			<div class="icons">
			<%
			if rs("email")<>"" then Response.Write "<a href=""mailto:" &rs("email")& """ title=""�������䣺" &rs("email")& """><img src=""image/icon_mail.gif"" alt="""" style=""border:0px;"" /></a> "
			if rs("qqid")<>"" then Response.Write "<img src=""image/icon_qq.gif"" alt=""����QQ��" &rs("qqid")& """ style=""border:0px;"" /> "
			if rs("homepage")<>"" then Response.Write "<a href=""" &rs("homepage")& """ target=""_blank"" title=""������ҳ��" &rs("homepage")& """><img src=""image/icon_homepage.gif"" alt="""" style=""border:0px;"" /></a> "
			%>
			</div>
		</td>
	</tr>
	<tr class="status">
		<td class="status" nowrap="nowrap">����:<% =rs("name") %>��������:<% =rs("logdate") %></td>
	</tr>
</table>