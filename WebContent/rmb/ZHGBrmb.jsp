<%@page import="com.utils.DBUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.insigma.odin.framework.util.GlobalNames"%>
<%@page import="com.insigma.siis.local.business.entity.A36"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false" %>
<%@page import="com.insigma.siis.local.pagemodel.cadremgn.sysmanager.authority.TableColInterface"%>
<%@include file="rmbZHGBServer.jsp" %>
<%
	//session.setAttribute("a1701FirstValue", SV(a01.getA1701()));
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<script src="jquery-1.7.2.min.js"> </script>

    <link href="css/main.css" rel="stylesheet">
    <title>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>
    <odin:head></odin:head>
    <odin:base></odin:base>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/shared/examples.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/shared/examples.js"></script>
    <script type="text/javascript" src="<%=ctxPath%>/basejs/helperUtil.js"></script>
    <script src="js/common.js"></script>
    <script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/third-party/zeroclipboard/ZeroClipboard.min.js"></script>
    <script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/xbrm/jquery-ui.min.css">
<script src="<%=request.getContextPath()%>/pages/xbrm/jquery-ui1.10.4.min.js"></script>
<style type="text/css">
.ui-tabs-vertical { width: 100%;height: 100%; }
.ui-tabs-vertical .ui-tabs-nav { padding: 1px,0px,1px,1px;; float: left; width: 150px;height: 100%; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 1 !important; margin: 0 -1px 2px 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block;width: 100%; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0;   border-right-color:rgb(214,227,243)  !important; }
.ui-tabs-vertical .ui-tabs-nav li.ui-state-active a,.ui-tabs-vertical .ui-tabs-nav li.ui-state-active{background-color: rgb(214,227,243);}
.ui-tabs-vertical .ui-tabs-panel { padding: 20px; /* float: right; */ width:100%;}
.ui-tabs .ui-tabs-nav LI.ui-tabs-active{margin-bottom: 2px;}
.ui-tabs .ui-tabs-panel{padding: 0px;}
.ui-tabs{padding: 0px;background-color: rgb(214,227,243);}
.ui-helper-reset{font-size: 12px;}
.ui-widget-header{background-image: none;border-right-width: 0px;}
.ui-widget-content{background-image: none;}
.ui-widget INPUT{ font-family: tahoma, arial, helvetica, sans-serif;font-size: 12px;}
.others-info-title{width:490px!important;font-size: 14px!important;text-align: left!important;font-weight: bold;}
#tabs-0{display: block;}
.tabs-0{position: absolute;left: -1000}
.bgclor{
	color:black !important;
}
#a99z191 td{
	border-left:0px !important;
}
input[disabled]{
	border: 1px solid #DDD;
	background-color: #0e90d2 !important;
	color:red !important;
}
.remark tr{
	width:70px;
}
.remark textarea{
	width:500px;
}
#bzxxx textarea{
	width:400px;
}
.x-combo-list-inner{
text-align: left;
}
#a0194c td{
	border-left:0px !important;
}
input[disabled]{
	border: 1px solid #DDD;
	background-color: #0e90d2 !important;
	color:red !important;
	height:100px;
}
</style>

</head>

<body id="ZHGBrmb" style="width:100%;height:632px;overflow:hidden; border: 0px;margin: 0px;padding: 0px; visibility: hidden;">


<div id="rmbButton" style="width: 278px;position: absolute;z-index: 1; top: 555px;left: 760px;">
	<%
	if(!"look".equals(sign)){
	%>
	<div style="width:90%;height:40px;margin-top:10px;">
	<%
		if (fromModules == null || "".equals(fromModules)){
	%>
		<div class="top_btn_style" id="previous_person"  onclick="showNext('-1')">上一人</div>
		<div class="top_btn_style" id="next_person"  onclick="showNext('1')" >下一人</div>
	<%
		}
	%>
		<div class="top_btn_style" style="width:50px;" onclick="prtRmb_new()" id="prtRmb">预览</div>
		<div class="top_btn_style" style="width:100px;display: none;" onclick="prtTG()" id="prtTG">打印套改表</div>
		<!-- <div class="top_btn_style" style="width:50px;" onclick="PRmb()" id="ylRmb" >打印</div> -->
	</div>

	<%
		if (fromModules == null || "".equals(fromModules)){
	%>
	<div style="width:100%;height:70px; ">
		<!-- <div class="top_btn_style" style="background-color:#3680C9;margin-left:13%;" onclick="peoplePortrait()">人员画像</div>
		<!-- <div id="continueAdd" class="top_btn_style" style="background-color:#3680C9;margin-left:6px;width:100px;" onclick="addnew()">继续增加</div> ajaxSubmit('saveAdt');-->
		<div id="continueAdd" class="top_btn_style" style="background-color:#3680C9;margin-left:6px;width:80px;" onclick="peoplePortrait();">干部画像</div>
		<div class="top_btn_style" style="background-color:#F08000;margin-left:10px;" onclick="savePerson()" >保&nbsp;&nbsp;存</div>
	</div>
	<%
		}
	}else{
	%>
	<div style="width:90%;height:40px;margin-top:10px;">
			<div class="top_btn_style" id="previous_person"  onclick="showNext('-1')">上一人</div>
		<div class="top_btn_style" id="next_person" onclick="showNext('1')" >下一人</div>
				<div class="top_btn_style" style="width:100px;" onclick="prtRmb_new()" id="prtRmb">预览任免表</div>
		<div class="top_btn_style" style="width:100px;display: none;" onclick="prtTG()" id="prtTG">打印套改表</div>
		<!-- <div class="top_btn_style" style="width:100px;" onclick="PRmb()" id="ylRmb">打印任免表</div> -->
			</div>
	<%} %>
</div>


<div id="tabs" >
	<odin:hidden property="pdfPath1"/>
  <ul id="ulTitle" style="display: none;">

  	<li  ><a href="#tabs-0" tabname="rmb" >基本情况</a></li>
  	<%-- <li><a href="#tabs-13" tabname="AttributeAddPage_GB" winid="AttributeAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.AttributeAddPageGB">
    		干部属性</a></li> --%>
    <%-- <li  ><a href="#tabs-1" tabname="EnterAddPage_GB" winid="EnterAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.EnterAddPageGB" >
    		进入管理</a></li> --%>
    <%-- <li  ><a href="#tabs-2" winid="RegisterAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.RegisterAddPageGB" >
    		公务员登记</a></li> --%>

    <%-- <li  ><a href="#tabs-3" winid="ExitAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.ExitAddPageGB">
    		退出管理</a></li>
    <li  ><a href="#tabs-11" winid="LiTui_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.LiTuiAddPageGB">
    		离退管理</a></li>
    <li  ><a href="#tabs-4" winid="AddressAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.AddressAddPageGB" >
    		住址通讯</a></li> --%>

    <%-- <li><a href="#tabs-5" tabname="ExaminationsAddPage_GB" winid="ExaminationsAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.ExaminationsAddPageGB" >
    		考试录用</a></li>
    <li><a href="#tabs-6" tabname="SelectPersonAddPage_GB" winid="SelectPersonAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.SelectPersonAddPageGB">
    		选调生</a></li>
    <li><a href="#tabs-7" tabname="OpenSelectAddPage_GB" winid="OpenSelectAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.OpenSelectAddPageGB">
    		公开遴选</a></li>
    <li><a href="#tabs-8" tabname="OpenTransferringAddPage_GB" winid="OpenTransferringAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.OpenTransferringAddPageGB">
    		公开选调</a></li> --%>
    <li><a href="#tabs-9" tabname="TrainAddPage_GB" winid="TrainAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.TrainAddPageGB&sign=<%=sign %>">
    		培训</a></li>
    <%-- <li><a href="#tabs-10" tabname="NiRenMian_GB" winid="NiRenMian_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.NiRenMianAddPageGB">
    		拟任免</a></li> --%>
    <li><a href="#tabs-12" tabname="JdInformationAddPage_GB" winid="JdInformationAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.JdInformationAddPageGB&a0000=<%=URLEncoder.encode(a0000,"UTF8") %>">
    		监督信息</a></li>

    <li  ><a href="#tabs-3" tabname="ExitAddPage_GB" winid="ExitAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.ExitAddPageGB&sign=<%=sign %>">
    		退出管理</a></li>
<%--     <li  ><a href="#tabs-11" tabname="LiTui_GB" winid="LiTui_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.LiTuiAddPageGB&sign=<%=sign %>">
    		离退管理</a></li> --%>
    <%-- <li  ><a href="#tabs-4" tabname="AddressAddPage_GB" winid="AddressAddPage_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.AddressAddPageGB&sign=<%=sign %>" >
    		住址通讯</a></li> --%>
   <%--  <li  ><a href="#tabs-15" tabname="RankByRules_GB" winid="RankByRules_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.RankByRulesGB&sign=<%=sign %>" >
    		套转后职级</a></li> --%>
    <%-- <li><a href="#tabs-20" tabname="Multimedia_GB" winid="Multimedia_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.MultimediaGB&sign=<%=sign %>">
    		多媒体信息</a></li> --%>
    <!--根据客户要求，只有授权了 家庭成员 的用户才能显示改页  -->
    <%-- <%if(familySign){
    %>
    <li><a href="#tabs-21" tabname="FamilyMembers_GB" winid="FamilyMembers_GB" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.FamilyMembersGB">
    		家庭成员</a></li>
    <%
    }
    %> --%>

    <li><a href="#tabs-14" tabname="LogManger_GB" winid="LogManger_GB" winsrc="<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.LogManger">操作记录</a></li>

	<%-- <li><a href="#tabs-22" tabname="GBRS_GB" winid="GBRS_GB" winsrc="<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.GBRS">干部人事</a></li> --%>
	
	
    <li id="tabs23hid"><a href="#tabs-23" tabname="A0196TagsAddPage" winid="A0196TagsAddPage" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.A0196TagsAddPage&sign=<%=sign%>&a0000=<%=a0000%>">
    		干部画像</a></li>
    <%-- <li id="tabs24hid"><a href="#tabs-24" tabname="AddJianLiAddPage" winid="AddJianLiAddPage" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.customquery.person.AddJianLiAddPage">
    		简历拆分</a></li>
     <li id="tabs25hid"><a href="#tabs-25" tabname="ZZBQTags" winid="ZZBQTags" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.ZZBQTags&sign=<%=sign%>&a0000=<%=a0000%>">
    		组织标签</a></li>		 --%>
    <!--  <li  ><a href="#tabs-33" tabname="rmbqt" >其他信息</a></li> -->
    <%--  <li ><a href="#tabs-33" tabname="rmbqt" winid="rmbqt" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.Qita&sign=<%=sign%>&a0000=<%=a0000%>">
    		其他信息</a></li> --%>
    <li ><a href="#tabs-34" tabname="PersontiveFile" winid="PersontiveFile" winsrc="<%=request.getContextPath() %>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.PersontiveFile&sign=<%=sign%>&a0000=<%=a0000%>&checkedgroupid=<%=checkedgroupid%>">
    		相关材料</a></li>
    
  </ul>
  <%-- <div id="tabs-33" class="GBx-fieldset" style="text-align: left;">
  <form action="" id="rmbform" name="rmbform" style="width:865px;height:430px;overflow: hidden;  ">
