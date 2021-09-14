<%@page import="com.insigma.odin.framework.sys.manager.sysmanager.comm.entity.Sysopright"%>
<%@page import="java.util.List"%>
<%@page import="com.insigma.odin.framework.persistence.HBUtil"%>
<%@page import="com.insigma.siis.local.pagemodel.customquery.CommSQL"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%String ctxPath = request.getContextPath(); 
%>
<%@page import="com.insigma.siis.local.pagemodel.publicServantManage.FontConfigPageModel"%>
<%@page import="com.insigma.siis.local.pagemodel.sysmanager.ZWHZYQ_001_003.InfoComWindowPageModel"%>
<style>
<%=FontConfigPageModel.getFontConfig()%>
.inline{
display: inline;
}
.pl{
margin-left: 8px;
}
.savecls{
position: absolute;
left: 25px;
top: 20px;
z-index: 100000;
}
*html{
background-image:url(about:blank);
background-attachment:fixed;
}
#btnAdd{position: absolute;top:550px;left:400px;}
#btnSave{position: absolute;top:550px;left:450px;}
#btnCancel{position: absolute;top:550px;left:500px;}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/picCut/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="basejs/helperUtil.js"></script>
<script type="text/javascript" src="js/lengthValidator.js"></script>
<script type="text/javascript">

function deleteRowRenderer(value, params, record,rowIndex,colIndex,ds){
	var a0200 = record.data.a0200;
	/* if(realParent.buttonDisabled){
		return "删除";
	} */
	var fieldsDisabled = <%=InfoComWindowPageModel.getInfoData()%>;
	if(fieldsDisabled==''||fieldsDisabled==undefined){
		return "<a href=\"javascript:deleteRow2(&quot;"+a0200+"&quot;)\">删除</a>";
	}
	var datas = fieldsDisabled.toString().split(',');
	for(var i=0;i<datas.length;i++){
		if(datas[i]==("a0201a")||datas[i]==("a0201b")||datas[i]==("a0201d")||datas[i]==("a0201e")||datas[i]==("a0215a")||datas[i]==("a0219")||datas[i]==("a0223")||datas[i]==("a0225")||datas[i]==("a0243")||datas[i]==("a0245")||datas[i]==("a0247")||datas[i]==("a0251b")||datas[i]==("a0255")||datas[i]==("a0265")||datas[i]==("a0267")||datas[i]==("a0272")||datas[i]==("a0281")||datas[i]==("a0222")||datas[i]==("a0279")||datas[i]==("a0504")||datas[i]==("a0517")){
			  Ext.getCmp("WorkUnitsAddBtn").setDisabled(true);
			return "<u style=\"color:#D3D3D3\">删除</u>"; 
		}
		
	}
	return "<a href=\"javascript:deleteRow2(&quot;"+a0200+"&quot;)\">删除</a>";
	/* return "<a href=\"javascript:deleteRow2(&quot;"+a0200+"&quot;)\">删除</a>"; */
	
}
function deleteRow2(a0200){ 
	var gridSize = Ext.getCmp("WorkUnitsGrid").getStore().getCount();
	if(gridSize<=1){
		Ext.Msg.alert("系统提示","最后一条数据无法删除！");
		return;
	}
	Ext.Msg.confirm("系统提示","是否确认删除？",function(id) { 
		if("yes"==id){
			radow.doEvent('deleteRow',a0200);
		}else{
			return;
		}		
	});	
}

function deleteRow(){ 
	var sm = Ext.getCmp("WorkUnitsGrid").getSelectionModel();
	if(!sm.hasSelection()){
		Ext.Msg.alert("系统提示","请选择一行数据！");
		return;
	}
	var gridSize = Ext.getCmp("WorkUnitsGrid").getStore().getCount();
	if(gridSize<=1){
		Ext.Msg.alert("系统提示","最后一条数据无法删除！");
		return;
	}
	Ext.Msg.confirm("系统提示","是否确认删除？",function(id) { 
		if("yes"==id){
			radow.doEvent('deleteRow',sm.lastActive+'');
		}else{
			return;
		}		
	});	
}
Ext.onReady(function(){});
//工作单位职务输出设置
function a02checkBoxColClick(rowIndex,colIndex,dataIndex,gridName){
	/* if(realParent.buttonDisabled){
		return;
	} */
	
	var sr = getGridSelected(gridName);
	
	if(!sr){
		return;
	}
	radow.doEvent('workUnitsgridchecked',sr.data.a0200+","+sr.data.a0281);
}


function changeSelectData(item){
	var a0255f = Ext.getCmp("a0255_combo");
	var newStore = a0255f.getStore();
	newStore.removeAll();
	newStore.add(new Ext.data.Record(item.one));
	newStore.add(new Ext.data.Record(item.two));
	var keya0255 = document.getElementById("a0255").value;//alert(item.one.key+','+keya0255);
	if(item.one.key==keya0255){
		a0255f.setValue(item.one.value);
	}else if(keya0255==''){
		a0255f.setValue(item.one.value);
		document.getElementById("a0255").value=item.one.key;
	}else{
		a0255f.setValue(item.two.value);
		document.getElementById("a0255").value=item.two.key;
	}
}

