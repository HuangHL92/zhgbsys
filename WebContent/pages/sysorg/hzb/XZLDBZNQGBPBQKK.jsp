<%@page import="com.insigma.siis.local.pagemodel.sysorg.org.hzb.XZLDBZNQGBPBQKK"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<html lang="en">
<head>
<odin:head />
<odin:MDParam></odin:MDParam>
<odin:hidden property="docpath" />
<script src="<%=request.getContextPath()%>/basejs/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/basejs/helperUtil.js"></script>
<iframe  id="iframe_expBZYP" style="display: none;" src=""></iframe>
<%
String ctxPath = request.getContextPath(); 
String subWinId = request.getParameter("subWinId");
%>
<script type="text/javascript">
function ajaxSubmit(radowEvent,parm,callback){
  if(parm){
  }else{
    parm = {};
  }
  Ext.Ajax.request({
    method: 'POST',
    //form:'rmbform',
        async: true,
        params : parm,
        timeout :300000,//按毫秒计算
    url: "<%=request.getContextPath()%>/radowAction.do?method=doEvent&pageModel=pages.sysorg.org.hzb.ExpExcel&eventNames="+radowEvent,
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
          Ext.Msg.hide();
          Ext.Msg.alert('系统提示:',cfg.mainMessage);

        }else{
//           Ext.Msg.hide();
        }
      }else{
        //Ext.Msg.hide();

        /* if(cfg.mainMessage.indexOf("<br/>")>0){

          $h.alert('系统提示',cfg.mainMessage,null,380);
          return;
        } */

        if("操作成功！"!=cfg.mainMessage){
          Ext.Msg.hide();
          Ext.Msg.alert('系统提示:',cfg.mainMessage);
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
</script>
<script type="text/javascript">
var subWinId = '<%=subWinId%>';
var realParent = parent.Ext.getCmp(subWinId).initialConfig.thisWin;
var data = <%=XZLDBZNQGBPBQKK.expData()%>;
$(function(){
	//alert(data.length);
	var ROWID={};
	var hj1=0;
	var hj2=0;
	var hj3=0;
	var hj4=0;
	var hj5=0;
	var hj6=0;
	var hj7=0;
	var hj8=0;
	var hj9=0;
	var hj10=0;
	var hj11=0;
	var hj12=0;
	var hj13=0;
	var hj14=0;
	var hj15=0;
	var hj16=0;
	var hj17=0;
	var hj18=0;
	$.each(data, function (i,item) {
		//console.log(item['zzsp'])
		var tr = 
		$('<tr><td class="th3 textleft"></th><td class="th3"></td><td class="th3"></td><td class="th5"></td><td class="th5"></td><td class="th5"></td><td class="th5"></td><td class="th4"></td>'+
		'<td class="th4"></td><td class="th4"></td><td class="th4"></td><td class="th5"></td><td class="th6"></td><td class="th6"></td><td class="th4"></td>'+
			'<td class="th4"></td><td class="th5"></td><td class="th4"></td><td class="th4 borderRight"></td></tr>');
		var tds = $("td", tr);
		SetTDtext(tds[0],item["ssxq"]);
		SetTDtext(tds[1],item["wh"]);
		SetTDtext(tds[2],item["hdzs"]);
		SetTDtext(tds[3],item["xzzs"]);
		SetTDtext(tds[4],item["xxzz"]);
		SetTDtext(tds[5],item["ypzz35"]);
		SetTDtext(tds[6],item["ypsj35"]);
		SetTDtext(tds[7],item["spzz35"]);
		SetTDtext(tds[8],item["spsj35"]);
		SetTDtext(tds[9],item["zbzz35"]);
		SetTDtext(tds[10],item["zbsj35"]);
		SetTDtext(tds[11],item["ypzz30"]);
		SetTDtext(tds[12],item["spzz30"]);
		SetTDtext(tds[13],item["ypbz35"]);
		SetTDtext(tds[14],item["spbz35"]);
		SetTDtext(tds[15],item["zbbz35"]);
		SetTDtext(tds[16],item["ypbz30"]);
		SetTDtext(tds[17],item["spbz30"]);
		SetTDtext(tds[18],item["qpbz30"]);
		
		ROWID[i]=item["b0111"];
		$('#coordTable2').append(tr);
		hj1=hj1+parseInt(item["wh"]);
		hj2=hj2+parseInt(item["hdzs"]);
		hj3=hj3+parseInt(item["xzzs"]);
		hj4=hj4+parseInt(item["xxzz"]);
		hj5=hj5+parseInt(item["ypzz35"]);
		hj6=hj6+parseInt(item["ypsj35"]);
		hj7=hj7+parseInt(item["spzz35"]);
		hj8=hj8+parseInt(item["spsj35"]);
		
		hj9=hj9+parseInt(item["zbzz35"]);
		hj10=hj10+parseInt(item["zbsj35"]);
		hj11=hj11+parseInt(item["ypzz30"]);
		hj12=hj12+parseInt(item["spzz30"]);
		hj13=hj13+parseInt(item["ypbz35"]);
		hj14=hj14+parseInt(item["spbz35"]);
		hj15=hj15+parseInt(item["zbbz35"]);
		hj16=hj16+parseInt(item["ypbz30"]);
		hj17=hj17+parseInt(item["spbz30"]);
		hj18=hj18+parseInt(item["qpbz30"]);
	});
	document.getElementById("hj1").innerHTML=hj1;
	document.getElementById("hj2").innerHTML=hj2;
	document.getElementById("hj3").innerHTML=hj3;
	document.getElementById("hj4").innerHTML=hj4;
	
	document.getElementById("hj5").innerHTML=hj5;
	document.getElementById("hj6").innerHTML=hj6;
	hj7=Math.round(hj5*1000/hj2)/10+"%";
	hj8=Math.round(hj6*1000/hj2)/10+"%";
	document.getElementById("hj7").innerHTML=hj7;
	document.getElementById("hj8").innerHTML=hj8;
	document.getElementById("hj9").innerHTML=hj9;
	document.getElementById("hj10").innerHTML=hj10;
	document.getElementById("hj11").innerHTML=hj11;
	document.getElementById("hj12").innerHTML=hj12;
	document.getElementById("hj13").innerHTML=hj13; 
	document.getElementById("hj14").innerHTML=hj14;
	 hj15=Math.round(hj14*1000/hj2)/10+"%";
	document.getElementById("hj15").innerHTML=hj15;
	 //document.getElementById("hj15").innerHTML=hj15;
	 document.getElementById("hj16").innerHTML=hj16;
	 document.getElementById("hj17").innerHTML=hj17;
	 document.getElementById("hj18").innerHTML=hj18;
	/*$('td:nth-child(5),td:nth-child(6),td:nth-child(7)','#coordTable2 tr:gt(0)').each(function (i, item) {
        if($(this).text()<0){
        	$(this).addClass('colorLight');
        }
		
    });*/
	
	$('td:nth-child(4),td:nth-child(5),td:nth-child(8),td:nth-child(9),td:nth-child(13),td:nth-child(15),td:nth-child(18)','#coordTable2 tr').each(function (i, item) {
        $(this).addClass('pointer');
        $(this).on('click',function(){
        	var p = {maximizable:false,resizable:false};
        	p['colIndex'] = $(this).index();
        	//alert($(this).parent().index())
        	p['b0111'] = ROWID[$(this).parent().index()-1];
        	p['query_type']="XZLDBZNQGBPBQKK";
        	openMate(p);
        })
    });
});
function expExcel(){
	var dataArray = [];
	
	var tdEndArray = [];
	var trend = $("#selectable3 tr");
	$.each(trend,function(iend,itemend){
		var tdend = $("th",$(this));
		$.each(tdend,function (tiend, titemend){
			tdEndArray.push($(this).text());
	 		});
		if(tdEndArray.length>0){
	 		dataArray.push(tdEndArray);
	 	}
	});	
	
	var tr = $("#selectable2 tr");
	$.each(tr,function (i, item){
		var tdArray = [];
		var td = $("td",$(this));
	 	$.each(td,function (ti, titem){
	 		tdArray.push($(this).text());
	 		});
	 	if(tdArray.length>0){
	 		dataArray.push(tdArray);
	 	}
	});
	//alert(dataArray.length);
	if(dataArray.length>0){
	    ajaxSubmit('expExcel',{"dataArray":Ext.encode(dataArray),"excelname":"乡镇领导班子年轻干部配备情况"});
	}
}

function downloadByUUID(){
	var downloadUUID = document.getElementById('docpath').value;
	$('#iframe_expBZYP').attr('src','<%= request.getContextPath() %>/PublishFileServlet?method=downloadFile&uuid='+downloadUUID);
	return false
}

function openMate(p){///hzb_hz/WebContent/pages/sysorg/hzb/Mate.jsp
	$h.openWin('mateWin','pages.sysorg.org.hzb.Mate','人员列表',700,500,'','<%=request.getContextPath()%>',null,p,true);
}
function SetTDtext(td,v) {
  $(td).html((v==""||v==null||v=="null"||v=="0"||v=="0%"||v=="0.0%")?" ":v.replace(/\n/g,"<br/>"));
}
</script>
<style type="text/css">
.pointer{
	cursor: pointer;
}
.colorLight{
	color: red;
}
th{
	background: #CAE8EA ; 
	text-align: center;
	height: 50px;
}
th,td{
	border-left: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	font-family: 宋体;
	font-weight: normal;
	height: 50px;
}
td{
	text-align: center;
	height: 50px;
}
.textleft{
	text-align: center;
}
.title{
	font-family: 方正小标宋简体;
	font-size: 28px;
	font-weight: normal;
}
.borderRight{
	border-right: 1px solid #C1DAD7;
}
.borderTop{
	border-top: 1px solid #C1DAD7;
}
#selectable{
	margin-left:23px;
}
#selectable2{
	overflow-y:auto;
	height:315px;
	margin-left:23px;
}
#selectable3{
	overflow:auto 0;
	margin-left:23px;
}
table{
	width: 1140px;
}
.th1{width: 10%; text-align: center;}.th2{width: 9%;}.th3{width: 7%;}.th4{width: 5%;}.th5{width: 5%;}.th6{width: 5%;}
.th7{width: 12%;}.th8{width: 6%;}.th9{width: 6%;}.th10{width: 15%;}.th11{width: 6%;}
.th12{width: 27%;}.th13{width: 27%;}.th14{width: 27%;}
</style>
</head>
<body>