<input type="hidden"  name="tabIndex" value="1" id="tabIndex" alt="tab页号">
	<div class="main_div">

		<div class="inner_div left_div">
  
			<div class="top_div">
				<div style="width:100%;height:100%;">
					<!-- <div id="tabs1" class="top_tab_style active" onclick="tabSwitch('tabs','page',1)">任免审批表(一)</div>
					<div id="tabs2" class="top_tab_style" onclick="tabSwitch('tabs','page',2)">任免审批表(二)</div>  -->
 				    <!-- <div id="tabs4" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',4)">其他信息</div>  -->

 					<div id="tabs3" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',3)">标签信息</div>
 					 <!-- <div id="tabs6" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',6)">经历业绩</div>   -->
				</div>
			</div>
	<div class="hzdbInfo1">
			
			
			<script>

			
			$("#page2 input[type='checkbox']").click(function () {
			    if(this.checked){
			        $(this).attr('value','1')
			    }else {
			    	$(this).attr('value','0')
			    }
			});
			</script>
			<script>
				Ext.onReady(function(){
					//tabSwitch('tabs','page',1);
					//对信息集明细的权限控制，是否可以维护
					$h.fieldsDisabled(fieldsDisabled);
					//对信息集明细的权限控制，是否可以查看
					var imgdata = "url(<%=request.getContextPath()%>/image/suo.jpg)";
					$h.selectDisabled(selectDisabled,imgdata);
				});
			</script>
			
			
			<div class="top_div" style="display: none;">
				<div style="width:100%;height:100%;">

 					<div id="tabs3tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">标签信息</div>
				</div>
			</div>
			<div class="resume_div" id="page3" style="display:none;">
				<table class="remark tdtextclass" cellpadding="0" style="position: relative;">
					<!-- 历任重要职务重要经历  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">
							<div class="width-65 height-69 fontConfig label_color middle-css">历任重<br/>要职务<br/>重要经<br/>历标志</div>
						</td>
						<td class="height-70" colspan="6">
							<textarea id="a0193z" name="a0193z" rows="8" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('A0193ZTags','pages.zj.tags.A0193TagsAddPage','历任重要职务重要经历标志',780,580,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getA0193z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">熟&nbsp;悉<br/>领&nbsp;域</td>
						<td class="height-70" colspan="6">
							<textarea id="a0194z" name="a0194z" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('A0194ZTags','pages.zj.tags.A0194TagsAddPage','熟悉领域',780,550,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getA0194z()) %></textarea>
						</td>
					</tr>
					
					<!-- 是否获得省部级以上奖励  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">是否获得<br/>省部级以<br/>上奖励</td>
						<td class="height-70" colspan="6">
							<textarea id="tagsbjysjlzs" name="tagsbjysjlzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagSbjysjlAddPage','pages.zj.tags.TagSbjysjlAddPage','省部级以上奖励',780,360,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagsbjysjlzs()) %></textarea>
						</td>
					</tr>
					<!-- 人才类型  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">人才类型</td>
						<td class="height-70" colspan="6">
							<textarea id="tagrclxzs" name="tagrclxzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagRclxAddPage','pages.zj.tags.TagRclxAddPage','人才类型',800,330,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagrclxzs()) %></textarea>
						</td>
					</tr>
					<!-- 惩戒类型  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">惩戒类型</td>
						<td class="height-70" colspan="6">
							<textarea id="tagcjlxzs" name="tagcjlxzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagCjlxAddPage','pages.zj.tags.TagCjlxAddPage','惩戒类型',800,330,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagcjlxzs()) %></textarea>
						</td>
					</tr>
					<!-- 干部来源 -->
					 <tr style="height:50px;">
					 		<td  class=" height-80 fontConfig label_color">干&nbsp;部<br/>来&nbsp;源</td>
							<odin:select2 property="a0194c" value="<%=SV(extraTags.getA0194c()) %>" size="20" colspan="2"  style= "height:50px"
							data="['1','本单位产生'],['2','市直机关交流'],['3','区县市交流'],['4','副师职军转'],['5','其他']"></odin:select2>
					</tr> 
				</table>
			</div>
			<div class="top_div" >
				<div style="width:100%;height:100%;">

 					<div id="tabs4tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">其他信息</div>
				</div>
			</div>
			<div class="resume_div" id="page4" style="display:block;">
				<table class="remark tdtextclass" cellpadding="0px;" style="position: relative;">

						<!-- 页面修改 -->
						<tr>
							<td class="width-60 fontConfig label_color" style="height:240px;">其<br/>它<br/>信<br/>息</td>
							<td style="height:230px;width:490px;">

								<div style="height:100%;width:100%;">


										<table align="center" bgcolor="white" width="100%" height="100%" cellspacing="0px;" style='table-layout: fixed;'>




												<tr style="height:50px;">
												<td>
													<table id="a99z191" align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select property="a99z191" codeType="XZ91" label="保留待遇" defaultValue="<%=SV(a99Z1.getA99z191()) %>" colspan="1"  styleClass="a99z191"></odin:select>
													  </tr>
													</table>
												</td>
													<td class="right_td1" align="center" style="padding-left:3%;width:47%;border-top:0px">
														<div style="width:100%;height:50px;line-height:50px;">
														<div style="float:left;width:60px;text-align:left;"><span style="font-size: 12px;">&nbsp;&nbsp;联系方式</span></div>
														<input type="text" name="a99z195" id="a99z195" value="<%=SV(a99Z1.getA99z195()) %>" class="right_input_btn" maxlength="18" style="margin-top:16px;width:150px;" >
														</div>
													</td>

												</tr>
												
												<tr style="height:50px;">
												<td>
													<table   align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select2 property="a99z1301" codeType="PY02" width="140"  label="培养方向" multiSelect="true"  value="<%=a99Z1.getA99z1301() %>" colspan="1"  styleClass="a99z191"/>
													  </tr>
													</table>
												</td>
												<td>
													<table   align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select property="a99z1302" codeType="PY01" width="120" label="培养方式" multiSelect="true" value="<%=a99Z1.getA99z1302() %>" colspan="1"  styleClass="a99z191"></odin:select>
													  </tr>
													</table>
													<script type="text/javascript">
														Ext.onReady(function(){
															Ext.getCmp('a99z1301_combo').on('select',function(obj){
																$('#a99z1301').val(obj.getCheckedValue())
															});
															Ext.getCmp('a99z1302_combo').on('select',function(obj){
																$('#a99z1302').val(obj.getCheckedValue())
															});
														});
													
													</script>
												</td>

												</tr>
												<tr>
													<td>
													<table   >
													  <tr id="bzxxx" style="height:30px;">
														<odin:textarea property="a99z1303"   label="培养建议" value="<%=a99Z1.getA99z1303()  %>"     />
													  </tr>
													</table>
												</td>
												</tr>
												<tr>
													<td>
													<table   >
													  <tr id="bzxxx" style="height:30px;">
														<odin:textarea property="a99z1304"   label="主要不足" value="<%=a99Z1.getA99z1304()  %>"     />
													  </tr>
													</table>
												</td>
												</tr>
											</table>
								</div>
							</td>
						</tr>

						<tr>
							<td class="width-60 fontConfig label_color" style="height:99px;">备注</td>
							<td style="height:79px;width:490px;">
								<textarea id="a0180" name="a0180" rows="3" cols="6" label="备注" style="width:100%;height:100%"><%=SV(a01.getA0180()) %></textarea>
							</td>
						</tr>


				</table>
			</div>
			

<!-- 省组标签page6 -->
			<div class="top_div" >
				<div style="width:100%;height:100%;">

 					<div id="tabs6tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">经历业绩</div>
				</div>
			</div>
			<div class="resume_div" id="page6" style="display:block;">
				<table class=" tdtextclass" cellpadding="0px;" style="position: relative;">
					<tbody >
					<!-- 历任重要职务重要经历  -->
					<tr>
						<td  class="sz-label height-80 fontConfig label_color">历任(含现任)重要职务重要经历标志</td>
						<td class="height-76" colspan="6">
							<textarea id="sza0193z" name="sza0193z" rows="3" cols="6" class="editorArea font-left "  readonly="readonly" ondblclick="rzzyjlClick();" ><%=SV(szextraTags.getA0193z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域  -->
					<tr>
						<td  class=" height-80 fontConfig label_color">熟&nbsp;悉<br/>领&nbsp;域</td>
						<td class="height-40" colspan="6">
							<textarea id="sza0194z" name="sza0194z" rows="3" cols="6" class="editorArea font-left" readonly="readonly" ondblclick="sxlyClick();" ><%=SV(szextraTags.getA0194z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域 备注 -->
					<tr>
						<td  class=" height-80 fontConfig label_color">熟悉领<br/>域备注</td>
						<td class="height-40"  colspan="6">
							<textarea id="sza0194c" name="sza0194c" rows="3" cols="6" class="editorArea font-left"><%=SV(szextraTags.getA0194c()) %></textarea>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

 </div>
		</div>
		
	</div>
	<input type="hidden" value="<%=a0000 %>" name="a0000" id="a0000" alt="人员id">
	<input type="hidden" value="<%=checkedgroupid %>" name="checkedgroupid" id="checkedgroupid" alt="人员id">
	<input type="hidden" value="<%=SV(a01.getA0141()) %>" name="a0141" id="a0141" alt="政治面貌">
	<input type="hidden" value="<%=SV(a01.getA3921()) %>" name="a3921" id="a3921" alt="第二党派">
	<input type="hidden" value="<%=SV(a01.getA3927()) %>" name="a3927" id="a3927" alt="第三党派">
	<input type="hidden" value="<%=SV(a01.getA0144()) %>" name="a0144" id="a0144" alt="入党时间">
	<input type="hidden" value="<%=SV(a01.getA0192()) %>" name="a0192" id="a0192" alt="现工作单位及职务简称">
	<input type="hidden" value="<%=SV(a01.getA0163()) %>" name="a0163" id="a0163" alt="人员管理状态">
	<!-- 1：有修改权限，2：无修改权限 -->
	<input type="hidden" value="1" name="isUpdate" id="isUpdate" alt="是否有修改权限">
	<input type="hidden" value="<%=SV(a01.getA0148()) %>" name="a0148" id="a0148" alt="职务层级">
	<input type="hidden" value="<%=SV(a01.getA0221()) %>" name="a0221" id="a0221" alt="现职务层次">
	<input type="hidden" value="<%=SV(a01.getA0192e()) %>" name="a0192e" id="a0192e" alt="现职级">
	<input type="hidden" value="<%=SV(a01.getA1701()) %>" name="a1701" id="a1701" alt="简历">
	<input type="hidden" value="<%=SV(a99Z1.getA99Z100()) %>" name="a99Z100" id="a99Z100" alt="id">
	<input type="hidden" id="pdfPath" alt="pdf路径">
	<input type="hidden" id="familyRowNum" alt="家庭成员的行号">
	<input type="hidden" value="<%=SV(extraTags.getA0194zcode()) %>" name="a0194zcode" id="a0194zcode" alt="熟悉领域代码">
	<input type="hidden" value="<%=SV(extraTags.getA0196zcode()) %>" name="a0196zcode" id="a0196zcode" alt="专业类型代码">
	<input type="hidden" value="<%=SV(a99Z1.getA99z101()) %>" name="a99z101F" id="a99z101F" alt="是否考录">
	<input type="hidden" value="<%=SV(a99Z1.getA99z103()) %>" name="a99z103F" id="a99z103F" alt="是否选调生">
	<input type="hidden" value="<%=SV(a01.getFkbs()) %>" name="fkbs" id="fkbs" alt="分库标识">
	<input type="hidden" value="<%=SV(a01.getFkly()) %>" name="fkly" id="fkly" alt="分库来源">
</form>
</div> --%>
  
  
  
   
	      <div id="tabs-0" class="GBx-fieldset" style="text-align: left;">
<form action="" id="rmbform" name="rmbform" style="width:865px;height:630px;overflow: hidden;  ">
<input type="hidden"  name="tabIndex" value="1" id="tabIndex" alt="tab页号">
	<div class="main_div">

		<div class="inner_div left_div">
  
			<div class="top_div">
				<div style="width:100%;height:100%;">
					<div id="tabs1" class="top_tab_style active" onclick="tabSwitch('tabs','page',1)">任免审批表(一)</div>
					<div id="tabs2" class="top_tab_style" onclick="tabSwitch('tabs','page',2)">任免审批表(二)</div> 
 				    <div id="tabs4" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',4)">其他信息</div> 

 					<%-- <div id="tabs3" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',3)">标签信息</div> --%>
 					 <div id="tabs6" class="top_tab_style" style="width:70px;" onclick="tabSwitch('tabs','page',6)">经历业绩</div>  
				</div>
			</div>
	<div class="hzdbInfo">
			<div class="resume_div" id="page1"  >
				<table class="person_resume"  cellpadding="0px;" style="position: relative;">
					<tbody >
						<tr>
							<td class="width-60 height-40 fontConfig label_color"><font color="red">*</font>姓&nbsp;名</td>
							<td class="width-80 height-40">
								<tags:rmbNormalInput property="a0101" offsetTop="1" cls="width-80 height-40 no-y-scroll" label="姓名"   defaultValue="<%=SV(a01.getA0101()) %>"
title="姓名字数不能超过18----" textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field"
onkeypress="namevalidator" type="true"/>
							</td>
							<td class="width-60 height-40 fontConfig label_color"><font color="red">*</font>性&nbsp;别</td>
							<td class="width-80 height-40 ">
								<tags:rmbSelect property="a0104" cls="height-40 input-text2" label="性别" selectTDStyle="width:80px;" selectDivStyle="width:300px;"
textareaStyle="width:80px;line-height:40px !important;" codetype="GB2261" defaultValue="<%=SV(a01.getA0104()) %>"/>
							</td>
							<td class="width-60 height-40 fontConfig label_color"><font color="red">*</font>出&nbsp;生<br/>&nbsp;年&nbsp;月</td>
							<td class="width-80 height-40 ">
								<tags:rmbDateInput type="true" property="a0107" offsetTop="1" cls="width-80 height-40 no-y-scroll" label="出生年月"   onblur="validateYearM()"  defaultValue="<%=SV(a01.getA0107()) %>"
 textareaStyle="display:none;text-align:center;"  textareaCls="cellbgclor x-form-field"/>
							</td>
							<td class="width-110 height-140" rowspan="4">
								<img alt="照片" id="personImg" style="cursor:pointer;" onclick="showdialog()" width="120" height="100%" src="<%= request.getContextPath()%>/servlet/DownloadUserHeadImage?a0000=<%=URLEncoder.encode(URLEncoder.encode(a01.getA0000(),"UTF-8"),"UTF-8")%>">
							</td>

						</tr>
						<tr>
							<td class="width-60 height-40 fontConfig label_color" ><font color="red">*</font>民&nbsp;族</td>
							<td class="width-80 height-40 ">
								<tags:rmbSelect property="a0117" cls="height-40 input-text2" label="民族"
textareaStyle="width:80px;line-height:40px !important;" codetype="GB3304" defaultValue="<%=SV(a01.getA0117()) %>"/>
							</td>

							<td class="width-60 height-40 fontConfig label_color"><font color="red">*</font>籍&nbsp;贯</td>
							<td class="width-80 height-40 ">
								<tags:rmbPopWinInput property="a0111" cls="width-80 height-40 no-y-scroll" label="籍贯"
 textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" codetype="ZB01" codename="code_name3"
 defaultValue="<%=SV(a01.getComboxArea_a0111()) %>" hiddenValue="<%=SV(a01.getA0111()) %>"/>
							</td>
							<td class="width-60 height-40 fontConfig label_color"><font color="red">*</font>出生地</td>
							<td class="width-80 height-40 ">
								<tags:rmbPopWinInput property="a0114" cls="width-80 height-40 no-y-scroll" label="出生地" onblur="restoreDefault()"
 textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" codetype="ZB01" codename="code_name3"
 defaultValue="<%=SV(a01.getComboxArea_a0114()) %>" hiddenValue="<%=SV(a01.getA0114()) %>"/>
							</td>
						</tr>
						<tr>
							<td class="label-clor width-60 height-40 fontConfig label_color">入&nbsp;党时&nbsp;间</td>
							<td class="label-clor width-80 height-40 " onkeypress="a0140Click2()">
								<tags:rmbNormalInput offsetTop="1" property="a0140" ondblclick="a0140Click()" cls="width-80 height-40 no-y-scroll" label="入党时间" onblur="restoreDefault()"  readonly="true"
 textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" divStyle="width:80px;text-align:center;" defaultValue="<%=SV(a01.getA0140()) %>"/>
							</td>
							<td class="label-clor width-60 height-40 fontConfig label_color"><font color="red">*</font>参加工<br/>&nbsp;作时间</td>
							<td class="label-clor width-80 height-40 ">
								<tags:rmbDateInput property="a0134" offsetTop="1" cls="width-80 height-40 no-y-scroll" label="参加工作时间" onblur="restoreDefault()"
 textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" defaultValue="<%=SV(a01.getA0134()) %>"/>
							</td>
							<td class="label-clor width-60 height-40 fontConfig label_color"><font color="red">*</font>健&nbsp;康<br/>&nbsp;状&nbsp;况</td>
							<td class="label-clor width-80 height-40 ">
								<tags:rmbSelect property="a0128" cls="height-40 input-text2" label="健康情况" selectDivStyle="width:560px;"
textareaStyle="width:80px;line-height:40px !important;" codetype="GB2261D" defaultValue="<%=SV(a01.getA0128()) %>"/>
							</td>
						</tr>
						<tr>
							<td class="label-clor width-60 height-40 fontConfig label_color">专业技<br/>术职务</td>
							<td class="label-clor height-40" colspan="2">
								<tags:rmbNormalInput offsetTop="1" property="a0196" cls="width-140 height-40 no-y-scroll" label="专业技术职务"
 textareaStyle="display:none;text-align:center;" ondblclick="a0196Click()"
textareaCls="cellbgclor x-form-field" defaultValue="<%=SV(a01.getA0196()) %>"/>
							</td>
							<td class="label-clor  height-40 fontConfig label_color">熟悉专业<br/>有何特长</td>
							<td class="label-clor height-40" colspan="2">
								<tags:rmbNormalInput offsetTop="1" property="a0187a" cls="width-140 height-40 no-y-scroll" label="熟悉专业有何特长" onblur="restoreDefault()"
 textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" defaultValue="<%=SV(a01.getA0187a()) %>"/>
							</td>
						</tr>
						<tr>
							<td class=" fontConfig label_color" rowspan="4">学&nbsp;历<br/><br/>学&nbsp;位</td>
							<td class=" fontConfig label_color" rowspan="2">全日制<br/>教&nbsp;&nbsp;育</td>
							<td class="label-clor height-30" colspan="2">
								<input id="qrzxl" name="qrzxl" class="height-30 input-text2" label="全日制教育：学历"
									   readonly="readonly" value="<%=SV(a01.getQrzxl()) %>" ondblclick="xlxwClick()"
									   style="width:140px;">

							</td>
							<td class=" fontConfig label_color" rowspan="2">毕业院校系及专业</td>
							<td id="qrzxlxxTD" <% if ("".equals(SV(a01.getQrzxlxx())) ||"".equals(SV(a01.getQrzxwxx())) || SV(a01.getQrzxlxx()).equals(SV(a01.getQrzxwxx()))) {
								out.println(" rowspan=2 ");
							} %> class="label-clor height-30" colspan="2">
								<input id="qrzxlxx" type="hidden" name="qrzxlxx" class="height-30 input-text2"
									   label="院校系及专业(学历)"
									   required="false" readonly="readonly" value="<%=SV(a01.getQrzxlxx()) %>"
									   ondblclick="xlxwClick()" style="width:200px;text-align:left;">
								<p id="qrzxlxx_p" name="qrzxlxx_p" title="<%=SV(a01.getQrzxlxx()==null?a01.getQrzxwxx():a01.getQrzxlxx()) %>"
								   class=" input-text2" ondblclick="xlxwClick()"
								   style="width:200px;height:25px;text-align:left;overflow: hidden;"><%=SV(a01.getQrzxlxx()==null?a01.getQrzxwxx():a01.getQrzxlxx()) %>
								</p>
							</td>
						</tr>
						<tr>
							<td class="label-clor height-30" colspan="2">
								<input id="qrzxw" name="qrzxw" class="height-30 input-text2" label="全日制教育：学位"
									   required="false" readonly="readonly" value="<%=SV(a01.getQrzxw()) %>"
									   ondblclick="xlxwClick()" style="width:140px;">
							</td>
							<td id="qrzxwxxTD" <% if ("".equals(SV(a01.getQrzxlxx())) ||"".equals(SV(a01.getQrzxwxx())) || SV(a01.getQrzxlxx()).equals(SV(a01.getQrzxwxx()))) {
								out.println(" style='display:none' ");
							} %> class="label-clor height-30" colspan="2">
								<input id="qrzxwxx" type="hidden" name="qrzxwxx" class="height-30 input-text2"
									   label="院校系及专业(学位)"
									   required="false" readonly="readonly" value="<%=SV(a01.getQrzxwxx()) %>"
									   ondblclick="xlxwClick()" style="width:200px;text-align:left;">
								<p id="qrzxwxx_p" name="qrzxwxx_p" 
								   class="height-30 input-text2" ondblclick="xlxwClick()" title="<%=SV(a01.getQrzxwxx()) %>"
								   style="width:200px;text-align:left;"><%=SV(a01.getQrzxwxx()) %>
								</p>
							</td>
						</tr>
						<tr>
							<td class=" fontConfig label_color" rowspan="2">在&nbsp;&nbsp;职<br/>教&nbsp;&nbsp;育</td>
							<td class="label-clor height-30" colspan="2">
								<input id="zzxl" name="zzxl" class="height-30 input-text2" label="在职教育：学历"
									   required="false" readonly="readonly" value="<%=SV(a01.getZzxl()) %>"
									   ondblclick="xlxwClick()" style="width:140px;">
							</td>
							<td class="width-60 fontConfig label_color" rowspan="2">毕业院校系及专业</td>
							<td id="zzxlxxTD" <% if ("".equals(SV(a01.getZzxlxx())) ||"".equals(SV(a01.getZzxwxx())) || SV(a01.getZzxlxx()).equals(SV(a01.getZzxwxx()))) {
								out.println(" rowspan=2 ");
							} %> class="label-clor height-30" colspan="2">
								<input id="zzxlxx" type="hidden" name="zzxlxx" class="height-30 input-text2"
									   label="院校系及专业(学历)"
									   required="false" readonly="readonly" value="<%=SV(a01.getZzxlxx()) %>"
									   ondblclick="xlxwClick()" style="width:200px;text-align:left;">
								<p id="zzxlxx_p" name="zzxlxx_p" title="<%=SV(a01.getZzxlxx()==null?a01.getZzxwxx():a01.getZzxlxx()) %>" class=" input-text2"
								   ondblclick="xlxwClick()" 
								   style="width:200px;height: 25px ;text-align:left;  overflow: hidden;"><%=SV(a01.getZzxlxx()==null?a01.getZzxwxx():a01.getZzxlxx()) %>
								</p>
							</td>

						</tr>
						<tr>
							<td class="label-clor height-30" colspan="2">
								<input id="zzxw" name="zzxw" class="height-30 input-text2" label="在职教育：学位"
									   required="false" label="在职教育：学历" readonly="readonly"
									   value="<%=SV(a01.getZzxw()) %>" ondblclick="xlxwClick()"
									   style="width:140px;height: 25px ;">
							</td>
							<td id="zzxwxxTD" <% if ("".equals(SV(a01.getZzxlxx())) ||"".equals(SV(a01.getZzxwxx())) || SV(a01.getZzxlxx()).equals(SV(a01.getZzxwxx()))) {
								out.println(" style='display:none' ");
							} %> class="label-clor height-30" colspan="2">
								<input id="zzxwxx" type="hidden" name="zzxwxx" class="height-30 input-text2"
									   label="院校系及专业(学位)"
									   required="false" readonly="readonly" value="<%=SV(a01.getZzxwxx()) %>"
									   ondblclick="xlxwClick()" style="width:200px;text-align:left;">
								<p id="zzxwxx_p" name="zzxwxx_p" class=" input-text2" ondblclick="xlxwClick()" title="<%=SV(a01.getZzxwxx()) %>"
								   style="width:200px;height: 25px ;text-align:left;    overflow: hidden;"><%=SV(a01.getZzxwxx()) %>
								</p>
							</td>
						</tr>
						<tr>
							<td class="height-30 fontConfig label_color" colspan="2"><font color="red">*</font>工作单位及职务
							</td>
							<td class="height-30" colspan="5" id="a0192aTD">
								<input id="a0192a" type="hidden" name="a0192a" class="height-30 input-text2"
									   label="工作单位及职务全称"
									   required="false" readonly="readonly" ondblclick="a0192aClick()"
									   value="<%=SV(a01.getA0192a()) %>" style="width:405px;text-align:left;">
								<p id="a0192a_p" name="a0192a_p" title="<%=SV(a01.getA0192a()) %>"
								   class="height-30 input-text2"
								   style="width:405px;text-align:left;height: 27px;    overflow: hidden;"
								   ondblclick="a0192aClick()"><%=SV(a01.getA0192a()) %>
								</p>
							</td>
						</tr>
<%-- 						<tr>
							<td class="height-30 fontConfig label_color" colspan="2">社团兼职
							</td>
							<td class="height-30" colspan="5" id="a0192aTD">
								<input id="Association" type="hidden" name="Association" class="height-30 input-text2"
									   label="社团兼职全称"
									   required="false" readonly="readonly" ondblclick="AssociationClick()"
									   value="<%=SV(a01.getSTJZ()) %>" style="width:405px;text-align:left;">
								<p id="Association_p" name="Association_p" title="<%=SV(a01.getSTJZ()) %>"
								   class="height-30 input-text2"
								   style="width:405px;text-align:left;height: 27px;    overflow: hidden;"
								   ondblclick="AssociationClick()"><%=SV(a01.getSTJZ()) %>
								</p>
							</td>
						</tr> --%>
						

						<tr>
							<td class="label_color width-60 height-330">
								<div style="width: 100%;height: 100%;position: relative;">
									<div id="create" onclick="showwin();" title="简历生成"
										 style="width:100%;height:20%;background:url(images/jl.png) no-repeat center 10px;cursor:pointer;"></div>
									<!-- <div id="create2" onclick="showwin2();" title="简历生成" style="width:100%;height:20%;background:url(images/jl.png) no-repeat center 10px;cursor:pointer;"></div> -->
									<span style="" class="fontConfig"><font color="red">*</font><br>简<br>历</span>

									<div id="formatting" onclick="a1701Format();" title="简历格式化" style="width:100%;height:20%;background:url(images/cv.png) no-repeat center 10px;cursor:pointer;"></div>
								</div>
							</td>
							<td class="height-330" colspan="6">
								<div id="resume" class="height-330" style="width:100%; overflow-y: hidden;overflow-x: hidden;">
									<script id="editor" type="text/plain"  style="width:100%;  height: auto;"></script>
								</div>
							</td>
						</tr>
					</tbody>
					
				</table>
			</div>
			
			<div class="top_div" >
				<div style="width:100%;height:100%;">

 					<div id="tabs2tab" class="top_tab_style active" style="width:100px;" onclick="tabSwitch('tabs','page',1)">任免审批表(二)</div>
				</div>
			</div>
			<div class="resume_div" id="page2"  >
				<table class="person_resume"  cellpadding="0px;" style="position: relative;">
					<tbody  style="display:block;">
						<tr>
							<td class="width-60 height-76 fontConfig label_color"><div style="margin:0 auto;width:15px">奖惩综述</div></td>
							<td class="height-76" colspan="7">
								<textarea id="a14z101" name="a14z101" style="" rows="3" cols="6" class="textareaMargin height-76 maxWidth-485 font-left" label="奖惩综述"
readonly="readonly" ondblclick="$h.openPageModeWin('rewardPunish','pages.publicServantManage.RewardPunishAddPage','奖惩情况',810,520,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(a01.getA14z101()) %></textarea>
							</td>
						</tr>
						<tr>
							<td class="width-60 height-76 fontConfig label_color"><div style="margin:0 auto;width:30px">年度考核结果综述</div></td>
							<td class="height-76" colspan="7">
								<textarea id="a15z101" name="a15z101" rows="3" cols="6" class="height-76 maxWidth-485 font-left" label="年度考核结果综述"
readonly="readonly" ondblclick="$h.openPageModeWin('assessmentInfo','pages.publicServantManage.AssessmentInfoAddPage','年度考核情况',800,330,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(a01.getA15z101()) %></textarea>
							</td>
						</tr>
<%-- 						<tr>
							<td class="width-60 height-76 fontConfig label_color"><div style="margin:0 auto;width:30px">代表委员综述</div></td>
							<td class="height-76" colspan="7">
								<textarea id="Dbwy_p" name="dbwy_p" rows="3" cols="6" class="height-76 maxWidth-485 font-left" label="年度考核结果综述"
readonly="readonly" ondblclick="$h.openPageModeWin('DbwyAddPage','pages.publicServantManage.DbwyAddPage','代表委员',800,440,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(a01.getDbwy()) %></textarea>
							</td>
						</tr>  --%>
						<tr>
							<td class="width-60 fontConfig label_color" rowspan="11">
								<div class="height-340" style="width:100%;position:relative;">
									<div style="height:252px;padding-top:10px;">
										<span style="position:relative;vertical-align:middle;" class="fontConfig">家<br/>庭<br/>主<br/>要<br/>成<br/>员<br/>及<br/>社<br/>会<br/>重<br/>要<br/>关<br/>系</span>
									</div>

									<div id="upb" style="margin-top:3px;margin-left:3px;position:relative;z-index:2;width:53px;height:20px;border-radius:5px;-moz-border-radius:5px;border:1px solid #7b9ebd;background:url(images/up.png) transparent no-repeat 3px center;cursor:pointer;" onclick="up(-1)">
										<span style="line-height:20px;padding-left:18px;font-size:13px;">上移</span>
									</div>
									<div id="downb" style="margin-top:5px;margin-left:3px;margin-bottom:10px;position:relative;z-index:2;width:53px;height:20px;border-radius:5px;-moz-border-radius:5px;border:1px solid #7b9ebd;background:url(images/down.png) transparent no-repeat 3px center;cursor:pointer;" onclick="up(1)">
										<span style="line-height:20px;padding-left:18px;font-size:13px;">下移</span>
									</div>
									<div id="addrowBtn"
										 style="margin-top:10px;position:relative;margin-left:3px;width:53px;border:1px solid #7b9ebd;background:url(images/delete.png) transparent no-repeat 1px center;border-radius:5px;-moz-border-radius:5px;cursor:pointer;"
										 onclick="addA36row()">
										<span style="line-height:20px;padding-left:18px;font-size:13px;">删除</span>
									</div>
								</div>
							</td>
							
							</style>
							<td class="font_12 width-11 height-30-1 label_color fontConfig">称谓</td>
							<td style="width:80px" class="font_12 width-80 height-30-1 label_color fontConfig">姓名</td>
							<!-- <td class="font_12 height-30-1 label_color fontConfig">身份证号</td> -->
							<td class="font_12 width-80 height-30-1 label_color fontConfig">出生日期</td>
							<td class="font_12  width-80 height-30-1 label_color fontConfig">政治面貌</td>
							<td class="font_12 width-95 height-30-1 label_color fontConfig">工作单位及职务</td>
							<!-- <td class="font_12 width-15 height-30-1 label_color fontConfig">重要标识 -->
								<script>
									//定位这里输出

									Ext.onReady(function () {
										//tabSwitch('tabs', 'page', 2);
										//对信息集明细的权限控制，是否可以维护
										$h.fieldsDisabled(fieldsDisabled);
										//对信息集明细的权限控制，是否可以查看
										//var imgdata = "<img height='100%' width='100%' src='<%=request.getContextPath()%>/image/quanxian1.png' />";
									var imgdata = "url(<%=request.getContextPath()%>/image/suo.jpg)";
									$h.selectDisabled(selectDisabled_in,imgdata);
								});
							</script>
							</td>
						</tr>


					  <%
						int numFor=1;
						int fixedNum=0;
						String content1="丈夫,妻子";
						String content2="儿子,女儿,长子,次子,三子,四子,五子,养子,继子,继女,长女,次女,三女,四女,五女,养女,其他女儿";
						String content3="父亲,母亲,继父,继母";
						String content4="公公,婆婆,岳父,岳母";
						  String content5 = "表弟,表姐,表妹,表兄,伯父,伯母,弟弟,弟媳,儿媳,哥哥,姑父,姑母,姐夫,姐姐,舅父,舅母,妹夫,妹妹,女婿,嫂子,婶母,叔父,孙女,孙子";
						  String content6 = "堂弟,堂姐,堂妹,堂兄,外甥,外甥女,外孙女,外孙子,外祖父,外祖母,养父,养母,姨夫,姨母,曾祖父,曾祖母,侄女,侄子,祖父,祖母,其他亲属";

						  for (Integer i = 1; i <= lista36Length; i++) {
							  if (numFor > 10) {
								  break;
							  }
							  A36 a36 = (A36) lista36.get(i - 1);
							  int ichar = numFor + 97;
							  String tr_i = "tr_" + numFor;
							  String a3604a_i = "a3604a_" + (char) ichar;
							  String a3601_i = "a3601_" + (char) ichar;
							  String a3607_iF = "a3607_" + (char) ichar + "F";
							  String a3607_i = "a3607_" + (char) ichar;
							  String a3627_i = "a3627_" + (char) ichar;
							  String a3611_i = "a3611_" + (char) ichar;
							  String a3600_i = "a3600_" + (char) ichar;
							  String a3684_i = "a3684_" + (char) ichar;
							  String mark_i = "mark_" + (char) ichar;
					  %>
						<tr id="<%=tr_i %>" onclick="getNum(<%=numFor %>)">
							<td class="width-80 height-30-1 ">
								<tags:rmbSelect property="<%=a3604a_i %>" codetype="GB4761"
												cls="height-30-1 input-text2 ischange" label="称谓" outSelect="true"
												selectDivStyle="width:560px;"
												textareaStyle="width:60px;line-height:36px !important;"
												defaultValue="<%=SV(a36.getA3604a()) %>"/>
							</td>
							 <%-- <td class="width-80 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3601_i %>"
													 cls="width-80 height-30-1  ischange"
													 textareaStyle="display:none;text-align:center;width:40px;line-height:36px"
													 textareaCls="cellbgclor x-form-field" 
													 onkeypress="namevalidator"
													 defaultValue="<%=SV(a36.getA3601()) %>"/>
							</td> --%>
							<td class="font_12 width-80 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3601_i %>"
													 cls="width-80 height-30-1  no-y-scroll"
													 textareaStyle="display:none;text-align:center;" 
													 textareaCls="cellbgclor x-form-field" 
													 defaultValue="<%=SV(a36.getA3601()) %>"/>
							</td>
							<%-- <td class="font_12 width-sfz height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3684_i %>"
													 cls="width-sfz height-30-1  no-y-scroll"
													 textareaStyle="display:none;text-align:center;" 
													 textareaCls="cellbgclor x-form-field" 
													 defaultValue="<%=SV(a36.getA0184gz()) %>"/>
							</td> --%>
							<td class="font_12 width-80 height-30-1">
								<tags:rmbDateInput offsetTop="5" property="<%=a3607_i %>"
													 cls="width-80 height-30-1  no-y-scroll ischange"  label="家庭成员：出生年月"
													 textareaStyle="width:60px;display:none;text-align:center;" 
													 textareaCls="cellbgclor x-form-field" 
													 defaultValue="<%=SV(a36.getA3607()) %>"/>
							</td>
							<!-- <td class="width-80 height-30-1">
								<tags:rmbDateInput property="<%=a3607_i %>" offsetTop="5"
												   cls="width-80 height-30-1 no-y-scroll ischange" label="家庭成员：出生年月"
												   textareaStyle="display:none;text-align:center;"
												   textareaCls="cellbgclor x-form-field"
												   defaultValue="<%=SV(a36.getA3607()) %>" />
							</td>-->
							<td class="font_12 width-80 height-30-1">
								<tags:rmbSelect property="<%=a3627_i %>" codetype="GB9999" cls="height-30-1 input-text2"
												outSelect="true"
												selectDivStyle="width:500px;"
												textareaStyle="width:80px;line-height:36px !important;"
												defaultValue="<%=SV(a36.getA3627()) %>"/>
							</td>
							<td class="font_12 width-95 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3611_i %>"
													 cls="width-95 height-30-1  no-y-scroll" 
													 textareaStyle="display:none;text-align:center;"
													 textareaCls="cellbgclor x-form-field"
													 defaultValue="<%=SV(a36.getA3611()) %>" divStyle="width:156px;"/>
								<odin:hidden property="<%=a3600_i %>" value="<%=SV(a36.getA3600()) %>"/>
							</td>
							<%-- <td   class="height-30-1">
							<input type="checkbox" name="<%=mark_i %>"  id="<%=mark_i %>"  
							 <% if("1".equals(SV(a36.getMark()))){%> checked="checked"
							<% }%>
							  value="<%=SV(a36.getMark()) %>"  />
							</td> --%>
						</tr>
								<%
								numFor ++;

						}
						%>
						<%
						fixedNum=numFor;
						for(Integer n=1;n<=10;n++){
							if(numFor > 10){
								break;
							}
							A36 a36 = new A36();
							if( n <= lista36Length){
								a36=(A36)lista36.get(n-1);
							}

						String allContent=content1+content2+content3+content4+content5+content6;
						//String allContent=content1;
						if(!allContent.contains((a36.getA3604a()==null?"":a36.getA3604a())) || n>lista36Length){
							int ichar = numFor+97;
							String tr_i = "tr_"+numFor;
							String a3604a_i = "a3604a_"+(char)ichar;
							String a3601_i = "a3601_"+(char)ichar;
							String a3607_iF = "a3607_"+(char)ichar+"F";
							String a3607_i = "a3607_"+(char)ichar;
							String a3627_i = "a3627_"+(char)ichar;
							String a3611_i = "a3611_"+(char)ichar;
							String a3600_i = "a3600_"+(char)ichar;
							String a3684_i = "a3684_"+(char)ichar;
							String mark_i = "mark_"+(char)ichar;
							%>
						<tr id="<%=tr_i %>" onclick="getNum(<%=numFor %>)">
							<td style="font-size:12px;" class="height-30-1">
								<tags:rmbSelect property="<%=a3604a_i %>" codetype="GB4761" cls="height-30-1 input-text2" label="称谓" outSelect="true"
	selectDivStyle="width:560px;" textareaStyle="width:40px;line-height:36px !important;" defaultValue="<%=SV(a36.getA3604a()) %>"/>
							</td>
							<!-- <td style="width:8%;font-size:12px;" class="width-50 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3601_i %>"  cls="width-50 height-30-1  no-y-scroll"
	textareaStyle="display:none;text-align:center;"  textareaCls="cellbgclor x-form-field" 	onkeypress="namevalidator"
	defaultValue="<%=SV(a36.getA3601()) %>"/>
							</td> -->
							<td  style="width:15%;font-size:12px;" class="width-80 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3601_i %>"  cls="width-80 height-30-1  no-y-scroll"
	textareaStyle="display:none;text-align:center;"  textareaCls="cellbgclor x-form-field"  defaultValue="<%=SV(a36.getA3601()) %>"/>
							</td>
							<%-- <td  style="width:18%;font-size:12px;" class="width-sfz height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3684_i %>"  cls="width-sfz height-30-1  no-y-scroll"
	textareaStyle="display:none;text-align:center;"  textareaCls="cellbgclor x-form-field"  defaultValue="<%=SV(a36.getA3684()) %>"/>
							</td> --%>
							<td  style="width:15%;font-size:12px;" class="width-70 height-30-1">
								<tags:rmbDateInput offsetTop="5" property="<%=a3607_i %>"  cls="width-80 height-30-1  no-y-scroll" label="家庭成员：出生年月"
	textareaStyle="width:60px;display:none;text-align:center;"  textareaCls="cellbgclor x-form-field"  defaultValue="<%=SV(a36.getA3607()) %>"/>
							</td>
							<!-- <td  style="width:10%;font-size:12px;" class="width-50 height-30-1" >
								<tags:rmbDateInput property="<%=a3607_i %>" offsetTop="5" cls="width-50 height-30-1 no-y-scroll" label="家庭成员：出生年月"
	textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" defaultValue="<%=SV(a36.getA3607()) %>" />
							</td>-->
							<td  style="width:15%;font-size:12px;" class="height-30-1">
								<tags:rmbSelect property="<%=a3627_i %>" codetype="GB9999" cls="width-60 height-30-1 input-text2" outSelect="true"
	selectDivStyle="width:500px;" textareaStyle="width:60px;line-height:36px !important;" defaultValue="<%=SV(a36.getA3627()) %>"/>
							</td>
							<td style="font-size:12px;" class="width-90 height-30-1">
								<tags:rmbNormalInput offsetTop="0" property="<%=a3611_i %>"  cls="width-90 height-30-1  no-y-scroll"  
	textareaStyle="display:none;text-align:center;" textareaCls="cellbgclor x-form-field" defaultValue="<%=SV(a36.getA3611()) %>" divStyle="width:156px;"	/>
								<odin:hidden property="<%=a3600_i %>" value="<%=SV(a36.getA3600()) %>"/>
							</td>
							<%-- <td   class="height-30-1">
							<input type="checkbox" name="<%=mark_i %>" id="<%=mark_i %>" value="<%=SV(a36.getMark()) %>"  />
							</td> --%>
						</tr>
						 		<%
								numFor++;
							}
						}
						%>
					</tbody>
					
				</table>
			
			</div>
			
			<script>

			
			$("#page2 input[type='checkbox']").click(function () {
			    if(this.checked){
			        $(this).attr('value','1')
			    }else {
			    	$(this).attr('value','0')
			    }
			});
			</script>
			<script>
				Ext.onReady(function(){
					//tabSwitch('tabs','page',1);
					//对信息集明细的权限控制，是否可以维护
					$h.fieldsDisabled(fieldsDisabled);
					//对信息集明细的权限控制，是否可以查看
					var imgdata = "url(<%=request.getContextPath()%>/image/suo.jpg)";
					$h.selectDisabled(selectDisabled,imgdata);
				});
			</script>
			
			
			<div class="top_div" style="display: none;">
				<div style="width:100%;height:100%;">

 					<div id="tabs3tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">标签信息</div>
				</div>
			</div>
			<div class="resume_div" id="page3" style="display:none;">
				<table class="remark tdtextclass" cellpadding="0" style="position: relative;">
					<!-- 历任重要职务重要经历  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">
							<div class="width-65 height-69 fontConfig label_color middle-css">历任重<br/>要职务<br/>重要经<br/>历标志</div>
						</td>
						<td class="height-70" colspan="6">
							<textarea id="a0193z" name="a0193z" rows="8" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('A0193ZTags','pages.zj.tags.A0193TagsAddPage','历任重要职务重要经历标志',780,580,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getA0193z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">熟&nbsp;悉<br/>领&nbsp;域</td>
						<td class="height-70" colspan="6">
							<textarea id="a0194z" name="a0194z" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('A0194ZTags','pages.zj.tags.A0194TagsAddPage','熟悉领域',780,550,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getA0194z()) %></textarea>
						</td>
					</tr>
					
					<!-- 是否获得省部级以上奖励  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">是否获得<br/>省部级以<br/>上奖励</td>
						<td class="height-70" colspan="6">
							<textarea id="tagsbjysjlzs" name="tagsbjysjlzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagSbjysjlAddPage','pages.zj.tags.TagSbjysjlAddPage','省部级以上奖励',780,360,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagsbjysjlzs()) %></textarea>
						</td>
					</tr>
					<!-- 人才类型  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">人才类型</td>
						<td class="height-70" colspan="6">
							<textarea id="tagrclxzs" name="tagrclxzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagRclxAddPage','pages.zj.tags.TagRclxAddPage','人才类型',800,330,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagrclxzs()) %></textarea>
						</td>
					</tr>
					<!-- 惩戒类型  -->
					<tr>
						<td class="width-65 height-70 fontConfig label_color">惩戒类型</td>
						<td class="height-70" colspan="6">
							<textarea id="tagcjlxzs" name="tagcjlxzs" rows="3" cols="6" class="height-70 maxWidth-500 font-left" readonly="readonly"
								ondblclick="$h.openPageModeWin('TagCjlxAddPage','pages.zj.tags.TagCjlxAddPage','惩戒类型',800,330,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false})" ><%=SV(extraTags.getTagcjlxzs()) %></textarea>
						</td>
					</tr>
					<!-- 干部来源 -->
					 <tr style="height:50px;">
					 		<td  class=" height-80 fontConfig label_color">干&nbsp;部<br/>来&nbsp;源</td>
							<odin:select2 property="a0194c" value="<%=SV(extraTags.getA0194c()) %>" size="20" colspan="2"  style= "height:50px"
							data="['1','本单位产生'],['2','市直机关交流'],['3','区县市交流'],['4','副师职军转'],['5','其他']"></odin:select2>
					</tr> 
				</table>
			</div>
			<div class="top_div" >
				<div style="width:100%;height:100%;">

 					<div id="tabs4tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">其他信息</div>
				</div>
			</div>
			<div class="resume_div" id="page4" style="display:block;">
				<table class="remark tdtextclass" cellpadding="0px;" style="position: relative;">

						<!-- 页面修改 -->
						<tr>
							<td class="width-60 fontConfig label_color" style="height:300px;">其<br/>它<br/>信<br/>息</td>
							<td style="height:320px;width:490px;">

								<div style="height:100%;width:100%;">


										<table align="center" bgcolor="white" width="100%" height="100%" cellspacing="0px;" style='table-layout: fixed;'>

												<%-- <tr style="height:50px">

													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%;border-left:0px;border-top:0px">

															<div style="width:100%;height:50px;line-height:50px;">
																	<div style="height:100%;float:left;width:70px;text-align:left;"><label style="font-size: 13px;">是否考录</label></div>

																	<input type="checkbox" name="a99z101" id="a99z101" onclick="disableInput(this,'a99z102')" style="float:left;width:13px;margin-top:16px;margin-left:5px;" >
																</div>
													</td>
													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%;border-top:0px">
															<div style="width:100%;height:50px;line-height:50px;">
															<div style="float:left;width:70px;text-align:left;"><span id="a99z102SpanId_s" style="font-size: 13px;">录用时间</span></div>
															<tags:rmbDateInput2  property="a99z102"  label="任现职务层次时间" defaultValue="<%=SV(a99Z1.getA99z102()) %>"
					 textareaStyle="width:150px;height:21px;float:left;margin-top:15px;margin-left:5px;" warnCls="float:left;margin-left:3px;" textareaCls="cright_input_btn linehack"/>
													</div>
													</td>
												</tr> --%>

												<%-- <tr style="height:50px;">

													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%;border-left:0px">
														<div style="width:100%;height:50px;line-height:50px;">
															<div style="float:left;width:70px;text-align:left;"><label style="font-size: 13px;">是否选调生</label></div>
															<input type="checkbox" name="a99z103" id="a99z103" onclick="disableInput(this,'a99z104')" style="float:left;width:13px;margin-top:16px;margin-left:5px;" >
													    </div>
													</td>
													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%">
															<div style="width:100%;height:50px;line-height:50px;">
																	<div style="float:left;width:60px;text-align:left;"><span id="a99z104SpanId_s" style="font-size: 13px;line-height:25px;text-align:left;">进入选调生&nbsp;&nbsp;时&nbsp;间</span></div>
																	<tags:rmbDateInput2  property="a99z104"  label="进入选调生时间" defaultValue="<%=SV(a99Z1.getA99z104()) %>"
							 textareaStyle="width:150px;height:21px;float:left;margin-top:14px;margin-left:15px;" warnCls="float:left;margin-left:3px;" textareaCls="cright_input_btn linehack"/>
																</div>
													</td>
												</tr>

												<tr style="height:50px;">

													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%; border-left:0px">
															<div style="width:100%;height:50px;line-height:50px;">
																	<div style="height:100%;float:left;width:50px;text-align:left;"><label style="font-size: 13px;">成长地</label></div>
																	<tags:rmbPopWinInput2 property="a0115a"  label="成长地"
							 textareaStyle="width:134px;float:left;margin-top:14px;margin-left:5px;height:21px;" textareaCls="right_input_btn linehack" codetype="ZB01" divStyle="margin-top:14px;"
							  hiddenValue="<%=SV(a01.getA0115a()) %>"/>
																</div>
													</td>
													<td bgcolor="white"  align="center" style="padding-left:3%;width:47%;">
															<div style="width:100%;height:50px;line-height:50px;">
																	<div style="height:100%;float:left;width:70px;text-align:left;"><span style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;别</span></div>
																	<tags:rmbPopWinInput2 property="a0120"  label="级别"
							 textareaStyle="width:134px;float:left;margin-top:14px;margin-left:5px;height:21px;" textareaCls="right_input_btn linehack" codetype="ZB134" divStyle="margin-top:14px;"
							  hiddenValue="<%=SV(a01.getA0120()) %>"/>
																										</div>

													</td>
												</tr>

												<tr style="height:50px;">

													<td bgcolor="white"  align="left" colspan="2" style='padding-left:3%;width:47%;border-left:0px;'>
															<div style="width:100%;height:50px;line-height:50px;">
																	<div style="height:100%;float:left;width:160px;text-align:left;"><span style="font-size: 13px;">专业技术类公务员任职资格</span></div>
																	<tags:rmbPopWinInput2 property="a0122"  label="专业技术类公务员任职资格"
																	 textareaStyle="width:134px;float:left;margin-top:14px;margin-left:5px;height:21px;" textareaCls="right_input_btn linehack" codetype="ZB139" divStyle="margin-top:14px;"
																	  hiddenValue="<%=SV(a01.getA0122()) %>"/>
																</div>
													</td>

												</tr> --%>
												<%-- <tr style="height:50px;">

 													<td bgcolor="white"  align="left" colspan="2" style='padding-left:3%;width:47%;border-left:0px;border-bottom: 1px solid #74A6CC'>
															<div style="width:100%;height:50px;line-height:50px;">
															<div style="float:left;width:80px;text-align:left;"><label style="font-size: 13px;">是否年轻干部</label></div>
															<input type="checkbox" name="fkbs" id="fkbs"  style="float:left;width:13px;margin-top:16px;margin-left:5px;" >
													    </div>
													</td> 
													<td>
														<table >
														  <tr style="height:50px;">
															<odin:select property="fkbs" data="['06','优秀年轻干部（省）'],['16','优秀年轻干部（报省组）'],['17','优秀年轻干部（其他）']" label="年轻干部" value="<%=SV(a01.getFkbs()) %>" multiSelect="true"></odin:select>
														  </tr>
														</table>
													</td>

												</tr> --%>

												<tr style="height:50px;">
												<td>
													<table id="a99z191" align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select property="a99z191" codeType="XZ91" width="140" label="保留待遇" defaultValue="<%=SV(a99Z1.getA99z191()) %>" colspan="1"  styleClass="a99z191"></odin:select>
													  </tr>
													</table>
												</td>
													<td class="right_td1" align="center" style="padding-left:3%;width:47%;border-top:0px">
														<div style="width:100%;height:50px;line-height:50px;text-align:left;">
														<div style="float:left;width:70px;text-align:left;"><span style="font-size: 13px;">&nbsp;&nbsp;联系方式</span></div>
														<input type="text" name="a99z195" id="a99z195" value="<%=SV(a99Z1.getA99z195()) %>" class="right_input_btn" maxlength="18" style="margin-top:16px;width:120px;" >
														</div>
													</td>

												</tr>
												
												<%-- <tr style="height:50px;">
												<td>
													<table   align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select2 property="a99z1301" codeType="PY02" width="140"  label="培养方向" multiSelect="true"  value="<%=a99Z1.getA99z1301() %>" colspan="1"  styleClass="a99z191"/>
													  </tr>
													</table>
												</td>
												<td>
													<table   align="left" bgcolor="white" width="90" height="100%" cellspacing="0px;">
													  <tr style="height:50px;">
														<odin:select property="a99z1302" codeType="PY01" width="120" label="培养方式" multiSelect="true" value="<%=a99Z1.getA99z1302() %>" colspan="1"  styleClass="a99z191"></odin:select>
													  </tr>
													</table>
													<script type="text/javascript">
														Ext.onReady(function(){
															Ext.getCmp('a99z1301_combo').on('select',function(obj){
																$('#a99z1301').val(obj.getCheckedValue())
															});
															Ext.getCmp('a99z1302_combo').on('select',function(obj){
																$('#a99z1302').val(obj.getCheckedValue())
															});
														});
													
													</script>
												</td>

												</tr> --%>
												<tr>
													<td>
													<table   >
													  <tr id="bzxxx" style="height:30px;">
														<odin:textarea property="a99z1303"   label="培养建议" value="<%=a99Z1.getA99z1303()  %>"     />
													  </tr>
													</table>
												</td>
												</tr>
												<tr>
													<td>
													<table   >
													  <tr id="bzxxx" style="height:30px;">
														<odin:textarea property="a99z1304"   label="主要不足" value="<%=a99Z1.getA99z1304()  %>"     />
													  </tr>
													</table>
												</td>
												</tr>
											</table>
								</div>
							</td>
						</tr>

						<tr>
							<td class="width-60 fontConfig label_color" style="height:99px;">备注</td>
							<td style="height:79px;width:490px;">
								<textarea id="a0180" name="a0180" rows="3" cols="6" label="备注" style="width:100%;height:100%"><%=SV(a01.getA0180()) %></textarea>
							</td>
						</tr>


				</table>
			</div>
			

<!-- 省组标签page6 -->
			<div class="top_div" >
				<div style="width:100%;height:100%;">

 					<div id="tabs6tab" class="top_tab_style active" style="width:70px;" onclick="tabSwitch('tabs','page',1)">经历业绩</div>
				</div>
			</div>
			<div class="resume_div" id="page6" style="display:block;">
				<table class=" tdtextclass" cellpadding="0px;" style="position: relative;">
					<tbody >
					<!-- 历任重要职务重要经历  -->
					<tr>
						<td  class="sz-label height-80 fontConfig label_color">历任(含现任)重要职务重要经历标志</td>
						<td class="height-76" colspan="6">
							<textarea id="sza0193z" name="sza0193z" rows="3" cols="6" class="editorArea font-left "  readonly="readonly" ondblclick="rzzyjlClick();" ><%=SV(szextraTags.getA0193z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域  -->
					<tr>
						<td  class=" height-80 fontConfig label_color">熟&nbsp;悉<br/>领&nbsp;域</td>
						<td class="height-40" colspan="6">
							<textarea id="sza0194z" name="sza0194z" rows="3" cols="6" class="editorArea font-left" readonly="readonly" ondblclick="sxlyClick();" ><%=SV(szextraTags.getA0194z()) %></textarea>
						</td>
					</tr>
					<!-- 熟悉领域 备注 -->
					<tr>
						<td  class=" height-80 fontConfig label_color">熟悉领<br/>域备注</td>
						<td class="height-40"  colspan="6">
							<textarea id="sza0194c" name="sza0194c" rows="3" cols="6" class="editorArea font-left"><%=SV(szextraTags.getA0194c()) %></textarea>
						</td>
					</tr>
					<!-- 是否获得省部级以上奖励  -->
					<tr>
						<td  class=" height-80 fontConfig label_color">是否获得省部级以上奖励</td>
						<td class="height-40" colspan="6">
							<textarea id="sztagsbjysjlzs" name="sztagsbjysjlzs" rows="3" cols="6" class="editorArea font-left" readonly="readonly" ondblclick="sbjysjlClick();" ><%=SV(szextraTags.getTagsbjysjlzs()) %></textarea>
						</td>
					</tr>
					<!-- 人才类型  -->
					<tr>
						<td  class=" height-80 fontConfig label_color">人才类型</td>
						<td class="height-40" colspan="6">
							<textarea id="sztagrclxzs" name="sztagrclxzs" rows="1" cols="6" class="editorArea font-left" readonly="readonly"ondblclick="rclxClick();" ><%=SV(szextraTags.getTagrclxzs()) %></textarea>
						</td>
					</tr>
					<!-- 惩戒类型  -->
					<tr>
						<td  class=" height-80 fontConfig label_color">惩戒类型</td>
						<td class="height-40" colspan="6">
							<textarea id="sztagcjlxzs" name="sztagcjlxzs" rows="1" cols="6" class="editorArea font-left" readonly="readonly"ondblclick="cjlxClick();" ><%=SV(szextraTags.getTagcjlxzs()) %></textarea>
						</td>
					</tr>
					<!-- 其它标签 -->
					<tr>
						<td rowspan="2" class="label_color  height-40 fontConfig  label_color">其它标签</td>
						<td  class="label_color width-80 height-40 fontConfig  label_color">专业背景</td>
						<td class="label-clor width-120 height-40 lebal-td"  colspan="2">
							<tags:rmbPopWinInput property="tagzybj" cls="width-120 height-40 no-y-scroll ischange" label="专业背景"
							  readonly="true" textareaStyle="width:100%; text-align:center;"
							   textareaCls="cellbgclor x-form-field" codetype="TAGZYBJ" codename="code_name" defaultValue="<%=SV(szextraTags.getComboxArea_tagzybj()) %>" hiddenValue="<%=SV(szextraTags.getTagzybj()) %>"/>
						</td>
						<td class="label_color width-80 height-40 fontConfig  label_color" >职称</td>
						<td class="label-clor width-120 height-40 lebal-td" colspan="2" >
							<tags:rmbPopWinInput property="tagzc" cls="width-120 height-40 no-y-scroll ischange" label="职称"  readonly="false" textareaStyle="width:100%;text-align:center;" textareaCls="cellbgclor x-form-field" codetype="TAGZC" codename="code_name" defaultValue="<%=SV(szextraTags.getComboxArea_tagzc()) %>" hiddenValue="<%=SV(szextraTags.getTagzc()) %>"/>
						</td>
					</tr>

					<tr>
						<td class="label-clor  height-40 fontConfig" >归侨侨眷</td>
						<td class="label-clor  height-40"  colspan="2">
							<tags:rmbSelect property="a0195z" cls="height-40 input-text2 no-y-scroll ischange" label="归侨侨眷" selectTDStyle="width:108px;" selectDivStyle="width:300px;" readonly="true" textareaStyle="line-height:40px !important;" codetype="A0251B" defaultValue="<%=SV(szextraTags.getA0195z()) %>"/>
						</td>
						<td class="label-clor  height-40 fontConfig"  >紧缺专业</td>
						<td class="label-clor  height-40"  colspan="2" >
							<tags:rmbSelect property="jqzy" cls="height-40 input-text2 no-y-scroll ischange" label="紧缺专业" selectTDStyle="width:108px;" selectDivStyle="width:300px;" readonly="true" textareaStyle="line-height:40px !important;" codetype="A0251B" defaultValue="<%=SV(szextraTags.getJqzy()) %>"/>
						</td>
					</tr>
					<!-- 考察材料  附件 -->
					<%-- <tr>
						<td  class=" height-54 fontConfig label_color">考察材料</td>
						<td id="tagKcclfj20" class=" height-54" colspan="2" valign="middle" align="center">
							<div class="height-52">
								<div class="height-38 fjfile-style"  id="tagKcclfj20id" style="display: none;">
									<div id="tagKcclfj20_div" class=" height-38 ">
										<p id="tagKcclfj20_filename" class="fjname-style"><%=SV(tagKcclfj20.getFilename()) %></p>
										<p id="tagKcclfj20_filesize">（<%=SV(tagKcclfj20.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td id="tagKcclfj21" class=" height-54" colspan="2"  valign="middle" align="center">
							<div class=" height-52">
								<div class=" height-38 fjfile-style" id="tagKcclfj21id" style="display: none;">
									<div id="tagKcclfj21_div" class=" height-38">
										<p id="tagKcclfj21_filename" class=" fjname-style"><%=SV(tagKcclfj21.getFilename()) %></p>
										<p id="tagKcclfj21_filesize">（<%=SV(tagKcclfj21.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td class="height-54" colspan="2" >
							<div class="fj_btn_style" onclick="kcclfjClick();" >上传附件</div>
						</td>
					</tr>
					<!-- 年度考核登记表  附件 -->
					<tr>
						<td  class=" height-54 fontConfig label_color">年度考核登记表</td>
						<td id="tagNdkhdjbfj0" class=" height-54" colspan="2" valign="middle" align="center">
							<div class="height-52">
								<div class="height-38 fjfile-style"  id="tagNdkhdjbfj0id" style="display: none;">
									<div id="tagNdkhdjbfj0_div" class=" height-38">
										<p id="tagNdkhdjbfj0_filename" class="fjname-style"><%=SV(tagNdkhdjbfj0.getFilename()) %></p>
										<p id="tagNdkhdjbfj0_filesize">（<%=SV(tagNdkhdjbfj0.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td id="tagNdkhdjbfj1" class=" height-54" colspan="2"  valign="middle" align="center">
							<div class=" height-52">
								<div class=" height-38 fjfile-style"  id="tagNdkhdjbfj1id" style="display: none;">
									<div id="tagNdkhdjbfj1_div" class=" height-38">
										<p id="tagNdkhdjbfj1_filename" class="fjname-style"><%=SV(tagNdkhdjbfj1.getFilename()) %></p>
										<p id="tagNdkhdjbfj1_filesize">（<%=SV(tagNdkhdjbfj1.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td class="height-54" colspan="2" >
							<div class="fj_btn_style" onclick="ndkhdjfjClick();" >上传附件</div>
						</td>
					</tr>
					<!-- 档案专审表  附件 -->
					<tr>
						<td class=" height-54 fontConfig label_color">档案专审表</td>
						<td id="tagDazsbfj0" class="height-54" colspan="2" valign="middle" align="center">
							<div class="height-52">
								<div class="height-38 fjfile-style" id="tagDazsbfj0id" style="display: none;">
									<div id="tagDazsbfj0_div" class="height-38">
										<p id="tagDazsbfj0_filename" class="fjname-style"><%=SV(tagDazsbfj0.getFilename()) %></p>
										<p id="tagDazsbfj0_filesize">（<%=SV(tagDazsbfj0.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td id="tagDazsbfj1" class="height-54" colspan="2"valign="middle" align="center">
							<div class="height-52">
								<div class=" height-38 fjfile-style" id="tagDazsbfj1id" style="display: none;">
									<div id="tagDazsbfj1_div" class="height-38">
										<p id="tagDazsbfj1_filename" class="fjname-style"><%=SV(tagDazsbfj1.getFilename()) %></p>
										<p id="tagDazsbfj1_filesize">（<%=SV(tagDazsbfj1.getFilesize()) %>）</p>
									</div>
								</div>
							</div>
						</td>
						<td class="height-54" colspan="2">
							<div class="fj_btn_style" onclick="dazsfjClick();" >上传附件</div>
						</td>
					</tr> --%>
					<tr style="background-color: rgb(250, 252, 255) !important;">
						<td colspan="6"></td>
					</tr>
					</tbody>
				</table>
			</div>

 </div>

		</div>
		<div class="inner_div right_div">
						<div class="top_div pic1" style="background-color: #92B3D4;height: 40px;">
							<span  id="a0163Text"> <script
									type="text/javascript">

function setA0163Text(value){
	var bs = '<%=SV(a01.getFkbs()) %>';
	var v = '';
	if(bs=='1'){
		v = '<年轻干部>';
	}
	if(CodeTypeJson.ZB126[value]){
		document.getElementById("a0163Text").innerHTML=CodeTypeJson.ZB126[value]+v;
	} else {
		if(v!=''){
			document.getElementById("a0163Text").innerHTML=v;
		}
	}
}
<%-- Ext.onReady(function(){
	setA0163Text('<%=SV(a01.getA0163()) %>');
}); --%>

</script></span>
							<tr>
								<div id="personInfo"
									style="width: 248px !important; height: 32px !important; font-size: 11px; font: normal; overflow: hidden; text-align: center; padding-top: 5px; padding-left: 34px; z-index: 8000;"
									align="center" ></div>
							</tr>
						</div>
						<div class="right_table">
				<table style="height:90%;width:100%;padding-top:10px;position: relative;" id="leftTable">

					<tr>
						<td class="right_td1"><font color="red"></font>统计关系所在单位</td>
						<td class="right_td2">
							<tags:rmbPopWinInput2 property="a0195"  label="统计关系所在单位"
 textareaStyle="width:114px;float:left;" textareaCls="right_input_btn" codetype="orgTreeJsonData"
 defaultValue="<%=SV(a0195Text) %>" hiddenValue="<%=SV(a01.getA0195()) %>"/>
						</td>
					</tr>
					<tr>
						<td class="right_td1"><font color="red">*</font>身份证号</td>
						<td class="right_td2" ><input  onblur="validateYearMByIDCard()" type="text"  name="a0184" id="a0184" value="<%=SV(a01.getA0184()) %>" class="right_input_btn" maxlength="18"></td>
					</tr>
					<tr>
						<td class="right_td1"><font color="red">*</font>管理类别</td>
						<td class="right_td2" >
							<table><tr>
							<%
							String ZB130Filter = DBUtils.isNoGbmc(SysManagerUtils.getUserId())?"1=1 and code_status='1'  ":"inino>11 and inino<23 and code_status='1' ";
							%>
							<odin:select2 property="a0165" codeType="ZB130" filter="<%=ZB130Filter %>" width="130" value="<%=SV(a01.getA0165()) %>" multiSelect="true" />
							<tr></table>
							<%-- <tags:rmbSelect property="a0165" cls=" right_option" label="管理类别"
textareaStyle="height:23px;" codetype="ZB130" defaultValue="<%=SV(a01.getA0165()) %>" selectTDStyle="width:130px;" /> --%>
						</td>
					</tr>
					<tr>
						<td class="right_td1"><font color="red">*</font>管理状态</td>
						<td class="right_td2" >
							<tags:rmbPopWinInput2 property="a0163"   label="管理状态"
	 textareaStyle="width:114px;float:left;" textareaCls="right_input_btn" codetype="ZB126"
 	defaultValue="<%=SV(a0163Text) %>" hiddenValue="<%=SV(a01.getA0163()) %>"/>
						</td>
					</tr>
					<tr>
						<td class="right_td1"><font color="red">*</font>人员类别</td>
						 <td class="right_td2">
							<tags:rmbPopWinInput2 property="a0160"  label="人员类别"
 textareaStyle="width:114px;float:left;" textareaCls="right_input_btn" codetype="ZB125"
  hiddenValue="<%=SV(a01.getA0160()) %>"/>
						</td> 

						<%-- <td class="right_td2" >
							<tags:rmbSelect property="a0160" cls=" right_option" label="人员类别"
textareaStyle="height:23px;" codetype="ZB125" defaultValue="<%=SV(a01.getA0160()) %>" selectTDStyle="width:170px;" selectMenuStyle="width:170px;"/>
						</td> --%>
					</tr>
					<tr>
						<td class="right_td1"><font color="red">*</font>编制类型</td>
						<td class="right_td2">
							<tags:rmbSelect property="a0121" cls=" right_option" label="编制类型"
textareaStyle="height:23px;" codetype="ZB135" defaultValue="<%=SV(a01.getA0121()) %>" selectTDStyle="width:130px;" />
						</td>
					</tr>
					<tr>
						<td class="right_td1">任现职时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2 property="a0192f" cls="ischange" label="任相当层次职务职级时间" defaultValue="<%=SV(a01.getA0192f()) %>"   textareaCls="cright_input_btn"/>
						</td>
					</tr>
					<tr>
						<td class="right_td1">现职务层次</td>
						<td class="right_td2">
							<input type="text" class="right_input_btn" id="comboxArea_a0221" ondblclick="a0221Click()" readonly="true" style="width:114px;float:left;">
							<div id = "comboxImg_a0221" class="right_qry_div"  onclick="a0221Click()"></div>
						</td>
					</tr>
					
					<tr>
						<td class="right_td1">任现职务层次时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2  property="a0288"  label="任现职务层次时间" readonly="true" ondblclick="a0221Click()"
defaultValue="<%=SV(a01.getA0288()) %>"
  textareaCls="cright_input_btn"/>

						</td>
					</tr>
					<tr>
						<td class="right_td1">现职级</td>
						<td class="right_td2">
							<input type="text" id="comboxArea_a0192e" class="right_input_btn" ondblclick="a0192eClick()" readonly="true" style="width:114px;float:left;">
							<div id = "comboxImg_a0192e" class="right_qry_div" style="null" onclick="a0192eClick()"></div>
						</td>
					</tr>
					<tr>
						<td class="right_td1">任现职级时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2  property="a0192c"  label="任现职级时间" readonly="true" ondblclick="a0192eClick()"
defaultValue="<%=SV(a01.getA0192c()) %>"
  textareaCls="cright_input_btn"/>
						</td>
					</tr>

					

					<%-- <tr>
						<td class="right_td1">正处时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2  property="zcsj"  label="正处时间"
								defaultValue="<%=SV(a01.getZcsj()) %>"   textareaCls="cright_input_btn"/>
						</td>
					</tr>

					<tr>
						<td class="right_td1">副处时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2  property="fcsj"  label="副处时间"
								defaultValue="<%=SV(a01.getFcsj()) %>"   textareaCls="cright_input_btn"/>
						</td>
					</tr> --%>

					<tr>
						<td class="right_td1"><!-- <font color="red">*</font> -->公务员登记时间</td>
						<td class="right_td2">
							<tags:rmbDateInput2  property="a2949"  label="公务员登记时间" readonly="true" ondblclick="a2949Click()"
								defaultValue="<%=SV(a01.getA2949()) %>"   textareaCls="cright_input_btn"/>
						</td>
					</tr>
				</table>
			</div>

		</div>
	</div>
	<input type="hidden" value="<%=a0000 %>" name="a0000" id="a0000" alt="人员id">
	<input type="hidden" value="<%=checkedgroupid %>" name="checkedgroupid" id="checkedgroupid" alt="人员id">
	<input type="hidden" value="<%=SV(a01.getA0141()) %>" name="a0141" id="a0141" alt="政治面貌">
	<input type="hidden" value="<%=SV(a01.getA3921()) %>" name="a3921" id="a3921" alt="第二党派">
	<input type="hidden" value="<%=SV(a01.getA3927()) %>" name="a3927" id="a3927" alt="第三党派">
	<input type="hidden" value="<%=SV(a01.getA0144()) %>" name="a0144" id="a0144" alt="入党时间">
	<input type="hidden" value="<%=SV(a01.getA0192()) %>" name="a0192" id="a0192" alt="现工作单位及职务简称">
	<%-- <input type="hidden" value="<%=SV(a01.getA0163()) %>" name="a0163" id="a0163" alt="人员管理状态"> --%>
	<!-- 1：有修改权限，2：无修改权限 -->
	<input type="hidden" value="1" name="isUpdate" id="isUpdate" alt="是否有修改权限">
	<input type="hidden" value="<%=SV(a01.getA0148()) %>" name="a0148" id="a0148" alt="职务层级">
	<input type="hidden" value="<%=SV(a01.getA0221()) %>" name="a0221" id="a0221" alt="现职务层次">
	<input type="hidden" value="<%=SV(a01.getA0192e()) %>" name="a0192e" id="a0192e" alt="现职级">
	<input type="hidden" value="<%=SV(a01.getA1701()) %>" name="a1701" id="a1701" alt="简历">
	<input type="hidden" value="<%=SV(a99Z1.getA99Z100()) %>" name="a99Z100" id="a99Z100" alt="id">
	<input type="hidden" id="pdfPath" alt="pdf路径">
	<input type="hidden" id="familyRowNum" alt="家庭成员的行号">
	<input type="hidden" value="<%=SV(extraTags.getA0194zcode()) %>" name="a0194zcode" id="a0194zcode" alt="熟悉领域代码">
	<input type="hidden" value="<%=SV(extraTags.getA0196zcode()) %>" name="a0196zcode" id="a0196zcode" alt="专业类型代码">
	<%-- <input type="hidden" value="<%=SV(extraTags.getA0198zcode()) %>" name="a0198zcode" id="a0198zcode" alt="组织标签代码"> --%>
	<input type="hidden" value="<%=SV(a99Z1.getA99z101()) %>" name="a99z101F" id="a99z101F" alt="是否考录">
	<input type="hidden" value="<%=SV(a99Z1.getA99z103()) %>" name="a99z103F" id="a99z103F" alt="是否选调生">
<%-- 	<input type="hidden" value="<%=SV(a01.getFkbs()) %>" name="fkbs" id="fkbs" alt="分库标识"> --%>
	<input type="hidden" value="<%=SV(a01.getFkly()) %>" name="fkly" id="fkly" alt="分库来源">
</form>

	</div>

<!--以上是任免表  -->

  <!-- <div id="tabs-1" class="GBx-fieldset" align="left">
	<iframe src="" id='EnterAddPage_GB'  style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- <div id="tabs-2" class="GBx-fieldset" align="left">
  	<iframe src="" id='RegisterAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <div id="tabs-3" class="GBx-fieldset" align="left">
  	<iframe src="" id='ExitAddPage_GB' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
  <!-- <div id="tabs-4" class="GBx-fieldset" align="left">
 	<iframe src="" id='AddressAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- <div id="tabs-5" class="GBx-fieldset" align="left">
 	<iframe src="" id='ExaminationsAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div>
  <div id="tabs-6" class="GBx-fieldset" align="left">
 	<iframe src="" id='SelectPersonAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div>
  <div id="tabs-7" class="GBx-fieldset" align="left">
 	<iframe src="" id='OpenSelectAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div>
  <div id="tabs-8" class="GBx-fieldset" align="left">
 	<iframe src="" id='OpenTransferringAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <div id="tabs-9" class="GBx-fieldset" align="left">
    <iframe src="" id='TrainAddPage_GB' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
  <!-- <div id="tabs-10" class="GBx-fieldset" align="left">
    <iframe src="" id='NiRenMian_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
 <!--  <div id="tabs-11" class="GBx-fieldset" align="left">
    <iframe src="" id='LiTui_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <div id="tabs-12" class="GBx-fieldset" align="left">
    <iframe src="" id='JdInformationAddPage_GB' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
  <!-- <div id="tabs-13" class="GBx-fieldset" align="left">
    <iframe src="" id='AttributeAddPage_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- 日志管理 -->
  <div id="tabs-14" class="GBx-fieldset" align="left">
    <iframe src="" id='LogManger_GB' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
  <!-- <div id="tabs-15" class="GBx-fieldset" align="left">
  	<iframe src="" id='RankByRules_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- <div id="tabs-20" class="GBx-fieldset" align="left">
    <iframe src="" id='Multimedia_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- <div id="tabs-21" class="GBx-fieldset" align="left">
    <iframe src="" id='FamilyMembers_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <!-- <div id="tabs-22" class="GBx-fieldset" align="left">
    <iframe src="" id='GBRS_GB' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <div id="tabs-23" class="GBx-fieldset" align="left">
  	<iframe src="" id='A0196TagsAddPage' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
  <!-- <div id="tabs-24" class="GBx-fieldset" align="left">
  	<iframe src="" id='AddJianLiAddPage' style="width: 854px;height: 625px;border: 0px;"></iframe>
  </div> -->
  <div id="tabs-34" class="GBx-fieldset" align="left">
  	<iframe src="" id='PersontiveFile' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
   <div id="tabs-25" class="GBx-fieldset" align="left">
  	<iframe src="" id='ZZBQTags' style="width: 854px;height: 100%;border: 0px;"></iframe>
  </div>
</div>




<script type="text/javascript">
// document.getElementById('a0101').setAttribute('onblur', 'validateName()');
//去除姓名中的空格
function validateName(){
	var a0101 = document.getElementById('a0101').value;//姓名
	if(a0101!=""){
		a0101=a0101.replace(/\s+/g,"");
		document.getElementById('a0101').value=a0101;
	}
}

lookdata(sign_js );

$(function() {
	$("#a0101").blur(function(){validateName();});
	$( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
	$( "#ulTitle" ).css("display","block");
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
    $('#tabs ul li a').bind('click', function(event) {
    	var $this = $(this);
    	var $title = $this.attr('tabname');//title展示 rmb页面和其它页面样式切换
    	if($title!='JdInformationAddPage_GB'&&$title!='LogManger_GB'&&$title!='GBRS_GB'&&$title!='TrainAddPage_GB'&&$title!='AddJianLiAddPage'&&$title!='NiRenMian_GB'&&$title!='Multimedia_GB'&&$title!='FamilyMembers_GB'&&$title!='A0196TagsAddPage'&& $title!='PersontiveFile'
    		&&$title!='RankByRules_GB' &&$title!='ExitAddPage_GB'&& $title!='AddressAddPage_GB'&& $title!='ZZBQTags'){
    		$('#rmbButton').css('visibility','visible');
    		if($title=='rmb'){
        		$('#personInfo').removeClass("others-info-title");
        		$('#tabs-0').removeClass('tabs-0');//基本情况不做display none 否则格式会乱
        		$('#continueAdd').css('visibility','visible');//继续增加按钮
        	}else{
        		$('#personInfo').addClass("others-info-title");
        		$('#tabs-0').addClass('tabs-0');
        		$('#continueAdd').css('visibility','hidden');
        	}
    	}else{
    		$('#personInfo').addClass("others-info-title");
    		$('#tabs-0').addClass('tabs-0');
    		$('#continueAdd').css('visibility','hidden');
    		$('#rmbButton').css('visibility','hidden');
    	}
    	if($title=='RankByRules_GB'){
    		$('#prtRmb').css('display','none');
    		$('#prtTG').css('display','none');
    	}else{
    		$('#prtRmb').css('display','block');
    		$('#prtTG').css('display','none');
    	}

    	
/*     	if($title=='RankByRules_GB' || $title=='ExitAddPage_GB'|| $title=='AddressAddPage_GB'){
    		$('#next_person').css('display','none');
    		$('#previous_person').css('display','nonfe');
    		$('#ylRmb').css('display','none');
    		$('#prtRmb').css('display','none');
    	} */
    	
    	var winsrc = $this.attr('winsrc');//iframe的src
		var random = Math.random();
		if (!!winsrc && winsrc != '') {
			$('#' + $this.attr('winid')).attr('src', winsrc + "&aa=" + random);
			try{
				document.getElementById('#' + $this.attr('winid')).contentWindow.location.reload(true);
			}catch(e){}
			
			//$this.attr('winsrc', '');
		}
	});
});

//计算已经打开的iframe
function countIframes() {
	var iframe_windows = [];
	$('#tabs ul li a').each(function (e) {

		var winid = $(this).attr('winid');
		if (!!winid && winid != '') {
			var iframeWin = document.getElementById(winid).contentWindow;
			if (typeof (iframeWin.save) == 'function') {
				iframe_windows.push(iframeWin);
			}
		}
	});
	return iframe_windows;

}

</script>
<script>
var newwin = new Ext.Window({
	contentEl: "jlcontent",
	title : '简历',
	layout : 'fit',
	width : 960,
	overflow : 'hidden',
	height : 600,
	closeAction : 'hide',
	closable : true,
	minimizable : false,
	maximizable : false,
	modal : false,
	maximized:false,
	id : 'jlfl',
	bodyStyle : 'background-color:#FFFFFF; overflow-x:hidden; overflow-y:hidden',
	plain : true,
	listeners:{}
	});

//简历生成模式
function selectall2(){
	var contenttext = document.getElementById("contenttext2").value.replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/<\/?[^>]*>/g,'').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
	document.getElementById("a1701").value=contenttext;
	setContent();
	var jlfl = Ext.getCmp("jlfl");
	jlfl.hide();
	ajaxSubmit('saveJL');
	//radow.doEvent('saveJL');
	//alert(2222);
}
//简历生成模式
function selectall(){
	var contenttext = document.getElementById("contenttext").value.replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/<\/?[^>]*>/g,'').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
	document.getElementById("a1701").value=contenttext;
	setContent();
	var jlfl = Ext.getCmp("jlfl");
	jlfl.hide();
	ajaxSubmit('saveJL');
}

function setJIANLI(contenttext){
	document.getElementById("a1701").value=contenttext;
	setContent();
}

function showwin(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
	/*  document.getElementById("contenttext").value=document.getElementById("a1701").value.trim().replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/<\/?[^>]*>/g,'').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
 		document.getElementById("jlcontent").style.display="block";
 		var jlfl = Ext.getCmp("jlfl");
 		//Ext.getCmp("jltab").activate("tab2");

 		Ext.getCmp("jltab").activate("tab1");		//默认显示“简历文本编辑”tab
 		if(!jlfl.rendered){
 			jlfl.show();//alert("no reader")
 		}else if(jlfl.hidden){
 			jlfl.show();//alert("hidden")
 		}else{
 			jlfl.hide();//alert("show")
 		} */
	$h.openPageModeWin('openJLCF','pages.customquery.person.AddJianLiAddPage','简历拆分',1200,1050,{a0000:Id},ctxPath); 
}
function showwin2(){
	var Id = document.getElementById("a0000").value;
	document.getElementById("contenttext").value=document.getElementById("a1701").value.trim().replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/<\/?[^>]*>/g,'').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
	$h.openPageModeWin('a1701entrywin','pages.publicServantManage.ResumeList','简历编辑',870,435,document.getElementById('a0000').value,ctxPath);


}
</script>
<%--简历生成--%>
	<div id="jlcontent" style="display: none;width:1052px">
	    <odin:tab id="jltab">

		    <odin:tabModel>
		    	<odin:tabItem title="简历文本编辑" id="tab1"></odin:tabItem>
		    	<odin:tabItem title="按职务自动生成简历" id="tab2" isLast="true"></odin:tabItem>
		    </odin:tabModel>
		    <odin:tabCont itemIndex="tab1" >
				<textarea style="height:510px;width: 1050px;font-size:20px;" id="contenttext" style="font-family: '宋体', Simsun;"></textarea>
				<odin:button property="qx" text="&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;" handler="selectall"></odin:button>
			</odin:tabCont>
		    <odin:tabCont itemIndex="tab2">
		    	<textarea style="height:510px;width: 1050px;font-size:20px;" id="contenttext2" style="font-family: '宋体', Simsun;"></textarea>
		    	<odin:button property="qx2" text="&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;" handler="selectall2"></odin:button>
		    </odin:tabCont>
	    </odin:tab>
	</div>
	<odin:window src="/blank.htm" id="pdfViewWin1" width="700" height="500"
	title="任免表预览界面" modal="true" />
<script type="text/javascript" src="js/divscroll.js"></script>

<script type="text/javascript">







 function prtRmb_new(){
	/* var a0000 = document.getElementById("a0000").value;
	storePam['a0000AndFlag']=a0000+',true';
	ajaxSubmit('printView',storePam,function(){
		var iframe_windows = countIframes();
		othersInfoReshow(iframe_windows);
	}); */
	//$h.openPageModeWin('addPartyTime','pages.publicServantManage.AddPartyTimeAddPage','入党时间',500,250,document.getElementById('a0000').value,ctxPath);
	//$h.openPageModeWin('printMenu','pages.publicServantManage.PrintMenu','打印任免表',200,150,1,ctxPath);
	//var a0000 = document.getElementById("a0000").value;
	//parent.radow.doEvent('printViewNew',a0000+',true');
<%-- 	$h.openPageModeWin('pdfViewWinNew','pages.publicServantManage.PdfView','打印任免表',700,500,1,'<%=request.getContextPath()%>');--%>
    var a0000 = document.getElementById("a0000").value;
	//parent.document.getElementById("printPdf").value = "pdf1.1";
	parent.radow.doEvent('printViewNew',a0000+',true');
	$h.openPageModeWin('pdfViewWinNew','pages.publicServantManage.PdfView','预览任免表',700,500,1,ctxPath);
 }
 function PRmb(){


	    var a0000 = document.getElementById("a0000").value;

		parent.radow.doEvent('prtRmb_print',a0000+',true');

	 }



 function prtTG(){
		var a0000 = document.getElementById("a0000").value;
		storePam['a0000AndFlag']=a0000+',true';
		/* ajaxSubmit('printView',storePam,function(){
			var iframe_windows = countIframes();
			othersInfoReshow(iframe_windows);
		}); */
		//$h.openPageModeWin('addPartyTime','pages.publicServantManage.AddPartyTimeAddPage','入党时间',500,250,document.getElementById('a0000').value,ctxPath);
		//$h.openPageModeWin('printMenu','pages.publicServantManage.PrintMenu','打印任免表',200,150,1,ctxPath);
		var a0000 = document.getElementById("a0000").value;
		parent.document.getElementById("printPdf").value = "pdf2.1";
		<%-- Ext.Ajax.request({
	   		timeout: 10000,
	   		url: "<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.customquery.CustomQuery&eventNames=prtTG?photodate="+a0000+",true",
	   		method :"post",
	   		success: function(response) {
	   			downloadfile();
	           }
	      }); --%>
		parent.radow.doEvent('prtTG',a0000+',true');
		//setTimeout(downloadfile,10000);
		$h.openPageModeWin('pdfViewWinNew','pages.publicServantManage.PdfView','打印套改表',700,500,1,ctxPath);
	 }
 function downloadfile(){
	 	var downfile = '<%=request.getSession().getAttribute("pdfFilePath") %>';
		window.location.href="<%=request.getContextPath()%>/ProblemDownServlet?method=downFile&prid="+encodeURI(encodeURI(downfile));
 }

/* 打印任免表 */
function prtRmb(){
	try{
		var wdapp = new ActiveXObject("Word.Application");
  	}catch(e){
  		$helper.alertActiveX();
	    return;
  	}
	Ext.Msg.wait('请稍候...', '系统提示：');
	var a0000 = document.getElementById("a0000").value;
	ajaxSubmit('prtRmb', a0000);
	/* Ext.Msg.wait('请稍候...','系统提示：');
	var Id = document.getElementById("a0000").value; */
}

 function printStart(path) {
	 var url = window.location.protocol + "//" + window.location.host + "/hzb/";
	 path = url + path;
	 var wdapp = null;
	 try {
		 wdapp = new ActiveXObject("KWPS.Application");
		 wdapp.Documents.Open(path);//打开word模板url
		 wdapp.Application.Printout();
	 } catch (e) {
		 try {
			 wdapp = new ActiveXObject("Word.Application");
			 wdapp.Documents.Open(path);//打开word模板url
			 wdapp.Application.Printout();
		 } catch (e) {
			 $helper.alertActiveX();
			 $h.alert('系统提示：', '请重新安装WPS2016', null, 180);

		 }
	 }
 }

 /* 家庭成员上移下移 */
 function up(upOrDown) {
	 var familyRowNum = document.getElementById('familyRowNum').value;//当前行号
	 <%-- alert(familyRowNum+"-----"+<%=fixedNum%>) --%>
	<%-- if(true){
		if(upOrDown == '-1'){//点击的是上移按钮
			odin.alert("禁止向上移动！");
			return false;
		}
		if(upOrDown == '1'){//点击的是上移按钮
			if(familyRowNum < <%=fixedNum%>){
				odin.alert("禁止向下移动！");
				return false;
			 }
		}
	}  --%>
	//alert('当前行号:'+familyRowNum);
	var newFamilyNum = changeABC(familyRowNum);

	var upRow = parseInt(familyRowNum) + parseInt(upOrDown); //上移的行号
	var newUpRow = changeABC(upRow);
	if (upOrDown == '1') {//点击的是下移按钮
		//判断下面是否有人或大于10人
		var a3600 = document.getElementById("a3600_" + newUpRow).value;
		if (!a3600) {
			odin.alert("已经是最后一位");
			return;
		}
	}

	var mycars = ["a3604a_", "a3601_", "a3607_", "a3627_", "a3611_", "a3600_", "a3684_"];
	for (var i = 0; i < mycars.length; i++) {
		var text;
		if (i == 0 || i == 3) {
			text = "setShowValue()";
		}
		if (i == 1 || i == 4) {
			text = "onblur()";
		}
		if (i == 2) {
			text = "onSubstrblurEvent()";
		}

		var up = document.getElementById(mycars[i]+newFamilyNum).value;

		document.getElementById(mycars[i]+newFamilyNum).value = document.getElementById(mycars[i]+newUpRow).value;
		document.getElementById(mycars[i]+newUpRow).value = up;

		if(i!=5){
			eval(mycars[i]+newFamilyNum+text);
			eval(mycars[i]+newUpRow+text);
		}
	}
	document.getElementById('familyRowNum').value = upRow;
}

/* 删除家庭人员 */
function addA36row(){
	var familyRowNum = document.getElementById('familyRowNum').value;
	var newFamilyNum = changeABC(familyRowNum);
	var A3600 = document.getElementById("a3600_"+newFamilyNum).value;
	if(!A3600){
		return;
	}

	$h.confirm("系统提示：","是否确认删除该条家庭成员信息？",200,function(id) {
		if("ok"==id){

			//先后台删除处理
			Ext.Ajax.request({
			 	method: 'POST',
			 	timeout: 100000,
			 	params: {'a3600':A3600},
			 	url: "<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.AddZHGBRmb&eventNames=deleteFamily",
				success: function (response, options) {
					var result = Ext.util.JSON.decode(response.responseText);
					if (result.resType == 1) {
						//清除该条信息
						var mycars = ["a3604a_", "a3601_", "a3607_", "a3627_", "a3611_", "a3600_", "a3684_"];
						for (var i = 0; i < mycars.length; i++) {
							var text;
							if (i == 0 || i == 3) {
								text = "setShowValue()";
							}
							if (i == 1 || i == 4) {
								text = "onblur()";
							}
							if (i == 2) {
								text = "onSubstrblurEvent()";
							}

							document.getElementById(mycars[i]+newFamilyNum).value = "";

							if(i!=5){
								eval(mycars[i]+newFamilyNum+text);
							}
						}
						//下面的信息上移
						for(var i=parseInt(familyRowNum);i<10;i++){
							newFamilyNum = changeABC(familyRowNum);
							var nextNum = parseInt(familyRowNum)+1;//上移的行号
							var newUpRow = changeABC(nextNum);
							var A3600 = document.getElementById("a3600_"+newUpRow).value;//取不到a3600则停止
							if(!A3600){
								return;
							}
							for(var j=0;j<mycars.length;j++){
								var text;
								if(j==0 || j==3){
									text = "setShowValue()";
								}
								if(j==1 ||  j==4){
									text = "onblur()";
								}
								if(j==2){
									text = "onSubstrblurEvent()";
								}
								var up = document.getElementById(mycars[j]+newFamilyNum).value;
								document.getElementById(mycars[j]+newFamilyNum).value = document.getElementById(mycars[j]+newUpRow).value;
								document.getElementById(mycars[j]+newUpRow).value = up;
								if(j!=5){
									eval(mycars[j]+newFamilyNum+text);
									eval(mycars[j]+newUpRow+text);
								}
							}
							familyRowNum = parseInt(familyRowNum)+1;//当前行号+1
						}
					}else{
						odin.alert('删除失败！');
					}

			 	},
			 	failure : function(response, options){
			 		Ext.Msg.hide();
			 		odin.alert('请求超时！');
				}
			});

		}else{

		}
	});
}

function getNum(num){
	document.getElementById('familyRowNum').value = num;
}

function changeABC(n){
	var ichar = parseInt(n)+97;
	var SCII = String.fromCharCode(ichar);
	return SCII;
}

function a0140Click(){

	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('addPartyTime','pages.publicServantManage.AddPartyTimeAddPage','入党时间',500,250,document.getElementById('a0000').value,ctxPath);
}

var numC = 0;
function a0140Click2(){

	if(numC == 1){
		return;
	}


	numC = 1;


	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('addPartyTime','pages.publicServantManage.AddPartyTimeAddPage','入党时间',500,250,document.getElementById('a0000').value,ctxPath);
}


function a0196Click(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('professSkill','pages.publicServantManage.ProfessSkillAddPage','专业技术职务',650,440,document.getElementById('a0000').value,ctxPath);
}
function xlxwClick(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('degrees','pages.publicServantManage.DegreesAddPage','学历学位',870,435,document.getElementById('a0000').value,ctxPath);
}
function a0192aClick(){
	var name = document.getElementById("a0101").value;
	var a0000 = document.getElementById("a0000").value;
 	$h.openPageModeWin('workUnits','pages.publicServantManage.WorkUnitsAddPage','工作单位及职务',1020,540,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false});
 	//$h.openPageModeWin('hzworkUnits','pages.publicServantManage.zwk.HZWorkUnits','工作单位及职务',1200, 850,a0000,ctxPath,null,{maximizable:false,resizable:false,a0000:a0000});
}
function AssociationClick(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('Association','pages.publicServantManage.AssociationAddPage','社团兼职',1020,540,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false});
}
/* function DbwyClick(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 	$h.openPageModeWin('DbwyAddPage','pages.publicServantManage.DbwyAddPage','代表委员',1020,540,document.getElementById('a0000').value,ctxPath,null,{maximizable:false,resizable:false});
} */
function a0221Click(){
	var name = document.getElementById("a0101").value;
	var Id = document.getElementById("a0000").value;
 		$h.openPageModeWin('RankAddPageWin','pages.publicServantManage.RankAddPage','现职务层次',695,320,document.getElementById('a0000').value,ctxPath);
}

 function a0192eClick() {
	 var name = document.getElementById("a0101").value;
	 var Id = document.getElementById("a0000").value;
	 $h.openPageModeWin('RradeRankAddPageWin', 'pages.publicServantManage.RradeRankAddPage', '现职级', 695, 320, document.getElementById('a0000').value, ctxPath);
 }

 function a2949Click() {
	 $h.openPageModeWin('RegisterAddPage_GB', 'pages.publicServantManage.RegisterAddPageGB', '公务员登记时间', 695, 320, document.getElementById('a0000').value, ctxPath);
 }

 function setA2949(v) {
	 var a2949 = document.getElementById("a2949").value = v;
	 var a2949_1 = document.getElementById("a2949_1");
	 rmbrestoreDate('a2949');
	 rmbblurDate_bj('a2949', false, true);
 }

 function resumeClick() {

	 $h.showWindowWithSrc('resumeWin', '<%=ctxPath%>/rmb/resume.jsp?','简历',811,661,null);
}

function addResume(a0201a,a0215a,a0243){
	//alert(a0201a);
	//alert(a0215a);
	//alert(a0243);
	//var jl1="\r\n"+a0243.substring(0,4)+"."+a0243.substring(4,6)+"--"+"       "+"  "+a0201a+a0215a;
	var jl2=a0243.substring(0,4)+"."+a0243.substring(4,6)+"--"+"       "+"  "+a0201a+a0215a+"\n";
	//document.getElementById('contenttext').value += jl1;
	document.getElementById('a1701').value += jl2;
	setContent();
}

//统计所在单位回写
function setA0195Value(key,value){
	document.getElementById('a0195').value=key;
	document.getElementById('comboxArea_a0195').value=value;
	//radow.doEvent("setA0195Value",key+"|"+value);
}
//现职务层次回写
function setA0221Value(key,value){
	document.getElementById('a0221').value=key;
	document.getElementById('comboxArea_a0221').value=value;
}
//现职务层次时间回写
function setA0288Value(value){
	document.getElementById('a0288').value=value;
	var a0288_1 = getTime(value);
	document.getElementById('a0288_1').value=a0288_1;
}
//现职级回写
function setA0192eValue(key,value){
	document.getElementById('a0192e').value=key;
	document.getElementById('comboxArea_a0192e').value=value;
}
//现职级时间回写
function setA0192cValue(value){
	document.getElementById('a0192c').value=value;
	var a0192c_1 = getTime(value);
	document.getElementById('a0192c_1').value=a0192c_1;
}


function getStorePam(){
	return {};
	<%
		if (fromModules != null && !"".equals(fromModules)){
	%>
		var pageSize = 1;
		var start = 1;
	<%
		}else{
	%>
	var grid = realParent.Ext.getCmp(gn);
	var bbar = grid.getBottomToolbar();
	var store = grid.getStore();
	var pageSize = bbar.pageSize;
	var start = bbar.cursor;
	<%
		}
	%>
	return {'start':start,'limit':pageSize,'gridName':gn}
}
var storePam = getStorePam();

/**
 * 上一个下一个
 */
var actionNext = "1";
function showNext(action){

	actionNext = action;
	//检查任免表是否已更改，更改则提示保存
	//ajaxSubmit('isChangeNext',null);
	//return false;

	next();

}


function tishiNext(){
	$h.confirm3btn('系统提示','当前信息已经修改,是否需要保存',null,function(iid){
		if(iid=='yes'){

			//对数据进行保存
			savePerson(1,2,null);


		}else if(iid=='no'){

			//关闭当前窗口
			Ext.Msg.wait('请稍候...','系统提示：');
			//alert(realParent.Ext)
			storePam['action']=actionNext;
			//console.log(bbar)
			ajaxSubmit('showNextclick',storePam);

		}else if(iid=='cancel'){
			return false;
		}

		});
}


function next(){


	Ext.Msg.wait('请稍候...','系统提示：');
	//alert(realParent.Ext)
	storePam['action']=actionNext;
	//console.log(bbar)
	ajaxSubmit('showNextclick',storePam,function(){
		var iframe_windows = countIframes();
		othersInfoReshow(iframe_windows);
	});

}

/**
 * 新增
 */
function addnew(){
	//alert(realParent.Ext)
	ajaxSubmit('addnew',storePam,function(){
		var iframe_windows = countIframes();
		othersInfoReshow(iframe_windows);
	});
}




function validateYearM(){
	var a0184 = document.getElementById('a0184').value;//身份证号
	var a0107 = document.getElementById('a0107').value;//出生年月
	if(a0107!=""&&a0184!=""){
		var YM = a0184.substring(6, 12);
		var YM2 = a0107.substring(0, 6);
		if (YM2 != YM) {
			document.getElementById('out_a0107').style.border = "1px solid red";
		} else {
			document.getElementById('out_a0107').style.border = "";
		}
	}
}

 function validateYearMByIDCard() {
	 var a0000 = document.getElementById('a0000').value;
	 var a0184 = document.getElementById('a0184').value;//身份证号
	 var a0107 = document.getElementById('a0107').value.substring(0, 6);//出生年月
	 if (a0107 == "" && a0184 != "") {
		 var YMD = getYearMDByIDCard(a0184);
		 document.getElementById('a0107').value = YMD;
		 var Year = YMD.substring(0, 4);
		 var Month = YMD.substring(4, 6);
		 document.getElementById('div_a0107').innerText = Year + "." + Month;
	 }
	 if (a0107 != "" && a0184 != "") {
		var YMD=getYearMDByIDCard(a0184).substring(0,6);
		if(a0107!=YMD){
			document.getElementById('out_a0107').style.border = "1px solid red";
		}else{
			document.getElementById('out_a0107').style.border = "";
		}
	}
	if(a0184!=""){
	ajaxSubmit('validateReIDCard')
	}else{
		document.getElementById('a0184').style.border='1px solid #222';
	}

}
function reIDCardInfo(flag){
	if(!flag){
	document.getElementById('a0184').style.border='1px solid red';
	}else{
		document.getElementById('a0184').style.border='1px solid #222';
	}
}
function getYearMDByIDCard(a0184){
	var YMD =a0184.substring(6,14);
	return YMD;
}



function savePerson(a,b,confirm){
	$h.progress('请等待', '正在保存信息...',null,400);
	Ext.MessageBox.updateProgress(0, ' ');//情空test
	var a0101 = document.getElementById('a0101').value;//姓名
	var a0184 = document.getElementById('a0184').value;//身份证号
	var a0107 = document.getElementById('a0107').value;//出生年月
	var a0163 = document.getElementById('a0163').value;//管理状态
	var orthersWindow = null;
	//校验身份证是否合法
	/* if(a0184==''){
		$h.alert('系统提示：','身份证号不能为空!',null,220);
		return false;
	}
	if(a0184.length>18){
		$h.alert('系统提示：','身份证号不能超过18位!',null,220);
		return false;
	} */

	//身份证验证
	//var vtext = $h.IDCard(a0184);
	var vtext = isIdCard(a0184);
	var flag=true;
	if(a0163!=""){
		flag=false;
		ajaxSubmit('validateAgeByA0163');
	}
	if(flag){
		if(vtext!==true){
			//$h.alert('系统提示：',vtext,null,320);
			$h.confirm("系统提示：",vtext+'，<br/>是否继续保存？',400,function(id) {
				if("ok"==id){
					//Ext.getCmp('a0184').clearInvalid();
					Ext.Msg.wait('请稍候...','系统提示：');
					savePersonSub(a,b,confirm,false);
				}else{
					return false;
				}
			});
		}
		else{
			savePersonSub(a,b,confirm,true);
		}
	}
}
//后台调用方法
function unlimitedSave(){

	var a0184 = document.getElementById('a0184').value;//身份证号
	var vtext = isIdCard(a0184);
	if(vtext!==true){
		//$h.alert('系统提示：',vtext,null,320);
		$h.confirm("系统提示：",vtext+'，<br/>是否继续保存？',400,function(id) {
			if("ok"==id){
				//Ext.getCmp('a0184').clearInvalid();
				Ext.Msg.wait('请稍候...','系统提示：');
				savePersonSub(a,b,confirm,false);
			}else{
				return false;
			}
		});
	}
	else{
		savePersonSub(a,b,confirm,true);
	}
}

//后台调用方法
function isSave(){
	var a0184 = document.getElementById('a0184').value;//身份证号
	var vtext = isIdCard(a0184);
	$h.confirm("系统提示：",'现职人员年龄小于18或大于63岁，是否保存？',400,function(id) {
		if("ok"==id){
			document.getElementById('out_a0107').style.border = "1px solid red";
			if(vtext!==true){
				//$h.alert('系统提示：',vtext,null,320);
				$h.confirm("系统提示：",vtext+'，<br/>是否继续保存？',400,function(id) {
					if("ok"==id){
						//Ext.getCmp('a0184').clearInvalid();
						Ext.Msg.wait('请稍候...','系统提示：');
						savePersonSub(a,b,confirm,false);
					}else{
						return false;
					}
				});
			}
			else{
				savePersonSub(a,b,confirm,true);
			}
		}else{
			return false;
		}
	});
}


function savePersonSub(a,b,confirm,isIdcard){

	var a0101 = document.getElementById('a0101').value.replace(/\s/g, "");//姓名
	var a0184 = document.getElementById('a0184').value;//身份证号
	var a0107 = document.getElementById('a0107').value;//出生年月
	var a0104 = document.getElementById('a0104').value;//性别
	var a0111_combo = document.getElementById('comboxArea_a0111').value;//籍贯
	var a0114 = document.getElementById('comboxArea_a0114').value.replace(/\s/g, "");//出生地
	var a0141 = document.getElementById('a0141').value;//政治面貌
	//var a0114_combo = document.getElementById('comboxArea_a0114').value;//出生地


	var a0117 = document.getElementById('a0117').value;//民族
	var a0128 = document.getElementById('a0128').value;//健康状况
	var a0134 = document.getElementById('a0134').value;//参加工作时间

	var a0195 = document.getElementById('a0195').value;//统计关系所在单位
	var a0160 = document.getElementById('a0160').value;//人员类别
	var a0165 = document.getElementById('a0165').value;//管理类别
	var a1701 = document.getElementById('a1701').value;//简历
	var a0121 = document.getElementById('a0121').value;//编制类型
	var a2949 = document.getElementById('a2949').value;//公务员登记时间


	

	
	//出生日期格式
	var datetext = $h.date(a0107);
	if(datetext!==true){
		$h.alert('系统提示：','<font style="color:red">出生年月：'+datetext+'</font>',null,320);
		return false;
	}


	/* //其他信息页面校验
	if(document.getElementById('Iorthers')){
		orthersWindow = document.getElementById('Iorthers').contentWindow;
		if(orthersWindow){
			if (orthersWindow.formcheck() == true) {//全局校验
			}else{
				var tabs = Ext.getCmp('rmbTabs');
				tabs.activate(tabs.getItem('orthers'));
				return false;
			}
		}
	}
	//业务信息页面校验
	if(document.getElementById('IBusinessInfo')){
		orthersWindow = document.getElementById('IBusinessInfo').contentWindow;
		if(orthersWindow){
			if (orthersWindow.formcheck() == true) {//全局校验
			}else{
				var tabs = Ext.getCmp('rmbTabs');
				tabs.activate(tabs.getItem('IBusinessInfo'));
				return false;
			}
		}
	} */
	var a0165 = document.getElementById('a0165').value;//管理类别
	if(a0165==null || a0165==''){
		$h.alert('系统提示：','请选择管理类别',null,150);
		return;
	}
	var a0141 = document.getElementById('a0141').value;//出身年月
	if(a0141==null || a0141==''){
		$h.alert('系统提示：','请双击入党时间维护政治面貌！',null,150);
		return;
	}

	var birthdaya0184 = getBirthdatByIdNo(a0184);
	var birthdaya0107 = document.getElementById('a0107').value;//出身年月
	var msg = '<font style="color:red">出生日期与身份证不一致</font>，<br/>是否继续保存？';
	var iframe_windows = countIframes();
	if (formcheck(iframe_windows) == false) {//其他页面校验
		return;
	}
	
	
	saveAlert = new SaveAlert(iframe_windows);
	if (isIdcard && (birthdaya0107 == '' || (birthdaya0107.substring(0, 6) != birthdaya0184.substring(0, 6)))) {
		$h.confirm("系统提示：", msg, 200, function (id) {
			if ("ok" == id) {
				Ext.Msg.wait('请稍候...', '系统提示：');
				ajaxSubmit('save.onclick');
				setTimeout(function () {
					saveOthers(iframe_windows);
				}, 500);


			} else {
				return false;
			}
		});
		return false;
	} else {
		ajaxSubmit('save.onclick');
		//其他信息  ///
		setTimeout(function () {
			saveOthers(iframe_windows);
		}, 500);
	}


}

//保存其它页面信息
function formcheck(iframe_windows){

	//alert(iframe_windows[0].save)
	for(var i=0;i<iframe_windows.length;i++){
		if(!!iframe_windows[i].formcheck){
			if(iframe_windows[i].formcheck()==false){
				return false;
			}

		}
	}
	return true;
}

//保存其它页面信息
function saveOthers(iframe_windows){
	//alert(iframe_windows[0].save)
	for(var i=0;i<iframe_windows.length;i++){
		if(!!iframe_windows[i].save){
			iframe_windows[i].save();

		}
	}
}
//其它页面信息回显
function othersInfoReshow(iframe_windows){

	//alert(iframe_windows[0].save)
	for(var i=0;i<iframe_windows.length;i++){
		if(!!iframe_windows[i].reShowMsg){
			iframe_windows[i].reShowMsg();

		}
	}
}
//保存提示


 var saveAlert;

 function SaveAlert(iframe_windows) {
	 var curIndex = 0;
	 var pageLength = iframe_windows.length + 1;
	 var alertErrMsg = "";
	 var lazy = 0;
	 var updateProgress = function (cur, total, pageName, mainMessage, lazy) {
		 setTimeout(function () {
			 Ext.MessageBox.updateProgress(cur / total, pageName + "：" + mainMessage);
		 }, lazy);
	 };
	 //var alertSucMsg = "";
	 return function (messageCode, pageName, mainMessage) {
		 curIndex++;

		 if (messageCode == 0) {
			 updateProgress(curIndex, pageLength, pageName, mainMessage, lazy);
		 } else {
			 updateProgress(curIndex, pageLength, pageName, mainMessage, lazy);
			 alertErrMsg = alertErrMsg + pageName + "：" + mainMessage + "<br/>";
		 }
		lazy = lazy+50;
		if(curIndex==pageLength){
			if(alertErrMsg==''){

				setTimeout(function(){
					Ext.Msg.hide();
					Ext.example.msg('','保存成功。',1);
				}
				,lazy+100);

			}else{
				setTimeout(function(){$h.alert('系统提示：',alertErrMsg,null,500);},lazy+50);

			}
		}
	}
}

function ajaxSubmit(radowEvent,parm,callback){
	if(parm){
	}else{
		parm = {};
	}
	Ext.Ajax.request({
		method: 'POST',
		form:'rmbform',
        async: true,
        params : parm,
        timeout :300000,//按毫秒计算
		url: "<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.publicServantManage.AddZHGBRmb&eventNames="+radowEvent,
		success: function(resData){
			var cfg = Ext.util.JSON.decode(resData.responseText);
			//alert(cfg.messageCode)
			if(0==cfg.messageCode){
                Ext.Msg.hide();

                if(cfg.elementsScript.indexOf("\n")>0){
					cfg.elementsScript = cfg.elementsScript.replace(/\r/gi,"");
					cfg.elementsScript = cfg.elementsScript.replace(/\n/gi,"\\n");
				}

				//console.log(cfg.elementsScript);

				eval(cfg.elementsScript);
				//var realParent = parent.Ext.getCmp("setFields").initialConfig.thisWin;
				//parent.document.location.reload();
				//alert(cfg.elementsScript);
				//realParent.resetCM(cfg.elementsScript);
				//parent.Ext.getCmp("setFields").close();
				//console.log(cfg.mainMessage);

				if("操作成功！"!=cfg.mainMessage){
					if("save.onclick"==radowEvent){
						saveAlert(cfg.messageCode,"基本情况信息集",cfg.mainMessage);
					}else{
						Ext.Msg.hide();
						Ext.Msg.alert('系统提示:',cfg.mainMessage);
					}

				}else{
// 					Ext.Msg.hide();
				}
			}else{
				//Ext.Msg.hide();

				/* if(cfg.mainMessage.indexOf("<br/>")>0){

					$h.alert('系统提示',cfg.mainMessage,null,380);
					return;
				} */

				if("操作成功！"!=cfg.mainMessage){
					if("save.onclick"==radowEvent){
						saveAlert(cfg.messageCode,"基本情况信息集",cfg.mainMessage);
					}else{
						Ext.Msg.hide();
						Ext.Msg.alert('系统提示:',cfg.mainMessage);
					}
				}else{
					Ext.Msg.hide();
				}
			}
			if(!!callback){
				callback();
			}
		},
		failure : function(res, options){
			Ext.Msg.hide();
			alert("网络异常！");
		}
	});
}
//验证身份证号并获取出生日期
 function getBirthdatByIdNo(iIdNo) {
	 var tmpStr = "";
	 var idDate = "";
	 var tmpInt = 0;
	 var strReturn = "";

	 iIdNo = trim(iIdNo);
	 if (iIdNo.length == 15) {
		 tmpStr = iIdNo.substring(6, 12);
		 tmpStr = "19" + tmpStr;
		 tmpStr = tmpStr.substring(0, 4) + tmpStr.substring(4, 6) + tmpStr.substring(6);

		 return tmpStr;
	 } else {
		 tmpStr = iIdNo.substring(6, 14);
		 tmpStr = tmpStr.substring(0, 4) + tmpStr.substring(4, 6) + tmpStr.substring(6);
		 return tmpStr;
	 }
 }

 function trim(s) {
	 return s.replace(/^\s+|\s+$/g, "");
 }

 function showdialog() {
	 $h.showModalDialog('picupload', ctxPath + '/picCut/picwin.jsp?a0000="+a0000+"', '头像上传', 900, 490, null, {a0000: '"+a0000+"'}, true);
}
function showdialog2(fileName) {
	 $h.showModalDialog('picupload2', ctxPath + '/picCut/uploadimage.jsp?ImgIdPostfix=&Picurl='+fileName+ '&step=2', '头像上传', 900, 490, null, {a0000: '"+a0000+"'}, true);
}


 function setShowValue(id,codetypeJson){
	var value = document.getElementById(id).value;
	if(codetypeJson[value]){
		document.getElementById("comboxArea_"+id).value=codetypeJson[value];
	}else{
		document.getElementById("comboxArea_"+id).value='';
	}
}
function a0160onchange(a){
	//alert(a);
}


function namevalidator(obj){

	//var a0101obj = document.getElementById('a0101');
	var value = obj.value;

	if(value.length>18){
		obj.value = obj.value.substring(0,18);
	}

	//去除前面的点
	while(true){
		var firstStr = value.substring(0,1);
		if(firstStr==='.'||firstStr==='。'||firstStr==='·'){
			obj.value=value=value.substring(1,value.length);
		}else{
			break;
		}
	}
	//将。.转为·
	if (value.match(/\.|。|\r\n|\r|\n/g)) {
		obj.value = value.replace(/\.|。/g, "·").replace(/\r\n|\r|\n/g, "");
	}

	var a0101 = document.getElementById('a0101').value;
	//alert(a0101);
	var c = [];
	var s = 0;
	for (var i = 0; i < a0101.length; i++) {
		c.push(a0101.charAt(i));
	}
	for (var i = 0; i < c.length; i++) {
		if (c[i] == "·" || c[i] == ".") {
			s++;
		}
	}
	if (s > 2) {
		$h.alert('系统提示：','包含三个或以上·,请确认!',null,220);
	}



	return true;
}
function setTitle(){
	var a0101 = document.getElementById("a0101").value;
	var a0104 = document.getElementById("a0104Text").value;
	var a0107 = document.getElementById("a0107").value;
	var age = $h.getYear(a0107,new Date().format("Ymd"));
	//console.log(new Date().format("yyyyMMdd"));
	var title = a0101 + "，" + a0104 + "，" + age + "岁";


	parent.Ext.getCmp('personInfoOP').setTitle(title.replace("<", "&lt;").replace("'", "&acute;"));
}





 function peoplePortrait(){
	 /* var a0000PeoplePortrait = document.getElementById("a0000").value;
	 var fulls = "left=0,screenX=0,top=0,screenY=0,scrollbars=1";    //定义弹出窗口的参数
	 if (window.screen) {
	    var ah = screen.availHeight - 30;
	    var aw = screen.availWidth - 90;
	    fulls += ",height=" + ah;
	    fulls += ",innerHeight=" + ah;
	    fulls += ",width=" + aw;
	    fulls += ",innerWidth=" + aw;
	    fulls += ",resizable"
	 } else {
	    fulls += ",resizable"; // 对于不支持screen属性的浏览器，可以手工进行最大化。 manually
	 }
	 window.open(ctxPath+"/radowAction.do?method=doEvent&pageModel=pages.customquery.PeoplePortrait&a0000="+a0000PeoplePortrait,"画像",fulls); */
	 var ip='<%=GlobalNames.sysConfig.get("XBDJ_IP")%>';
	 var port='<%=GlobalNames.sysConfig.get("XBDJ_MAINPORT")%>';
	 //http://71.8.177.189:1902/ngbdp/yjgz/newtable
	 var url = "http://"+ip+":"+port+"/ngbdp/versionHistory/gbhx/s2?hasback=false"; 
	 var a0000 = document.getElementById("a0000").value;
	
	var rmbWin=window.open(url+'&a0000='+a0000, '_blank', 'height=637, width=1230, top=20, left='+(screen.width/2-615)+', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}
Ext.onReady(function(){
	setShowValue("a0221",CodeTypeJson.ZB09);
	setShowValue("a0192e",CodeTypeJson.ZB148);

	/* var a1701 = document.getElementById('a1701').value;
	setResume(a1701); */

	//

	
});



//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor');

function a1701button(){
	/* document.createElement("create").disabled = "disabled";
	//$("#create").addClass('bgclor');
	document.createElement("create").onclick=null;
	document.createElement("formatting").disabled = "disabled";
	//$("#formatting").addClass('bgclor');
	document.createElement("formatting").onclick=null; */
	$("#create").removeAttr("onclick");
	$("#formatting").removeAttr("onclick");
}

//alert(ue);
Ext.onReady(function(){
ue.ready(function () {

    // $('input').removeAttr('onclick');
    // $('input').removeAttr('disabled');
    // $('input').attr('readonly','true');
    // $('div[disabled]').removeAttr('disabled');

		//根据信息项权限组控制，判断简历是否可用
		if(fieldsDisabled.indexOf("a1701") != -1){
            $('input').removeAttr("disabled");//去除input元素的disabled属性
			ue.setDisabled();
			Ext.getCmp('qx').setDisabled(true);
			Ext.getCmp('qx2').setDisabled(true);
			window.frames["ueditor_0"].document.getElementById("bodyContent").style.backgroundColor = "#FFFFFF";
			window.frames["ueditor_0"].document.getElementById("bodyContent").style.color = "#000";
			window.frames["ueditor_0"].document.getElementById("bodyContent").ondblclick=null;
			a1701button();
		}
		if(selectDisabled.indexOf("a1701") != -1){
			ue.setDisabled();
			Ext.getCmp('qx').setDisabled(true);
			Ext.getCmp('qx2').setDisabled(true);
			window.frames["ueditor_0"].document.getElementById("bodyContent").style.backgroundColor = "#FFFFFF";
			window.frames["ueditor_0"].document.getElementById("bodyContent").style.color = "#000";
			window.frames["ueditor_0"].document.getElementById("bodyContent").ondblclick=null;
			var div = document.createElement("div");
			var pNode = document.getElementById("resume").parentNode;
			pNode.style.position = "relative";
			div.style.width = document.getElementById("resume").offsetWidth;
			div.style.height = document.getElementById("resume").offsetHeight;
			div.style.position = "absolute";
			div.style.left = '0px';
			div.style.top = '0px';
			var imgdata = "url(<%=request.getContextPath()%>/image/suo.jpg)";
			div.style.backgroundImage = imgdata;
			div.style.backgroundRepeat = "no-repeat";
			div.style.backgroundColor = "white";
			div.style.backgroundPosition = "center";
			pNode.appendChild(div);
			a1701button();
		}

        // editor准备好之后才可以使用
	  // setTimeout(function() {
	        	a1701Format();
	  // }, 600);

	        	//console.log(UE.plugins)

	        	ue.setDisabled();
	});

});


if(window.clipboardData){

    //for IE

	/* var copyBtn = document.getElementById("copy");

	copyBtn.onclick = function(){
		 window.clipboardData.setData('text',document.getElementById("a1701").value);
	}  */
}


function a1701Format(){
	// alert(1);
	//var regEx1=/\s*--\s*/g;
	//var regEx2=/\s*--/g;

	var a1701 = document.getElementById("a1701").value.replace(/期间/g,'其间');
	var a1701Array = a1701.replace(/\r/g,'').split('\n');
	for(var index=0;index<a1701Array.length;index++){
		var text = a1701Array[index].trim().replace(/^[\u3000\x20\xA0]{1,}/,'').replace(/[\u3000\x20\xA0]{1,}$/,'');

		if(text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}\s*[\-\u2500\u2014\uff0d]{1,}\s*[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/)){

				text=text.replace(/\s*--\s*/g,'--');

		}

		if(text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}\s*[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)){

				text=text.replace(/\s*--/g,'--');

		}


		if(text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/)){

			text = text.replace(/[\.\uff0e]/g,'.').replace(/[\-\u2500\u2014\uff0d]{1,}/,'--').replace(/[\u3000\x20\xA0]{1,}/,'\u2002\u2002');

		}else if(text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)){
			text = text.replace(/[\.\uff0e]/g,'.').replace(/[\-\u2500\u2014\uff0d]{1,}/,'--').replace(/[\u3000\x20\xA0]{1,}/,'\u2002\u2002\u2002\u2002\u2002\u2002\u2002\u2002\u2002');
		}
		a1701Array[index] = text.replace(/[\u3000\x20\xA0]{18,}/g,'\n');
	}
	var newA1701='';
	for(var index=0;index<a1701Array.length;index++){
		newA1701 = newA1701 + a1701Array[index] + '\n';
	}
	document.getElementById("a1701").value = newA1701;
	//alert(a1701Array.length)
	setContent();
	var a1701_keyWords = '<%=a1701_keyWords %>'; //获取人员简历关键词
			if (a1701_keyWords.length > 0) {
				setJL_Highlight(a1701_keyWords);
			}
	//alert(a1701);
	var a1701Array = newA1701.replace(/\r/g,'').split('\n');


	if (newA1701.indexOf("\n") < 0) {
		//alert(newA1701);
	     return;
	}
	//取出第一个不连续时间的行的索引
	var firstIndex;
	for (var index = 0; index < a1701Array.length; index++) {
		var text = a1701Array[index];
		if (text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)) {
			firstIndex = index;
			break;
		}
	}
	//将所有带有时间间隔的行添加到新的数组中
	//alert(firstIndex);
	var myArray = [];
	if (firstIndex == undefined) {
		for (var index = 0; index < a1701Array.length; index++) {
			var text = a1701Array[index];
			if (text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/) || text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)) {
				myArray.push(text);
			}
		}
	} else {
		for (var index = 0; index < firstIndex + 1; index++) {
			var text = a1701Array[index];
			if(text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/) || text.match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)){
				myArray.push(text);
			}

		}
	}


	//判断时间是否连续
	var msg="";
	for(var i=0;i<myArray.length-1;i++){
		var time=myArray[i].match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/)+"";
		var timeNext="";
		if(firstIndex==undefined){
			timeNext=myArray[i+1].match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/)+"";
		}else{
			if(i == myArray.length-2){
				timeNext=myArray[i+1].match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[\u3000\x20\xA0]{1,}/)+"";
			}else{
				timeNext=myArray[i+1].match(/^[0-9]{4}[\.\uff0e][0-9]{2}[\-\u2500\u2014\uff0d]{1,}[0-9]{4}[\.\uff0e][0-9]{2}[\u3000\x20\xA0]{1,}/)+"";
			}
		}


		var timeArr=time.split('--');
		var timeNextArr=timeNext.split('--');

		//alert(timeArr[1].split('.')[0] == timeNextArr[0].split('.')[0]);
		//alert(timeArr[1].split('.')[1].trim()==timeNextArr[0].split('.')[1].trim());

		if(timeArr[1].split('.')[0] == timeNextArr[0].split('.')[0] && timeArr[1].split('.')[1].trim()==timeNextArr[0].split('.')[1].trim()){

		}else{
			 //Ext.MessageBox.alert("提示框",time+"到"+timeNext+"处时间不连续");
			msg += time+"到"+timeNext+"处时间不连续"+"<br/>";
		}
	}
	if(msg==""){
		return;
	}
	Ext.MessageBox.alert("提示框",msg);
}

