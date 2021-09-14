<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
 display-name="医保人员基础信息" description="人员基础信息" %>
 <%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<% 
String ctxpathemp = request.getContextPath();
%>
<table width="98%" algin="center">
<tr><td>
	<odin:groupBox title="医保人员基础信息">	
		<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" >
		<odin:tabLayOut/>
			<tr>
				<odin:textIconEdit property="eac012" label="社保编码" size="12"></odin:textIconEdit>
				<odin:textEdit property="aac003" label="姓名" readonly="true" size="12"></odin:textEdit>
				<odin:textEdit property="AAC004" label="性别" readonly="true" size="12"/>
				<odin:textEdit property="aab002" label="单位名称" readonly="true" size="30"></odin:textEdit>			
			</tr>
			<tr>
				<odin:textEdit property="yblb" label="待遇类别" readonly="true" size="12"/>
				<odin:textEdit property="aac006" label="出生日期" readonly="true" size="12"/>
				<odin:textEdit property="cbrq" label="参保日期" readonly="true" size="12"/>
				<odin:textEdit property="aac002" label="身份证号码" readonly="true" size="30"/>
			</tr>
			<tr>
			   <odin:textEdit property="ryxz" label="荣誉类别" readonly="true" size="12"/>
			   <odin:textEdit property="DNZHYE" label="当年帐户余额" readonly="true" size="12" ></odin:textEdit>
			   <odin:textEdit property="LNZHYE" label="历年帐户余额" readonly="true" size="12"></odin:textEdit>
			   <odin:textEdit property="ZHZYE" label="帐户总余额" readonly="true" size="12"></odin:textEdit>
			</tr>
		</table>
	</odin:groupBox>
</td></tr>
</table>