<div id="selectable">
	
	<table id="coordTable" cellspacing="0" width="100%" >
		<tr>
		    <td colspan="30" class="borderTop title borderRight">乡镇领导班子年轻干部配备情况</td>
		</tr>
		<tr>
			<th rowspan="3" class="th3">区县<br/>（市）</th>
			<th rowspan="3" class="th3">乡镇数</th>
			<th colspan="2" rowspan="3" class="th3">新核定的<br/>乡镇领导<br/>班子职数<br/>（交叉任<br/>职不重复<br/>计算）</th>
			<th rowspan="3" class="th5" style="border-right: 0px solid #C1DAD7;">实配<br/>领导<br/>班子<br/>成员<br/>总数</th>
			<th class="th5"  style="border-left: 0px solid #C1DAD7;">&nbsp;</th>
			<th colspan="12" class="th7">35岁以下（不满36岁）乡镇党政正职</th>
			<th colspan="3" class="th5">30岁以下（不满31岁）乡镇党政正职</th>
			<th colspan="3" class="th5">35岁以下（不满36岁）领导班子成员</th>
			<th colspan="4" class="th5">30岁以下（不满31岁）领导班子成员</th>
		</tr>
		<tr>
			<th rowspan="2" class="th5">党政正职</th>
		    <th colspan="4" style="border-bottom: 0px solid #C1DAD7;">应配数</th>
		    <th colspan="4" style="border-bottom: 0px solid #C1DAD7;">实配数</th>
		    <th colspan="4" style="border-bottom: 0px solid #C1DAD7;">占比</th>
		    <th colspan="2" rowspan='2' class="th5">应配数<br/>（一般应有1名<br/>）</th>
		    <th rowspan='2' class="th6">实配数</th>
		    <th rowspan='2' class="th6">应配数<br/>（要求一<br/>般达到<br/>30%）</th>
		    <th rowspan='2' class="th4">实配数</th>
		    <th rowspan='2' class="th4" >占比</th>
		    <th rowspan='2' class="th5">应配数<br/>（原则上每个<br/>乡镇要有<br/>1名）</th>
		    <th rowspan='2' class="th4">实配数</th>
		    <th rowspan='2' class="th4">缺配数</th>
		</tr>
		<tr>
		    <th colspan="2"  class="th5">正职<br/>（一般达到15%）</th>
		    <th colspan="2"  class="th5" style="border-top: 1px solid #C1DAD7;">书记<br/>（不少于1/3）</th>
		    <th colspan="2"  class="th4" >正职</th>
		    <th colspan="2"  class="th4" style="border-top: 1px solid #C1DAD7;">书记</th>
		    <th colspan="2"  class="th4" >正职</th>
		    <th colspan="2"  class="th4" style="border-top: 1px solid #C1DAD7;">书记</th>
		   
		</tr>
	</table>