var labelText={'a0255SpanId':['&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>任职状态','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>工作状态'],
			   'a0201bSpanId':['<font color="red">*</font>任职机构名称','<font color="red">*</font>工作机构名称'],
			   //'a0216aSpanId':['<font color="red">*</font>职务名称','<font color="red">*</font>岗位名称'],
			   'a0215aSpanId':['<font color="red">*</font>职务名称','<font color="red">*</font>岗位名称'],
			   //'a0215aSpanId':['职务名称代码','岗位名称代码'],
			   'a0221SpanId':['职务层次','岗位层次'],
			   'a0229SpanId':['分管（从事）工作','岗位工作'],
			   'a0243SpanId':['任职时间','工作开始']};
			   
function changeLabel(type){
	for(var key in labelText){
		document.getElementById(key).innerHTML=labelText[key][type];
	}
}		   
function a0222SelChangePage(record,index){//岗位类别onchange时，职务层次赋值为空 
	document.getElementById("a0221").value='';
	document.getElementById("a0221_combo").value='';
	a0221achange();
	a0222SelChange(record,index)
}	
function a0222SelChange(record,index){

	//岗位类别
	//var a0222 = record.data.key;
	var a0222 = document.getElementById("a0222").value;
	var a0201b = document.getElementById("a0201b").value;
	

	document.getElementById("codevalueparameter").value=a0222;
	
	if("01"==a0222){//班子成员
		//$h.selectShow('a0201d');
		selecteEnable('a0201d','0');
	}else{
		//$h.selectHide('a0201d');
		selecteDisable('a0201d');
	}
	
	if("01"==a0222||"99"==a0222){//公务员、参照管理人员岗位or其他
		//$h.selectShow('a0219');//职务类别
		//$h.selectShow('a0251');//职动类型
		///$h.selectShow('a0247');//选拔任用方式
		selecteEnable('a0219');//职务类别
		selecteEnable('a0251');//职动类型
		selecteWinEnable('a0247');//选拔任用方式
		//document.getElementById('yimian').style.display="block";
		document.getElementById('yimian').style.visibility="visible";
		//$h.textShow('a0288');//现任职务层次时间
		//$h.dateEnable('a0288');//现任职务层次时间
		
		
		
		changeSelectData({one:{key:'1',value:'在任'},two:{key:'0',value:'已免'}});
		changeLabel(0);
	}else if("02"==a0222||"03"==a0222){//事业单位管理岗位or事业单位专业技术岗位
		//$h.selectHide('a0219');//职务类别disabled
		selecteDisable('a0219');//职务类别disabled
		//$h.selectShow('a0251');//职动类型
		selecteEnable('a0251');//职动类型
		//$h.selectShow('a0247');//选拔任用方式
		selecteWinEnable('a0247');//选拔任用方式
		//document.getElementById('yimian').style.display="block";
		document.getElementById('yimian').style.visibility="visible";
		changeSelectData({one:{key:'1',value:'在任'},two:{key:'0',value:'已免'}});
		changeLabel(0);
		//$h.dateEnable('a0288');//现任职务层次时间
	}else if("04"==a0222||"05"==a0222||"06"==a0222||"07"==a0222){//机关技术工人岗位or机关普通工人岗位or事业单位技术工人岗位or事业单位普通工人岗位
		//$h.selectHide('a0219');//职务类别
		//$h.selectHide('a0251');//职动类型
		//$h.selectHide('a0247');//选拔任用方式
		selecteDisable('a0219');//职务类别
		selecteDisable('a0251');//职动类型
		selecteWinDisable('a0247');//选拔任用方式
		//document.getElementById('yimian').style.display="none";
		document.getElementById('yimian').style.visibility="hidden";
		//$h.textHide('a0288');//现任职务层次时间	
		//$h.dateDisable('a0288');//现任职务层次时间	
		changeSelectData({one:{key:'1',value:'在职'},two:{key:'0',value:'不在职'}});
		changeLabel(1);
	}else{
		//document.getElementById('yimian').style.display="none";
		document.getElementById('yimian').style.visibility="hidden";
	}
	a0255SelChange();
	//a0251change();	
}
function a0255SelChange(){
	var a0222 = document.getElementById("a0222").value;
	if("04"==a0222||"05"==a0222||"06"==a0222||"07"==a0222){//机关技术工人岗位or机关普通工人岗位or事业单位技术工人岗位or事业单位普通工人岗位
		return;
	}
	//该职务任职状态
	/* var a0255Value = document.getElementById("a0255").value;
	
	if("1"==a0255Value){//在任
		//document.getElementById('yimian').style.display="none";
		document.getElementById('yimian').style.visibility="hidden";
	}else if("0"==a0255Value){//以免
		//document.getElementById('yimian').style.display="block";
		document.getElementById('yimian').style.visibility="visible";
	} */
	//var a0255 = document.getElementByName('a0255').checked;
	
	var a0255 = $("input[name='a0255']:checked").val();
	if("1"==a0255){//在任
		document.getElementById('yimian').style.visibility="hidden";
	}else if("0"==a0255){//以免
		document.getElementById('yimian').style.visibility="visible";
	}
	
	document.getElementById('a0255').value = a0255;
	
}