function setContent(){
	var a1701 = document.getElementById("a1701").value;

	//var pas = a1701.split(/\r|\n|\r\n/g);
	//console.log(a1701)
	//return
	
	var a1701Word="";
	try{
		a1701Word=realParent.document.getElementById('a1701Word').value;
	}catch(e){
		a1701Word="";
	}
	a1701 = a1701.replace(/\r/g,'').replace(/\n/g,'</p><p>');

	//console.log(a1701)
	ue.ready(function(){
		ue.setContent("<p>"+a1701+"</p>", false);
		ue.fireEvent("selectionchange");
		//ue.fireEvent("contentchange");
        if(window.frames["ueditor_0"].document==undefined?false:true){
            var ps=window.frames["ueditor_0"].document.getElementById("bodyContent").getElementsByTagName("p");
            //替换文本中所有中文分号为英文分号
            var a1701Words =a1701Word.replace(/；/g,";").split(";");
            for(var i=0;i<ps.length;i++){
                var p=ps[i];
                for(var j=0;j<a1701Words.length;j++){
                	if(a1701Words[j]!=""&a1701.indexOf(a1701Words[j])!=-1){
                		p.innerHTML=p.innerHTML.replace(new RegExp(a1701Words[j],"gm"),"<span style='color:red'>"+a1701Words[j]+"</span>");
                	}
                }
            }
        }
	},2);




	
	/* if(pas.length>0){
		ue.setContent(pas[0], false);

		for(var i=1;i<pas.length;i++){
			//console.log(pas[i])
			ue.setContent(pas[i], true);
		}
	}else{
		ue.setContent("", false);
		document.getElementById("editor").style.visibility = 'visible';
	} */
}

			function setJL_Highlight(keywords) {
				//var zb09Words = realParent.document.getElementById('zb09Words').value; //获取父页面的 zb09的值
				var a1701 = document.getElementById("a1701").value;
				a1701 = a1701.replace(/\r/g, '').replace(/\n/g, '</p><p>');
				ue.ready(function () {
					ue.setContent("<p>" + a1701 + "</p>", false);
					ue.fireEvent("selectionchange");
					if (window.frames["ueditor_0"].document == undefined ? false : true) {
						var ps = window.frames["ueditor_0"].document.getElementById("bodyContent").getElementsByTagName("p");
						for (var i = 0; i < ps.length; i++) {
							var p = ps[i];
							var strs = []; //定义一数组
							strs = keywords.split(","); //字符分割
							for (j = 0; j < strs.length; j++) {
								if (strs[j] != "" & a1701.indexOf(strs[j]) != -1) {

									p.innerHTML = p.innerHTML.replace(new RegExp(strs[j], "gm"), "<span style='color:red'>" + strs[j] +
											"</span>");
								}

							}
						}
					}
				}, 2);

			}

