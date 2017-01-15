<%
'Verify code bitmap display module (simplified)
'(C) Copyright 2004-2005 MJ PC Lab
'http://mjpclab.net/
'If you use this code,please reserve the Copyright Declaration
'如果你使用此代码，请保留版权声明

Response.ContentType="asset/image/bmp"
Response.Expires = -1
Response.AddHeader "Pragma","no-cache"
Response.AddHeader "cache-control","no-cache, must-revalidate"

i_vcode=cstr(session("vcode"))
i_textcolor="000000"
i_bgcolor="FFFFFF"

alpha_width=8
alpha_height=8

dim alpha_px(9,7)

alpha_px(0,0)=60
alpha_px(0,1)=66
alpha_px(0,2)=66
alpha_px(0,3)=66
alpha_px(0,4)=66
alpha_px(0,5)=66
alpha_px(0,6)=66
alpha_px(0,7)=60

alpha_px(1,0)=16
alpha_px(1,1)=28
alpha_px(1,2)=16
alpha_px(1,3)=16
alpha_px(1,4)=16
alpha_px(1,5)=16
alpha_px(1,6)=16
alpha_px(1,7)=124

alpha_px(2,0)=56
alpha_px(2,1)=68
alpha_px(2,2)=64
alpha_px(2,3)=32
alpha_px(2,4)=16
alpha_px(2,5)=8
alpha_px(2,6)=68
alpha_px(2,7)=124

alpha_px(3,0)=56
alpha_px(3,1)=68
alpha_px(3,2)=64
alpha_px(3,3)=48
alpha_px(3,4)=64
alpha_px(3,5)=64
alpha_px(3,6)=68
alpha_px(3,7)=56

alpha_px(4,0)=48
alpha_px(4,1)=40
alpha_px(4,2)=36
alpha_px(4,3)=36
alpha_px(4,4)=126
alpha_px(4,5)=32
alpha_px(4,6)=32
alpha_px(4,7)=112

alpha_px(5,0)=124
alpha_px(5,1)=4
alpha_px(5,2)=4
alpha_px(5,3)=60
alpha_px(5,4)=64
alpha_px(5,5)=64
alpha_px(5,6)=66
alpha_px(5,7)=60

alpha_px(6,0)=112
alpha_px(6,1)=8
alpha_px(6,2)=4
alpha_px(6,3)=60
alpha_px(6,4)=68
alpha_px(6,5)=68
alpha_px(6,6)=68
alpha_px(6,7)=56

alpha_px(7,0)=126
alpha_px(7,1)=66
alpha_px(7,2)=64
alpha_px(7,3)=32
alpha_px(7,4)=32
alpha_px(7,5)=16
alpha_px(7,6)=16
alpha_px(7,7)=16

alpha_px(8,0)=60
alpha_px(8,1)=66
alpha_px(8,2)=66
alpha_px(8,3)=60
alpha_px(8,4)=66
alpha_px(8,5)=66
alpha_px(8,6)=66
alpha_px(8,7)=60

alpha_px(9,0)=60
alpha_px(9,1)=66
alpha_px(9,2)=66
alpha_px(9,3)=66
alpha_px(9,4)=124
alpha_px(9,5)=64
alpha_px(9,6)=32
alpha_px(9,7)=30


i_textcolor_red=cbyte("&H" & mid(i_textcolor,1,2))
i_textcolor_green=cbyte("&H" & mid(i_textcolor,3,2))
i_textcolor_blue=cbyte("&H" & mid(i_textcolor,5,2))

i_bgcolor_red=cbyte("&H" & mid(i_bgcolor,1,2))
i_bgcolor_green=cbyte("&H" & mid(i_bgcolor,3,2))
i_bgcolor_blue=cbyte("&H" & mid(i_bgcolor,5,2))

i_width=len(i_vcode)*alpha_width
i_height=alpha_height



'Copyright MJ PC Lab 2004-2005 [http://mjpclab.net]
'All rights reserved (MJ PC Lab版权所有)
'===============================================
dim row,k,bitpos,bmpstream,curNum,header
header=""
bmpstream=""
for row=alpha_height-1 to 0 step -1
	for k=0 to len(i_vcode)-1
		curNum=cint(mid(i_vcode,k+1,1))		
		for bitpos=0 to alpha_width-1
			if clng(alpha_px(curNum,row) and clng(2^bitpos)) <> 0 then
				bmpstream=bmpstream & chrB(i_textcolor_blue) & chrB(i_textcolor_green) & chrB(i_textcolor_red)
			else
				bmpstream = bmpstream & chrB(i_bgcolor_blue) & chrB(i_bgcolor_green) & chrB(i_bgcolor_red)
			end if
		next
	next
next
header=chrB(&H42) & chrB(&H4D) & getstr(&H36 + lenB(bmpstream),4) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & getstr(&H36,4) & getstr(&H28,4) & getstr(i_width,4) & getstr(i_height,4) & getstr(1,2) & getstr(24,2) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & getstr(lenB(bmpstream),4) & chrB(&H12) & chrB(&H0B) & chrB(0) & chrB(0) & chrB(&H12) & chrB(&H0B) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0) & chrB(0)
Response.BinaryWrite header & bmpstream

'-----------------------------------------------------
function getstr(num,bytecount)
if bytecount>0 then
	dim rvalue,strhex,t_i
	rvalue=""
	strhex=hex(num)
	strhex=string(bytecount*2-len(strhex),"0") & strhex
	
	for t_i = 1 to len(strhex) step 2
		rvalue=chrB(cbyte("&H" & mid(strhex,t_i,2))) & rvalue
	next
	
	getstr=rvalue
else
	getstr=""
end if
end function
%>