function setA0215aValue(record,index){//职务简称
	Ext.getCmp('a0215a').setValue(record.data.value);
}
function setA0255Value(record,index){
	Ext.getCmp('a0255').setValue(record.data.key)
}
/* //a01统计关系所在单位
function setParentValue(record,index){
	document.getElementById('a0195key').value = record.data.key;
	document.getElementById('a0195value').value = record.data.value;
	
	var a0195 = document.getElementById("a0195").value;
	radow.doEvent('a0195Change',a0195);
	
	//console.log(record);
	
	//document.getElementById('a0195').value=record.data.key;
	
} */
function witherTwoYear(){
/*  	var check = '0';
	if($('#a0197').is(':checked')){
		check = '1';
	} */
	
	//realParent.document.getElementById('a0197').value=record.data.key;
}
//a01级别
function setParentA0120Value(record,index){
	realParent.document.getElementById('a0120').value=record.data.key;
}
//a01 基层工作年限
function setParentA0194Value(record,index){
	/* var year = Ext.getCmp('a0194_y').getValue(); 
	var month = Ext.getCmp('a0194_m').getValue();
	var y2m = 0,a0197obj = document.getElementById('a0197');
	if(year!=''){
		y2m = parseInt(year)*12;
		if(y2m>=24){
			a0197obj.checked=true;
		}else{
			a0197obj.checked=false;
		}
	}else{
		a0197obj.checked=false;
	}
	if(month!=''){
		if(parseInt(month)>11){
			return;
		}
		y2m = y2m + month;
	}
	realParent.document.getElementById('a0194').value=y2m;
	realParent.document.getElementById('a0197').value=a0197obj.checked?"1":"0";
	*/
}
//职务层次  职务级别 二选一
/* function a0221achange(){
	var a0221a = document.getElementById('a0221a').value;
	//var a0221 = document.getElementById('a0221').value;
	if((a0221a!=null&&a0221a!=''&&a0221!=null&&a0221!='')||(a0221a==''&&a0221=='')){
		//$h.selectShow('a0221');
		//$h.selectShow('a0221a');
		selecteWinEnable('a0221');
		selecteWinEnable('a0221a');
		return;
	}
	
	if(a0221a==null||a0221a==''){
		//selecteEnable('a0221');
		selecteWinEnable('a0221');
	}else{
		//$h.selectHide('a0221');
		selecteWinDisable('a0221');
		//document.getElementById('a0288SpanId').innerHTML='任现职务等级时间';
	}
} */
/* function a0221change(){
	var a0221 = document.getElementById('a0221').value;
	var a0221a = document.getElementById('a0221a').value;
	if(a0221a!=null&&a0221a!=''&&a0221!=null&&a0221!=''){
		//$h.selectShow('a0221');
		//$h.selectShow('a0221a');
		selecteWinEnable('a0221');
		selecteWinEnable('a0221a');
		return;
	}
	if(a0221==null||a0221==''){
		//$h.selectShow('a0221a');
		selecteWinEnable('a0221a');
	}else{
		//$h.selectHide('a0221a');
		selecteWinDisable('a0221a');
		document.getElementById('a0288SpanId').innerHTML='任现职务层次时间';
	}
} */
/* function onkeydownfn(id){
	if(id=='a0221a'){
		a0221achange();
	}else if(id=='a0221'){
		a0221change();
	}
} */
function a0201bChange(record){
	
	//任职结构类别 和 职务名称代码对应关系
	radow.doEvent('setZB08Code',record.data.key);
	
	//如果当前人员还没有“统计关系所在单位”，并且还是当前没有职务,则给“统计关系所在单位”赋值为任职机构 
	radow.doEvent("a0201bChange",record.data.key);
}
function a0251change(){//职动类型  破格晋升
	var a0251 = document.getElementById('a0251').value;
	var a0251bOBJ = document.getElementById('a0251b');
	var a0251bTD = document.getElementById('a0251bTD');
	if('26'==a0251){
		//a0251bOBJ.checked=false;
		//a0251bTD.style.visibility='visible';
		//a0251bOBJ.onclick=function(){return true;};
	}else if('27'==a0251){
		a0251bOBJ.checked=true;
		//a0251bTD.style.visibility='visible';
		//a0251bOBJ.onclick=function(){return false;};
	}else{
		//a0251bTD.style.visibility='hidden';
		//a0251bOBJ.checked=false;
	}
}
<%-- function setA0201eDisabled(){
	var a0201d = document.getElementById("a0201d").value;
	document.getElementById('a0201eSpanId').innerHTML='成员类别';
	if("0"==a0201d || ""==a0201d){
		document.getElementById("a0201e_combo").disabled=true;
		document.getElementById("a0201e_combo").style.backgroundColor="#EBEBE4";
		document.getElementById("a0201e_combo").style.backgroundImage="none";
		Ext.query("#a0201e_combo+img")[0].style.display="none";
		document.getElementById("a0201e").value="";
		document.getElementById("a0201e_combo").value="";
	}else if("1"==a0201d){
		document.getElementById("a0201e_combo").readOnly=false;
		document.getElementById("a0201e_combo").disabled=false;
		document.getElementById("a0201e_combo").style.backgroundColor="#fff";
		document.getElementById("a0201e_combo").style.backgroundImage="url(<%=ctxPath%>/commform/basejs/ext/resources/images/default/form/text-bg.gif)";
		Ext.query("#a0201e_combo+img")[0].style.display="block";
		if("1"==a0201d){
			document.getElementById('a0201eSpanId').innerHTML='<font color="red">*</font>成员类别';
		}
	}
} --%>