ue.addListener('blur',function(a,b,c){
	document.getElementById("a1701").value = ue.getPlainTxt().trim();
});

ue.addListener('beforepaste', myEditor_paste);
function myEditor_paste(o, html) {//alert();
    //html.html = "";
   // alert("只能录入不能粘贴");
   //console.log(html)
  // console.log(o)
}




Ext.onReady(function(){

	genResume();
});
/**
 * 自动生成简历
 */
function genResume(){
	ajaxSubmit('genResume');
	document.getElementById("contenttext").value=document.getElementById("a1701").value.trim().replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/<\/?[^>]*>/g,'');

}

//页面关闭时，提示
/* var win = parent.Ext.getCmp('personInfoOP');
win.un("beforeClose",parent.beforeClosefn);
parent.beforeClosefn=function(){

	ajaxSubmit('isChange',null);
	return false;
}
win.on("beforeClose",parent.beforeClosefn);  */


/* function tishi(){
	$h.confirm3btn('系统提示','当前信息已经修改,是否需要保存',null,function(iid){
		if(iid=='yes'){

			//对数据进行保存
			savePerson(1,2,null);

			//关闭当前窗口
			win.hide(null, function(){
				win.fireEvent('close', win);
				win.destroy();
            }, win);

		}else if(iid=='no'){

			//关闭当前窗口
			win.hide(null, function(){
				win.fireEvent('close', win);
				win.destroy();
            }, win);


		}else if(iid=='cancel'){
			return false;
		}

		});
}

function gb(){
	win.hide(null, function(){
		win.fireEvent('close', win);
		win.destroy();
    }, win);


}
 */