</div>
<div id="selectable3">
	<table  cellspacing="0" width="100%" >
		<tr>
			<th  class="th3" >合计</th>
			<th id="hj1"  class="th3"></th>
			<th id="hj2"  class="th3"></th>
			<th id="hj3"  class="th5"></th>
			<th id="hj4"  class="th5"></th>
			<th id="hj5"  class="th4"></th>
			<th id="hj6"  class="th4"></th>
			<th id="hj7"  class="th4"></th>
			<th id="hj8"  class="th4"></th>
			<th id="hj9"  class="th5"></th>
			<th id="hj10"  class="th6"></th>
			<th id="hj11"  class="th6"></th>
			<th id="hj12"  class="th4"></th>
			<th id="hj13"  class="th4"></th>
			<th id="hj14"  class="th5"></th>
			<th id="hj15"  class="th4"></th>
			<th id="hj16"  class="th4"></th>
			<th id="hj17"  class="th4"></th>
			<th id="hj18"  class="th4"></th>
		</tr>
	</table>
</div>
<div  id="selectable2">
	<div>
	<table id="coordTable2" cellspacing="0" width="100%" >
		<tr>
			<!-- <th class="th1"></th><th class="th3"></th><th class="th1"></th><th class="th5"></th><th class="th5"></th><th class="th4"></th>
			<th class="th4"></th><th class="th4"></th><th class="th4"></th><th class="th5"></th><th class="th6"></th><th class="th6"></th>
			<th class="th4"></th><th class="th4"></th><th class="th5"></th><th class="th4"></th> -->
		</tr>
	</table>
	</div>
</div> 


<br/>
<div align="right"><img id="expSelect" onclick="expExcel()" src="<%=request.getContextPath()%>/images/tpbj/exp_excel.png" width="150px" 
style="cursor:pointer;margin-right:25px"/></div>
</body>
</html>