function setA0201eDisabled(){
	
	var a0201d = document.getElementById("a0201d").checked;
	document.getElementById('a0201eSpanId').innerHTML='成员类别';
	
	
	if(!a0201d){
		document.getElementById("a0201e_combo").disabled=true;
		document.getElementById("a0201e_combo").style.backgroundColor="#EBEBE4";
		document.getElementById("a0201e_combo").style.backgroundImage="none";
		Ext.query("#a0201e_combo+img")[0].style.display="none";
		document.getElementById("a0201e").value="";
		document.getElementById("a0201e_combo").value="";
	}else{
		document.getElementById("a0201e_combo").readOnly=false;
		document.getElementById("a0201e_combo").disabled=false;
		document.getElementById("a0201e_combo").style.backgroundColor="#fff";
		document.getElementById("a0201e_combo").style.backgroundImage="url(<%=ctxPath%>/commform/basejs/ext/resources/images/default/form/text-bg.gif)";
		Ext.query("#a0201e_combo+img")[0].style.display="block";
		if(a0201d){
			document.getElementById('a0201eSpanId').innerHTML='<font color="red">*</font>成员类别';
		}
	}
}

$(function(){
    $("#a0201d").change(function() {
    	setA0201eDisabled();
    });
}); 

</script>



<odin:hidden property="a0200" title="主键id" ></odin:hidden>
<odin:hidden property="a0255" title="任职状态" ></odin:hidden>
<odin:hidden property="a0225" title="成员内排序" value="0"></odin:hidden>
<odin:hidden property="a0223" title="多职务排序" ></odin:hidden>
<odin:hidden property="a0201c" title="机构简称" ></odin:hidden>
<odin:hidden property="codevalueparameter" title="职务层次和岗位类别的联动"/>
<odin:hidden property="ChangeValue" title="职务名称代码和单位类别的联动"/>
<odin:hidden property="a0271" value=''/>
<odin:hidden property="a0222" value=''/>
<%-- <odin:hidden property="a0195key" value=''/>
<odin:hidden property="a0195value" value=''/> --%>
<odin:hidden property="b0194Type" value=''/>
<odin:hidden property="a0192f" title="工作单位及职务全称对应的，任职时间" ></odin:hidden>
<table  style="width: 100%">
	<tr><div style="height: 10px"></div></tr>
    <tr>
    	<td >
    		<table>
    			<tr>
    				<tags:PublicTextIconEdit3 codetype="orgTreeJsonData" onchange="a0201bChange" label="任职机构" property="a0201b" defaultValue="" readonly="true"/>
    				
				</tr>
    			<tr  align="left">
    				<odin:textEdit property="a0201a" label="任职机构名称" required="true"></odin:textEdit>
    				<!-- <odin:select2 property="a0255" label="任职状态" required="true" onchange="a0255SelChange" value="1" codeType="ZB14"></odin:select2> -->
    				<td align="right"><span id="a0195SpanId_s" style="font-size: 12px;" class="fontConfig"><!-- <font color="red">*</font>任职状态&nbsp; --></span></td>
    				
				    <td align="left">
						<input align="middle" type="radio" name="a0255" id="a02551" checked="checked" value="1" class="radioItem" />
						<label for="a0255" style="font-size: 12px;">在任</label>
						<span>&nbsp;</span>
						<input align="middle" type="radio" name="a0255" id="a02550" value="0" class="radioItem"/>
						<label for="a0255" style="font-size: 12px;">已免</label>
					</td>
				</tr>
				<tr>
					<odin:textEdit property="a0215a" label="职务名称" required="true" maxlength="50"></odin:textEdit>
					<!-- <odin:select2 property="a0201d" label="是否班子成员" data="['1','是'],['0','否']" onchange="setA0201eDisabled"></odin:select2> -->
					
					<td></td>
					<td align="left" id="a0219TD">
						<input type="checkbox" name="a0279" id="a0279" />
						<label id="a0279SpanId" for="a0279" style="font-size: 12px;">主职务</label>
						<input type="checkbox" name="a0219" id="a0219" />
						<label id="a0219SpanId" for="a0219" style="font-size: 12px;">领导职务</label>
					</td>
				</tr>
				
				<tr align="left">
				    <odin:select2 property="a0201e" label="成员类别" codeType="ZB129"></odin:select2>
				    <td></td>
				    <td align="left" id="a0201dTD">
						<input type="checkbox" name="a0201d" id="a0201d"/>
						<label id="a0201dSpanId" for="a0201d" style="font-size: 12px;">领导成员</label>
					</td>
				</tr>
				<tr>
					<tags:PublicTextIconEdit3 property="a0247" label="选拔任用方式" codetype="ZB122" readonly="true"></tags:PublicTextIconEdit3>
					<td></td>
					<td align="left" id="a0251bTD">
						<input type="checkbox" name="a0251b" id="a0251b" />
						<label id="a0251bfSpanId" for="a0251b" style="font-size: 12px;">破格提拔</label>
					</td>
				</tr>
				<tr>
					<odin:NewDateEditTag property="a0243" labelSpanId="a0243SpanId" maxlength="8" label="任职时间" required="true"></odin:NewDateEditTag>
					<odin:textEdit property="a0245" label="任职文号" validator="a0245Length"></odin:textEdit>
				</tr>
				<tr align="left">
				    <odin:hidden property="a0221a" value="0"/> 
				</tr>
				<tr align="left" >
				    <odin:hidden property="a0229" value="0"/>
				    <odin:hidden property="a0251" value="0"/>
				</tr>
				
				
				<tr id='yimian'>
					<odin:NewDateEditTag property="a0265" label="免职时间" labelSpanId="a0265SpanId"  maxlength="8" required="true"></odin:NewDateEditTag>
					<odin:textEdit property="a0267" label="免职文号" validator="a0267Length"></odin:textEdit>
				</tr>
				
				<tr>
					<%-- <odin:textEdit property="a0272" label="职务变动原因综述"></odin:textEdit> --%>
					
					<odin:textarea property="a0272" label="职务变动原因综述" colspan='4' rows="4"></odin:textarea>
				</tr>
				<%
				String sql = CommSQL.getInfoSQL("'A02'");

				List<Object[]> list = HBUtil.getHBSession().createSQLQuery(sql).list();
				if(list.size()>0){
				%>
				<tr>
					<td><odin:button text="补充信息" property="SubInfo" handler="openSubWin"></odin:button></td>
				</tr>
				<%} %>
    		</table>
    	</td>
    	<td>
	    	<table width="410"><tr><td>
		    	<odin:editgrid property="WorkUnitsGrid" sm="row" isFirstLoadData="false" url="/" 
					 height="330" title="" pageSize="50"  >
						<odin:gridJsonDataModel  id="id" root="data" totalProperty="totalCount">
				     		<odin:gridDataCol name="a0281"/>
				     		<odin:gridDataCol name="a0200" />
					  		<odin:gridDataCol name="a0201b" />
					  		<odin:gridDataCol name="a0201a" />
					  		<%-- <odin:gridDataCol name="a0215a" /> --%>
					  		<odin:gridDataCol name="a0215a" />
					  		<odin:gridDataCol name="a0222" />
					   		<odin:gridDataCol name="a0255" isLast="true"/>
					   		
						</odin:gridJsonDataModel>
						<odin:gridColumnModel>
						  <odin:gridRowNumColumn />
						  <odin:gridEditColumn2 header="输出" width="60" editor="checkbox" dataIndex="a0281" edited="true"/><%-- checkBoxClick="a02checkBoxColClick" --%> 
						  <odin:gridEditColumn2 header="id" edited="false" dataIndex="a0200" editor="text" hidden="true"/>
						  <odin:gridEditColumn2 header="任职机构代码" edited="false"  dataIndex="a0201b"  editor="text" hidden="true"/>
						  <odin:gridEditColumn2 header="任职机构" edited="false" dataIndex="a0201a" renderer="changea0201a" editor="text" width="100" />
						  <%-- <odin:gridEditColumn2 header="职务名称代码" edited="false"  dataIndex="a0215a" editor="select" codeType="ZB08" hidden="true" width="100"/> --%>
						  <odin:gridEditColumn2 header="职务名称" edited="false"  dataIndex="a0215a" editor="text" width="80"/>
						  <odin:gridEditColumn2 header="岗位类别" edited="false"  dataIndex="a0222" editor="text" hidden="true" width="80"/>
						  <odin:gridEditColumn2 header="任职状态" edited="false" dataIndex="a0255"  codeType="ZB14" editor="select" width="80"/>
						  <odin:gridEditColumn header="操作" width="60" dataIndex="delete" editor="text" edited="false" renderer="deleteRowRenderer" isLast="true"/>

					</odin:gridColumnModel>
				</odin:editgrid>
				<label><input type="checkbox" checked="checked" id="xsymzw" onclick="checkChange(this)"/><font style="font-size: 12px;">显示已免职务</font></label>
				<div id="btngroup"> </div>
				<div style="margin-top: 8px;" id="btngroup2"> </div>
				</td>
			</tr>
		</table>
    	</td>
    </tr>
    <tr align="left">
		<td colspan="2">
			<odin:groupBox title="自动生成区域" property="zd">
				<table>
					<tr>
						<odin:textEdit property="a0192a" width="550" label="全称"  maxlength="1000"><span>&nbsp;&nbsp;(用于任免表)</span></odin:textEdit>
						<td rowspan="2"><odin:button text="更新名称" property="UpdateTitleBtn" ></odin:button></td>
					</tr>
					<tr>
				       <odin:textEdit property="a0192" width="550" label="简称"  maxlength="1000"><span>&nbsp;&nbsp;(用于名册)</span></odin:textEdit>
				    </tr>	
				</table>
			</odin:groupBox>
		</td>
	</tr>