/* window.onbeforeunload=function(){
	//ajaxSubmit('isChange',null);
	//radow.doEvent("close");
	return "关闭任免表前，请先保存数据！";
} */



//tab
$(document).ready(function () {
    $(document).bind('keydown', function (event) {
        if (event.keyCode == 9) {
            //document.body.focus();
        	//return true;
        	changeNextItem(event.srcElement.id)
        }
    });
});

function changeNextItem(id){
	if(id==""||id=="ui-id-1"){
		document.getElementById("out_a0101").style.display = "none";
		$("#a0101").show();
	} else if(id=="a0101"){
		document.getElementById("a0104Text").click();
	} else if(id=="a0104Text"){//性别
		$("#a0107").show();
		/* $("#a0107").focus(); */
		document.getElementById("out_a0107").style.display = "none";
		document.getElementById("a0104Menu").style.display = "none";
	}else if(id=="a0107"){//出生年月
		document.getElementById("a0117Text").click();
	}else if(id=="a0117Text"){//民族
		$("#div_a0107").show();
		$("#out_a0111").hide();
		$("#comboxArea_a0111").show();
		/* $("#comboxArea_a0111").focus(); */
		document.getElementById("a0117Menu").style.display = "none";
	}else if(id=="comboxArea_a0111"){//籍贯
		document.getElementById("out_a0114").style.display = "none";
		$("#a0117Text").show();
		/* $("#a0117Text").focus();  */
		$("#comboxArea_a0114").show();
		document.getElementById("comboxArea_a0114").click();
	}else if(id=="comboxArea_a0114"){//出生地
		document.getElementById("out_a0140").style.display = "none";
		$("#a0140").show();
	}else if(id=="a0140"){//入党时间
		$("#div_a0114").show();
		$("#a0134").show();
		document.getElementById("out_a0134").style.display = "none";
	}else if(id=="a0134"){//参加工作
		$("#a0196").show();
		document.getElementById("out_a0196").style.display = "none";
		document.getElementById("a0128Text").click();
	}else if(id=="a0128Text"){//健康
		$("#div_a0134").show();
		document.getElementById("a0128Menu").style.display = "none";
		/* $("#a0196").focus();  */
	}else if(id=="a0196"){//专业技术服务
		$("#a0187a").show();
		document.getElementById("out_a0187a").style.display = "none";
	}else if(id=="a15z101"){
		document.getElementById("a3604a_bText").click();//称谓
	}else if(id=="a3604a_bText"){//称谓id
		document.getElementById("a3604a_bMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_b").show();//显示姓名text
		document.getElementById("out_a3601_b").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_b"){//姓名id
		$("#a3684_b").show();//显示身份证text
		document.getElementById("out_a3684_b").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_b"){//身份证
		$("#a3607_b").show();//显示出生日期text
		document.getElementById("out_a3607_b").style.display = "none";//隐藏出生div
	}else if(id=="a3607_b"){//
		document.getElementById("a3627_bText").click();
	}else if(id=="a3627_bText") {
		$("#a3611_b").show();//显示出生日期text
		document.getElementById("a3627_bMenu").style.display = "none";
		document.getElementById("out_a3611_b").style.display = "none";
	}else if(id=="a3611_b"){
		document.getElementById("a3604a_cText").click();//称谓
	}else if(id=="a3604a_cText"){//称谓id
		document.getElementById("a3604a_cMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_c").show();//显示姓名text
		document.getElementById("out_a3601_c").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_c"){//姓名id
		$("#a3684_c").show();//显示身份证text
		document.getElementById("out_a3684_c").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_c"){//身份证
		$("#a3607_c").show();//显示出生日期text
		document.getElementById("out_a3607_c").style.display = "none";//隐藏出生div
	}else if(id=="a3607_c"){//
		document.getElementById("a3627_cText").click();
	}else if(id=="a3627_cText") {
		$("#a3611_c").show();//显示出生日期text
		document.getElementById("a3627_cMenu").style.display = "none";
		document.getElementById("out_a3611_c").style.display = "none";
	}else if(id=="a3611_c"){
		document.getElementById("a3604a_dText").click();//称谓
	}else if(id=="a3604a_dText"){//称谓id
		document.getElementById("a3604a_dMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_d").show();//显示姓名text
		document.getElementById("out_a3601_d").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_d"){//姓名id
		$("#a3684_d").show();//显示身份证text
		document.getElementById("out_a3684_d").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_d"){//身份证
		$("#a3607_d").show();//显示出生日期text
		document.getElementById("out_a3607_d").style.display = "none";//隐藏出生div
	}else if(id=="a3607_d"){//
		document.getElementById("a3627_dText").click();
	}else if(id=="a3627_dText") {
		$("#a3611_d").show();//显示出生日期text
		document.getElementById("a3627_dMenu").style.display = "none";
		document.getElementById("out_a3611_d").style.display = "none";
	}else if(id=="a3611_d"){
		document.getElementById("a3604a_eText").click();//称谓
	}else if(id=="a3604a_eText"){//称谓id
		document.getElementById("a3604a_eMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_e").show();//显示姓名text
		document.getElementById("out_a3601_e").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_e"){//姓名id
		$("#a3684_e").show();//显示身份证text
		document.getElementById("out_a3684_e").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_e"){//身份证
		$("#a3607_e").show();//显示出生日期text
		document.getElementById("out_a3607_e").style.display = "none";//隐藏出生div
	}else if(id=="a3607_e"){//
		document.getElementById("a3627_eText").click();
	}else if(id=="a3627_eText") {
		$("#a3611_e").show();//显示出生日期text
		document.getElementById("a3627_eMenu").style.display = "none";
		document.getElementById("out_a3611_e").style.display = "none";
	}else if(id=="a3611_e"){
		document.getElementById("a3604a_fText").click();//称谓
	}else if(id=="a3604a_fText"){//称谓id
		document.getElementById("a3604a_fMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_f").show();//显示姓名text
		document.getElementById("out_a3601_f").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_f"){//姓名id
		$("#a3684_f").show();//显示身份证text
		document.getElementById("out_a3684_f").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_f"){//身份证
		$("#a3607_f").show();//显示出生日期text
		document.getElementById("out_a3607_f").style.display = "none";//隐藏出生div
	}else if(id=="a3607_f"){//
		document.getElementById("a3627_fText").click();
	}else if(id=="a3627_fText") {
		$("#a3611_f").show();//显示出生日期text
		document.getElementById("a3627_fMenu").style.display = "none";
		document.getElementById("out_a3611_f").style.display = "none";
	}else if(id=="a3611_f"){
		document.getElementById("a3604a_gText").click();//称谓
	}else if(id=="a3604a_gText"){//称谓id
		document.getElementById("a3604a_gMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_g").show();//显示姓名text
		document.getElementById("out_a3601_g").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_g"){//姓名id
		$("#a3684_g").show();//显示身份证text
		document.getElementById("out_a3684_g").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_g"){//身份证
		$("#a3607_g").show();//显示出生日期text
		document.getElementById("out_a3607_g").style.display = "none";//隐藏出生div
	}else if(id=="a3607_g"){//
		document.getElementById("a3627_gText").click();
	}else if(id=="a3627_gText") {
		$("#a3611_g").show();//显示出生日期text
		document.getElementById("a3627_gMenu").style.display = "none";
		document.getElementById("out_a3611_g").style.display = "none";
	}else if(id=="a3611_g"){
		document.getElementById("a3604a_hText").click();//称谓
	}else if(id=="a3604a_hText"){//称谓id
		document.getElementById("a3604a_hMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_h").show();//显示姓名text
		document.getElementById("out_a3601_h").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_h"){//姓名id
		$("#a3684_h").show();//显示身份证text
		document.getElementById("out_a3684_h").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_h"){//身份证
		$("#a3607_h").show();//显示出生日期text
		document.getElementById("out_a3607_h").style.display = "none";//隐藏出生div
	}else if(id=="a3607_h"){//
		document.getElementById("a3627_hText").click();
	}else if(id=="a3627_hText") {
		$("#a3611_h").show();//显示出生日期text
		document.getElementById("a3627_hMenu").style.display = "none";
		document.getElementById("out_a3611_h").style.display = "none";
	}else if(id=="a3611_h"){
		document.getElementById("a3604a_iText").click();//称谓
	}else if(id=="a3604a_iText"){//称谓id
		document.getElementById("a3604a_iMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_i").show();//显示姓名text
		document.getElementById("out_a3601_i").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_i"){//姓名id
		$("#a3684_i").show();//显示身份证text
		document.getElementById("out_a3684_i").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_i"){//身份证
		$("#a3607_i").show();//显示出生日期text
		document.getElementById("out_a3607_i").style.display = "none";//隐藏出生div
	}else if(id=="a3607_i"){//
		document.getElementById("a3627_iText").click();
	}else if(id=="a3627_iText") {
		$("#a3611_i").show();//显示出生日期text
		document.getElementById("a3627_iMenu").style.display = "none";
		document.getElementById("out_a3611_i").style.display = "none";
	}else if(id=="a3611_i"){
		document.getElementById("a3604a_jText").click();//称谓
	}else if(id=="a3604a_jText"){//称谓id
		document.getElementById("a3604a_jMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_j").show();//显示姓名text
		document.getElementById("out_a3601_j").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_j"){//姓名id
		$("#a3684_j").show();//显示身份证text
		document.getElementById("out_a3684_j").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_j"){//身份证
		$("#a3607_j").show();//显示出生日期text
		document.getElementById("out_a3607_j").style.display = "none";//隐藏出生div
	}else if(id=="a3607_j"){//
		document.getElementById("a3627_jText").click();
	}else if(id=="a3627_jText") {
		$("#a3611_j").show();//显示出生日期text
		document.getElementById("a3627_jMenu").style.display = "none";
		document.getElementById("out_a3611_j").style.display = "none";
	}else if(id=="a3611_j"){
		document.getElementById("a3604a_kText").click();//称谓
	}else if(id=="a3604a_kText"){//称谓id
		document.getElementById("a3604a_kMenu").style.display = "none";//隐藏称谓下拉
		$("#a3601_k").show();//显示姓名text
		document.getElementById("out_a3601_k").style.display = "none";//隐藏姓名div
	}else if(id=="a3601_k"){//姓名id
		$("#a3684_k").show();//显示身份证text
		document.getElementById("out_a3684_k").style.display = "none";//隐藏身份证div
	}else if(id=="a3684_k"){//身份证
		$("#a3607_k").show();//显示出生日期text
		document.getElementById("out_a3607_k").style.display = "none";//隐藏出生div
	}else if(id=="a3607_k"){//
		document.getElementById("a3627_kText").click();
	}else if(id=="a3627_kText") {
		$("#a3611_k").show();//显示出生日期text
		document.getElementById("a3627_kMenu").style.display = "none";
		document.getElementById("out_a3611_k").style.display = "none";
	}
}