</table>
<div id='btnAdd'>
<odin:button text="新&nbsp;&nbsp;增" handler="AddBtn"></odin:button>
</div>
<div id='btnSave'>
<odin:button text="保&nbsp;&nbsp;存" handler="saveA02"></odin:button>
</div>
<div id='btnCancel'>
<odin:button text="取&nbsp;&nbsp;消" handler="Cancel"></odin:button>
</div>


<odin:hidden property="a0281" title="输出设置"/>
<odin:hidden property="a0000" title="人员主键"/>
<script type="text/javascript">
function AddBtn(){
	radow.doEvent('WorkUnitsAddBtn.onclick');
}

function openSubWin(){
	var a0200 = document.getElementById('a0200').value;
	if(a0200==null||a0200==''){
		$h.alert('系统提示：','请先保存职务信息!');
		return;
	}
	$h.openPageModeWin('openSubWin','pages.publicServantManage.WorkUnitsSubInfo','职务补充项',600,400,document.getElementById('a0200').value,'<%=ctxPath%>')
}
Ext.onReady(function(){
	document.getElementById("a0000").value = window.parent.document.getElementById("a0000").value;
});
Ext.onReady(function(){
	setA0201eDisabled();
});
Ext.onReady(function(){
		new Ext.Button({
			icon : 'images/icon/arrowup.gif',
			id:'UpBtn',
		    text:'上移',
		    cls :'inline',
		    renderTo:"btngroup",
		    handler:UpBtn
		});
		new Ext.Button({
			icon : 'images/icon/arrowdown.gif',
			id:'DownBtn',
		    text:'下移',
		    cls :'inline pl',
		    renderTo:"btngroup",
		    handler:DownBtn
		});
		new Ext.Button({
			icon : 'images/icon/save.gif',
			id:'saveSortBtn',
		    text:'保存排序',
		    cls :'inline pl',
		    renderTo:"btngroup",
		    handler:function(){
				radow.doEvent('worksort');
		    }
		});
		new Ext.Button({
			icon : 'images/icon/save.gif',
			id:'sortUseTimeS',
		    text:'按任职时间排序',
		    cls :'inline pl',
		    renderTo:"btngroup",
		    handler:function(){
				radow.doEvent('sortUseTime');
		    }
		});
		
		/* new Ext.Button({
			icon : 'images/add.gif',
			id:'WorkUnitsAddBtn',
			cls :'inline',
		    text:'增加',
		    renderTo:"btngroup2"
		}); */
		
		/* new Ext.Button({
			icon : 'images/back.gif',
			id:'delete1',
		    text:'删除',
		    cls :'inline pl',
		    renderTo:"btngroup2",
		    handler:deleteRow
		}); */
		 
		/* new Ext.Button({
			icon : 'images/save.gif',
			id:'save1',
		    text:'保存',
		    width:80,
		    height:40,
		    renderTo:"btngroup3",
		    handler:saveA02
		}); */
		
	});
	function Cancel(){
		alert("demo");
		
	}
	
	
	
	//统计关系所在单位和任职机构名称提醒
	function saveA02(){
		document.getElementById("a0000").value = window.parent.frames["BaseAddPage_GB"].document.getElementById("a0000").value;
		var a0255 = document.getElementById('a0255').value;		//任职状态
		var a0201a = document.getElementById('a0201a').value;		//任职机构名称
		var a0201b = document.getElementById('a0201b').value;
		/* var a0195 = document.getElementById('a0195').value; */
		if(a0201b==""){
			Ext.Msg.alert("系统提示","请先点击图标进行任职机构的选择！");
			return;
		}
		
		if(a0201a==""){
			Ext.Msg.alert("系统提示","任职机构名称不能为空！");
			return;
		}
		
		//任职时间
		var a0243 = document.getElementById('a0243').value;	
		var a0243_1 = document.getElementById('a0243_1').value;	
		
		if(!a0243_1){
			$h.alert('系统提示','任职时间不能为空！', null,200);
			return false;
		}
		
		var text1 = dateValidateBeforeTady(a0243_1);
		if(a0243_1.indexOf(".") > 0){
			text1 = dateValidateBeforeTady(a0243);
		}
		if(text1!==true){
			$h.alert('系统提示','任职时间：' + text1, null,400);
			return false;
		}
		
		//免职时间
		var a0265 = document.getElementById('a0265').value;	
		var a0265_1 = document.getElementById('a0265_1').value;	
		
		//如果职务为以免，则免职时间不可为空
		if(a0255 != null && a0255 == 0){
			if(!a0265_1){
				$h.alert('系统提示','免职时间不能为空！', null,200);
				return false;
			}
		}
		
		
		
		var text2 = dateValidateBeforeTady(a0265_1);
		if(a0265_1.indexOf(".") > 0){
			text2 = dateValidateBeforeTady(a0265);
		}
		if(text2!==true){
			$h.alert('系统提示','免职时间：' + text2, null,400);
			return false;
		}
		
		//"职务变动原因综述"不可超过50字
		var a0272 = document.getElementById('a0272').value;	
		
		if(a0272.length > 50){
			Ext.Msg.alert("系统提示","职务变动原因综述不可超过50字！");
			return;
		}
		
		radow.doEvent('save');
	}
</script>
<script>

function changea0201a(value, params, record,rowIndex,colIndex,ds){
	if(record.data.a0201b=='-1'){
		return '<a title="'+value+'(机构外)">'+value+'(机构外)</a>';
	}else{
		return '<a title="'+value+'">'+value+'</a>';
	}	
}
function seta0255Value(value, params, record,rowIndex,colIndex,ds){
	var a0222 = record.data.a0222;
	var textValue = '';
	if("01"==a0222||"99"==a0222||"02"==a0222||"03"==a0222){
	   	textValue = getTextValue({one:{key:'1',value:'在任'},two:{key:'0',value:'已免'}},value);
	}else if("04"==a0222||"05"==a0222||"06"==a0222||"07"==a0222){//机关技术工人岗位or机关普通工人岗位or事业单位技术工人岗位or事业单位普通工人岗位
		textValue = getTextValue({one:{key:'1',value:'在职'},two:{key:'0',value:'不在职'}},value);
	}	
	return '<a title="'+textValue+'">'+textValue+'</a>';
}
function getTextValue(item,v){
	if(item.one.key==v){
		return item.one.value;
	}else{
		return item.two.value;
	}
}
function checkChange(){
	var checkbox = document.getElementById("xsymzw");
	var grid = Ext.getCmp("WorkUnitsGrid");
	var store = grid.getStore();
	var vibility;
	if(checkbox.checked){
		vibility = "block";
	}else{
		vibility = "none";
	}
	
	var len = store.data.length;
	for(var i=0;i<len;i++){
		var data = store.getAt(i).data;
		var a0255 = data.a0255;//任职状态
		if(a0255=='0'){
			grid.getView().getRow(i).style.display=vibility;
		}
	}
}