Ext.onReady(function(){

	//$("#comboxArea_a0221").after("<span class='right_qry_div'></span>");
		var a0215aWord="";
		try{
			a0215aWord=realParent.document.getElementById('a0215aWord').value;
		}catch(e){
			a0215aWord="";
		}
		var a0814Word="";
		try{
			a0814Word=realParent.document.getElementById('a0814Word').value;
		}catch(e){
			a0814Word="";
		}
		var qrzxlxx=$("#qrzxlxx_p").html();
		var qrzxwxx=$("#qrzxwxx_p").html();
		var zzxlxx=$("#zzxlxx_p").html();
		var zzxwxx=$("#zzxwxx_p").html();
		var a0192a=$('#a0192a_p').html();
		if(a0215aWord!=""){
			$('#a0192a_p').html(a0192a.replace(new RegExp(a0215aWord,"gm"),"<span style='color:red'>"+a0215aWord+"</span>"));
		}
		if(a0814Word!=""){
			  $("#qrzxlxx_p").html(qrzxlxx.replace(new RegExp(a0814Word,"gm"),"<span style='color:red'>"+a0814Word+"</span>"));
			  $("#zzxlxx_p").html(zzxlxx.replace(new RegExp(a0814Word,"gm"),"<span style='color:red'>"+a0814Word+"</span>"));
			  $("#qrzxwxx_p").html(qrzxwxx.replace(new RegExp(a0814Word,"gm"),"<span style='color:red'>"+a0814Word+"</span>"));
			  $("#zzxwxx_p").html(zzxwxx.replace(new RegExp(a0814Word,"gm"),"<span style='color:red'>"+a0814Word+"</span>"));
		}

});