function UpBtn(){	
	var grid = odin.ext.getCmp('WorkUnitsGrid');
	
	var sm = grid.getSelectionModel().getSelections();
	var store = grid.store;
	//alert(store.getCount());
	
	if (sm.length<=0){
		
		$h.alert('系统提示：','请选中需要排序的职务！',null,180);
		return;	
	}
	
	var selectdata = sm[0];  //选中行中的第一行
	var index = store.indexOf(selectdata);
	if (index==0){
		
		$h.alert('系统提示：','该职务已经排在最顶上！',null,180);
		return;
	}
	
	store.remove(selectdata);  //移除
	store.insert(index-1, selectdata);  //插入到上一行前面
	
	grid.getSelectionModel().selectRow(index-1,true);  //选中上移动后的行	
	
	grid.getView().refresh();
}

function DownBtn(){	
	var grid = odin.ext.getCmp('WorkUnitsGrid');
	
	var sm = grid.getSelectionModel().getSelections();
	var store = grid.store;
	if (sm.length<=0){
		
		$h.alert('系统提示：','请选中需要排序的职务！',null,180);
		return;	
	}
	
	var selectdata = sm[0];  //选中行中的第一行
	var index = store.indexOf(selectdata);
	var total = store.getCount();
	if (index==(total-1) ){
		
		$h.alert('系统提示：','该职务已经排在最底下！',null,180);
		return;
	}
	
	store.remove(selectdata);  //移除
	store.insert(index+1, selectdata);  //插入到上一行前面
	
	grid.getSelectionModel().selectRow(index+1,true);  //选中上移动后的行	
	grid.view.refresh();
}

/* Ext.onReady(function(){
	while(true){
		try{
			setTimeout(geta0000,500);
			break;
		}catch(err){
			continue;
		}
	}
	
	
});
function geta0000(){
	document.getElementById("a0000").value = window.parent.frames["BaseAddPage_GB"].document.getElementById("a0000").value;
} */

Ext.onReady(function(){
	
	var pgrid = Ext.getCmp("WorkUnitsGrid");
	
	
	var bbar = pgrid.getBottomToolbar();
	/*bbar.insertButton(11,[
						new Ext.menu.Separator({cls:'xtb-sep'}),
						new Ext.Spacer({width:50}),
						new Ext.Button({
							icon : 'images/icon/arrowup.gif',
							id:'UpBtn',
						    text:'上移',
						    handler:UpBtn
						}),
						new Ext.Button({
							icon : 'images/icon/arrowdown.gif',
							id:'DownBtn',
						    text:'下移',
						    handler:DownBtn
						}),
						new Ext.Button({
							icon : 'images/icon/save.gif',
							id:'saveSortBtn',
						    text:'保存排序',
						    handler:function(){
								radow.doEvent('worksort');
						    }
						}),
						new Ext.Spacer({width:50}),
						new Ext.Button({
							icon : 'images/icon/save.gif',
							id:'sortUseTimeS',
						    text:'按任职时间排序',
						    handler:function(){
								radow.doEvent('sortUseTime');
						    }
						})]);
	
	*/
	
	
	
	var dstore = pgrid.getStore();
	var firstload = true;
	dstore.on({  
       load:{  
           fn:function(){  
             checkChange();
             if(firstload){
       		    $h.selectGridRow('WorkUnitsGrid',0);
       		    firstload = false;
             }
           }      
       },  
       scope:this      
   });  
   
   var ddrow = new Ext.dd.DropTarget(pgrid.container,{
		ddGroup : 'GridDD',
		copy : false,
		notifyDrop : function(dd,e,data){
			//选中了多少行
			var rows = data.selections;
			//拖动到第几行
			var index = dd.getDragData(e).rowIndex;
			if (typeof(index) == "undefined"){
				return;
			}
			//修改store
			for ( i=0; i<rows.length; i++){
				var rowData = rows[i];
				if (!this.copy) dstore.remove(rowData);
				dstore.insert(index, rowData);
			}
			pgrid.view.refresh();
			radow.doEvent('worksort');
		}
	});
   
   
/* document.getElementById('a01y').style.display='none';
document.getElementById('a01m').style.display='none'; 
document.getElementById('a0215aSpanId').parentNode.style.display='none';
Ext.getCmp('a0215a_combo').hide();*/
//document.body.scrollTop=document.getElementById('zhiwugroup').offsetTop;

});
/* if(!parent.Ext.getCmp('A01SortGrid')){
	newWin({id:'A01SortGrid',title:'集体内排序',modal:true,width:500,height:480,maximizable:true,parentWinObj:parent});
} */

/*
window.onscroll = function(){ 
    var t = document.documentElement.scrollTop || document.body.scrollTop; 
    var l = document.documentElement.scrollLeft || document.body.scrollLeft;   
    var save_div = document.getElementById( "btngroup3" ); 
    save_div.style.top = 385+t; 
    save_div.style.left = 830+l; 
} */