//a01统计关系所在单位
function a0195onchange(a, b){

	var a0195 = document.getElementById("a0195").value;

	//radow.doEvent('a0195Change',a0195);
	ajaxSubmit('a0195Change',a0195);
}


Ext.onReady(function(){
	<%=setTitle%>
	/* document.title = window.dialogArguments.title+document.title; */
});


 var aCity = {
	 11: "北京",
	 12: "天津",
	 13: "河北",
	 14: "山西",
	 15: "内蒙古",
	 21: "辽宁",
	 22: "吉林",
	 23: "黑龙江",
	 31: "上海",
	 32: "江苏",
	 33: "浙江",
	 34: "安徽",
	 35: "福建",
	 36: "江西",
	 37: "山东",
	 41: "河南",
	 42: "湖北",
	 43: "湖南",
	 44: "广东",
	 45: "广西",
	 46: "海南",
	 50: "重庆",
	 51: "四川",
	 52: "贵州",
	 53: "云南",
	 54: "西藏",
	 61: "陕西",
	 62: "甘肃",
	 63: "青海",
	 64: "宁夏",
	 65: "新疆",
	 71: "台湾",
	 81: "香港",
	 82: "澳门",
	 91: "国外"
 };

 //身份证验证

 function isIdCard(sId) {

	 //将15位身份证号码转换为18位
	 var sId = changeFivteenToEighteen(sId);
	 //alert(sId);
	 var iSum = 0;
	 var info = "";
	 if (!/^\d{17}(\d|x)$/i.test(sId)) return "<font style='color:red'>您输入的身份证长度或格式错误</font>";
	sId=sId.replace(/x$/i,"a");
	if(aCity[parseInt(sId.substr(0,2))]==null) return "<font style='color:red'>您的身份证前两位地区非法！</font>";
	sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
	var d=new Date(sBirthday.replace(/-/g,"/")) ;
	if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "<font style='color:red'>身份证上的出生日期非法</font>";

	//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女");//此次还可以判断出输入的身份证号的人性别

	//验证性别
	//判断身份证倒数第二位是否和性别一致
	var sex = sId.substr((sId.length-2), 1);
	var a0104 = document.getElementById('a0104').value;		//性别

	var sexA0104 = sex%2;		//取余数

	if(sexA0104 == 0){
		sexA0104 = 2;
	}

	if(sexA0104 != a0104){
		return "<font style='color:red'>身份证号码倒数第二位数和性别不一致！</font>";
	}

	 for (var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
	 if (iSum % 11 != 1) return "<font style='color:red'>您输入的身份证号非法</font>";

	 return true;
 }

 //将15位身份证号码转换为18位
 function changeFivteenToEighteen(obj) {
	 if (obj.length == '15') {
		 var arrInt = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
		 var arrCh = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
		 var cardTemp = 0, i;
		 obj = obj.substr(0, 6) + '19' + obj.substr(6, obj.length - 6);
		 for (i = 0; i < 17; i++) {
			 cardTemp += obj.substr(i, 1) * arrInt[i];
		 }
		 obj += arrCh[cardTemp % 11];
		 return obj;
	 }
	 return obj;
 }


var fieldsDisabled = <%=TableColInterface.getAllUpdateData(sign)%>;
var selectDisabled = <%=TableColInterface.getAllSelectData()%>;
var selectDisabled_in = <%=TableColInterface.getAllSelectData_in()%>;
<%-- var selectDisabledByTable = <%=TableColInterface.getSelectDataByTable("ATTRIBUTE")%>;  --%>

<%-- Ext.onReady(function(){
	if("ATTRIBUTE_attribute_all"==selectDisabledByTable){
fieldsDisabled		$("#ui-id-2").attr("winsrc","<%=request.getContextPath() %>/error/selectNoVisit.jsp");
	}
	//http://127.0.0.1:8080/hzb/error/notAllowVisit.jsp

	if("ATTRIBUTE_attribute_all"==selectDisabledByTable){
		$("#ui-id-2").hide();
	}else{
		$("#ui-id-2").show();
	}
	//对信息集明细的权限控制，是否可以维护
	$h.fieldsDisabled(fieldsDisabled);
	//对信息集明细的权限控制，是否可以查看
	//var imgdata = "<img height='100%' width='100%' src='<%=request.getContextPath()%>/image/quanxian1.png' />";
	var imgdata = "url(<%=request.getContextPath()%>/image/suo.jpg)";
	$h.selectDisabled(selectDisabled,imgdata);
}); --%>
$(document).ready( //定位这里

	    function(){
	        document.onkeydown = function()
	        {
	            var oEvent = window.event;
	            if (oEvent.keyCode == 86 && oEvent.ctrlKey) {
	            	CtrlV(getRow());
	            }
	        }
	    }
	);
function CtrlV (curRow){
	var call="";
	var name="";
	var birthday ="";
	var politicalStatus="";
	var job = "";

	var Fcontent = clipboardData.getData("Text");
	var Scontent = Fcontent.split("\n");
	var check = Scontent[0].split("\t");
	if (Trim(check[0]) != "称谓" || Trim(check[1]) != "姓名" || Trim(check[2]) != "出生日期" || Trim(check[3]) != "政治面貌" || Trim(check[4]) != "工作单位及职务") {
		//Ext.Msg.alert("系统提示","必须以<称谓、姓名、出生日期、政治面貌、工作单位及职务>为表头");
		return;
	}
	//tabSwitch('tabs', 'page', 2);
	var mycars = ["a3604a_", "a3601_", "a3607_", "a3627_", "a3611_", "a3684_"];
	for (var k = 1; k < Scontent.length - 1; k++) {
		var familyRowNum = curRow;//当前行号
		if (curRow > 10) {
			Ext.Msg.alert("系统提示", "粘贴数据大于11行，只取前10行数据！");
			break;
		}
		var newFamilyNum = changeABC(familyRowNum);
		alert(newFamilyNum);
		for (var i = 0; i < mycars.length; i++) {
			var text;
			if(i==0 || i==3){
				text = "setShowValue()";
			}
			if(i==1 ||  i==4){
				text = "onblur()";
			}
			if(i==2){
				text = "onSubstrblurEvent()";
			}
			document.getElementById(mycars[i]+newFamilyNum).value =Scontent[k].split("\t")[i];
			if(i!=5){
				eval(mycars[i]+newFamilyNum+text);
			}
		}
		document.getElementById('familyRowNum').value = curRow;
		curRow++;
	}
}
function Trim(str)
{
 return str.replace(/[\r\n]/g,"").replace(/(^\s*)|(\s*$)/g, "");
}
function getRow(){
	for(var k=1; k<11; k++){
		var s=changeABC(k);
		var a3604a=document.getElementById("a3604a_"+s).value;
		//alert(a3604a=="");
		var a3601=document.getElementById("a3601_"+s).value;
		var a3607=document.getElementById("a3607_"+s).value;

		var a3627 = document.getElementById("a3627_"+s).value;
		var a3611 = document.getElementById("a3611_"+s).value;
		if(a3604a=="" && a3601=="" && a3607=="" && a3627=="" && a3611==""){
			return k;
		}
	}
}

Ext.onReady(function() {
	$("#ZHGBrmb").css("visibility","visible");
	setTDHeight();
    /* setTimeout(function(){
        a1701Format();
	},1000); */

    Ext.getCmp('a0165_combo').on("select",function (){
    	document.getElementById("a0165").value=Ext.getCmp('a0165_combo').getCheckedValue();
    	});
	/* document.getElementById("ZHGBrmb").style.visibility="visiable"; */
});

</script>
<script type="text/javascript">
	$(window).resize(function(){
		//a1701Format();
		autoHeight();
	});

	function autoHeight() {
		var winHeight = 0;
		if (window.innerHeight)
			winHeight = window.innerHeight;
		else if ((document.body) && (document.body.clientHeight))
			winHeight = document.body.clientHeight;
		if (document.documentElement && document.documentElement.clientHeight)
			winHeight = document.documentElement.clientHeight;
		$("#rmbform").css("height", winHeight - 12 + "px");
		$(".main_div").css("height", winHeight - 12 + "px");
		$(".left_div").css("height", winHeight - 12 + "px");
		$("#ZHGBrmb").css("height", winHeight - 12 + "px");
		$(".hzdbInfo").css("height", winHeight - 44 + "px");
		
		/* var pageHeight = 0;
		var $page2 = $('#page2 table tr');
		$page2.each(function (i, item) {
			$page2 += $(this).height();
		});
		$('#page2').css("height", $page2 + "px"); */
		
		
	}

	autoHeight();
	//触发ifram刷新


	

</script>
<script src="js/slabel.js"></script>

</body>
</html>