Ext.onReady(function(){
	$h.applyFontConfig($h.spFeildAll.a02);
	$h.applyFontConfig($h.spFeildAll.a01);
	//对信息集明细的权限控制，是否可以维护 
	/* $h.fieldsDisabled(realParent.fieldsDisabled); */
	Ext.getCmp('WorkUnitsGrid').setWidth(400);
	Ext.getCmp('WorkUnitsGrid').setHeight(250);
	
	document.getElementById('a0201bSpanId').innerHTML='<font color="red">*</font>任职机构';
	//document.getElementById('a0219SpanId').innerHTML='<font color="red">*</font>领导职务';
	
	
	//是否在任的联动 
	a0255SelChange();
	
	$(".radioItem").change(function() {
		var a0255 = $("input[name='a0255']:checked").val();
		if("1"==a0255){//在任
			document.getElementById('yimian').style.visibility="hidden";
		}else if("0"==a0255){//以免
			document.getElementById('yimian').style.visibility="visible";
		}
		document.getElementById('a0255').value = a0255;
	})
	
	//设置任职机构选择框宽度 
	document.getElementById('a0201b_combo').style.width="190px";
	document.getElementById('a0201a').style.width="207px";
});


function changea0201d(type){
	if(type == '1'){
		//document.getElementById('a0201dSpanId').innerHTML='<font color="red">*</font>领导成员';
	}
	if(type == '2'){
		document.getElementById('a0201dSpanId').innerHTML='领导成员';
		document.getElementById('a0201eSpanId').innerHTML='成员类别';
	}
}

Ext.onReady(function(){
	
   });  
   
   
   
odin.accCheckedForE3 = function(obj,rowIndex,colIndex,colName,gridId){
	<%
	  String data = InfoComWindowPageModel.getInfoData();
	  String info = "a02checkBoxColClick";
	  if(data==null||data.equals("")){
		  info = "a02checkBoxColClick";
	  }else{
		  data = data.replaceAll("'","");
		  String[] datas = data.split(",");
		  boolean flag = false;
		  for(String str:datas){
			  if(str.equals("a0201a")||str.equals("a0201b")||str.equals("a0201d")||str.equals("a0201e")||str.equals("a0215a")||str.equals("a0219")||str.equals("a0223")||str.equals("a0225")||str.equals("a0243")||str.equals("a0245")||str.equals("a0247")||str.equals("a0251b")||str.equals("a0255")||str.equals("a0265")||str.equals("a0267")||str.equals("a0272")||str.equals("a0281")||str.equals("a0222")||str.equals("a0279")||str.equals("a0504")||str.equals("a0517")){
				  info="-1";
				  break;
			  }
		  }
	  }
	  %>
	if(<%=info %>=='-1'){
		return;
	}
	if(obj.className=='x-grid3-check-col'){
		if (typeof(gridId)=='undefined'||(typeof(gridId)=='string'&&gridId == '')) {
			odin.checkboxds.getAt(rowIndex).set(colName, true);
		}else{
			odin.ext.getCmp(gridId).store.getAt(rowIndex).set(colName, true);
		}
		obj.className = 'x-grid3-check-col-on';
    }else{
		if (typeof(gridId)=='undefined'||(typeof(gridId)=='string'&&gridId == '')) {
			odin.checkboxds.getAt(rowIndex).set(colName, false);
		}else{
			odin.ext.getCmp(gridId).store.getAt(rowIndex).set(colName, false);
			if(document.getElementById("selectall_"+gridId+"_"+colName)!=null){
				document.getElementById("selectall_"+gridId+"_"+colName).value='false';
				document.getElementById("selectall_"+gridId+"_"+colName).className='x-grid3-check-col';
			}	
		}
		obj.className = 'x-grid3-check-col';
    }
	<%=info %>(rowIndex,colIndex,null,gridId);
	objs={'obj':obj};
	rowIndexs={'rowIndex':rowIndex};
	colIndexs={'colIndex':colIndex};
	colNames={'colName':colName};
	gridIds={'gridId':gridId};
	
}
function nosystem(){
	
}
var objs ={};
var rowIndexs ={};
var colIndexs ={};
var colNames ={};
var gridIds ={};
//解决一次操作box变化
function changebox(){
	var obj=objs.obj;
	var rowIndex=rowIndexs.rowIndex;
	var colIndex=colIndexs.colIndex;
	var colName=colNames.colName;
	var gridId=gridIds.gridId;
	if(obj.className=='x-grid3-check-col'){
		if (typeof(gridId)=='undefined'||(typeof(gridId)=='string'&&gridId == '')) {
			odin.checkboxds.getAt(rowIndex).set(colName, true);
		}else{
			odin.ext.getCmp(gridId).store.getAt(rowIndex).set(colName, true);
		}
		obj.className = 'x-grid3-check-col-on';
    }else{
		if (typeof(gridId)=='undefined'||(typeof(gridId)=='string'&&gridId == '')) {
			odin.checkboxds.getAt(rowIndex).set(colName, false);
		}else{
			odin.ext.getCmp(gridId).store.getAt(rowIndex).set(colName, false);
			if(document.getElementById("selectall_"+gridId+"_"+colName)!=null){
				document.getElementById("selectall_"+gridId+"_"+colName).value='false';
				document.getElementById("selectall_"+gridId+"_"+colName).className='x-grid3-check-col';
			}	
		}
		obj.className = 'x-grid3-check-col';
    }
}   
</script>

<div id="cover_wrap1"></div>
<div id="cover_wrap2"></div>
<div id="cover_wrap3"></div>
