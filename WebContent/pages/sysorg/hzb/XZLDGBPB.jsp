<%@page import="com.insigma.siis.local.pagemodel.sysorg.org.hzb.XZLDGBPB"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<html lang="en">
<head>
<odin:head />
<odin:MDParam></odin:MDParam>
<odin:hidden property="docpath" />
<iframe  id="iframe_expBZYP" style="display: none;" src=""></iframe>
<script src="<%=request.getContextPath()%>/basejs/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/basejs/helperUtil.js"></script>

<%
String ctxPath = request.getContextPath(); 
String subWinId = request.getParameter("subWinId");
%>
<script type="text/javascript">
var subWinId = '<%=subWinId%>';
var realParent = parent.Ext.getCmp(subWinId).initialConfig.thisWin;
var data = <%=XZLDGBPB.expData()%>;
$(function(){
	//alert(data.length);
	var ROWID={};
	var xj1=0;var xj2=0;var xj3=0;var xj4=0;var xj5=0;var xj6=0;var xj7=0;var xj8=0;var xj9=0;var xj10=0;
	var xj11=0;var xj12=0;var xj13=0;var xj14=0;var xj15=0;var xj16=0;var xj17=0;var xj18=0;var xj19=0;var xj20=0;
	var xj21=0;var xj22=0;var xj23=0;var xj24=0;var xj25=0;var xj26=0;var xj27=0;var xj28=0;var xj29=0;var xj30=0;
	var xj31=0;var xj32=0;var xj33=0;var xj34=0;var xj35=0;var xj36=0;var xj37=0;var xj38=0;var xj39=0;var xj40=0;
	var xj41=0;var xj42=0;var xj43=0;var xj44=0;var xj45=0;var xj46=0;var xj47=0;var xj48=0;var xj49=0;var xj50=0;
	var xj51=0;var xj52=0;
	var hj1=0;var hj2=0;var hj3=0;var hj4=0;var hj5=0;var hj6=0;var hj7=0;var hj8=0;var hj9=0;var hj10=0;
	var hj11=0;var hj12=0;var hj13=0;var hj14=0;var hj15=0;var hj16=0;var hj17=0;var hj18=0;var hj19=0;var hj20=0;
	var hj21=0;var hj22=0;var hj23=0;var hj24=0;var hj25=0;var hj26=0;var hj27=0;var hj28=0;var hj29=0;var hj30=0;
	var hj31=0;var hj32=0;var hj33=0;var hj34=0;var hj35=0;var hj36=0;var hj37=0;var hj38=0;var hj39=0;var hj40=0;
	var hj41=0;var hj42=0;var hj43=0;var hj44=0;var hj45=0;var hj46=0;var hj47=0;var hj48=0;var hj49=0;var hj50=0;
	var hj51=0;
	var tval09=0;
	$.each(data, function (i,item) {
		//console.log(item['zzsp'])
		var tr = $('<tr><td class="textleft"></td>'
				+'<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
				+'<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
				+'<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
				+'<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
				+'<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
				+'<td class="borderRight"></td></tr>');
		var tds = $("td", tr);
		
		SetTDtext(tds[0],item["t00"]);SetTDtext(tds[1],item["t01"]);SetTDtext(tds[2],item["t02"]);
		tval09=parseInt(item["t01"])-parseInt(item["t02"]);
		SetTDtext(tds[3],(tval09).toString());
		if(tval09<0)
			tds[3].style.backgroundColor = 'red';
		SetTDtext(tds[4],item["t04"]);
		SetTDtext(tds[5],item["t05"]);SetTDtext(tds[6],item["t06"]);SetTDtext(tds[7],item["t07"]);SetTDtext(tds[8],item["t08"]);SetTDtext(tds[9],item["t09"]);
		SetTDtext(tds[10],item["t10"]);SetTDtext(tds[11],item["t11"]);SetTDtext(tds[12],item["t12"]);SetTDtext(tds[13],item["t13"]);SetTDtext(tds[14],item["t14"]);
		SetTDtext(tds[15],item["t15"]);SetTDtext(tds[16],item["t16"]);SetTDtext(tds[17],item["t17"]);SetTDtext(tds[18],item["t18"]);SetTDtext(tds[19],item["t19"]);
		SetTDtext(tds[20],item["t20"]);SetTDtext(tds[21],item["t21"]);SetTDtext(tds[22],item["t22"]);SetTDtext(tds[23],item["t23"]);SetTDtext(tds[24],item["t24"]);
		SetTDtext(tds[25],item["t25"]);SetTDtext(tds[26],item["t26"]);SetTDtext(tds[27],item["t27"]);SetTDtext(tds[28],item["t28"]);SetTDtext(tds[29],item["t29"]);
		SetTDtext(tds[30],item["t30"]);SetTDtext(tds[31],item["t31"]);SetTDtext(tds[32],item["t32"]);SetTDtext(tds[33],item["t33"]);SetTDtext(tds[34],item["t34"]);
		SetTDtext(tds[35],item["t35"]);SetTDtext(tds[36],item["t36"]);SetTDtext(tds[37],item["t37"]);SetTDtext(tds[38],item["t38"]);SetTDtext(tds[39],item["t39"]);
		SetTDtext(tds[40],item["t40"]);SetTDtext(tds[41],item["t41"]);SetTDtext(tds[42],item["t42"]);SetTDtext(tds[43],item["t43"]);SetTDtext(tds[44],item["t44"]);
		SetTDtext(tds[45],item["t45"]);SetTDtext(tds[46],item["t46"]);SetTDtext(tds[47],item["t47"]);SetTDtext(tds[48],item["t48"]);SetTDtext(tds[49],item["t49"]);
		SetTDtext(tds[50],item["t50"]);SetTDtext(tds[51],item["t51"]);
		ROWID[i]=item["t00"];
		$('#coordTable2').append(tr);
		
		hj1=hj1+parseInt(item["t01"]);hj2=hj2+parseInt(item["t02"]);hj3=hj3+parseInt((tval09).toString());hj5=hj5+parseInt(item["t05"]);hj6=hj6+parseInt(item["t06"]);
		hj7=hj7+parseInt(item["t07"]);hj8=hj8+parseInt(item["t08"]);hj9=hj9+parseInt(item["t09"]);hj10=hj10+parseInt(item["t10"]);hj11=hj11+parseInt(item["t11"]);
		hj12=hj12+parseInt(item["t12"]);hj13=hj13+parseInt(item["t13"]);hj14=hj14+parseInt(item["t14"]);hj15=hj15+parseInt(item["t15"]);hj16=hj16+parseInt(item["t16"]);
		hj17=hj17+parseInt(item["t17"]);hj18=hj18+parseInt(item["t18"]);hj19=hj19+parseInt(item["t19"]);hj20=hj20+parseInt(item["t20"]);hj21=hj21+parseInt(item["t21"]);
		hj22=hj22+parseInt(item["t22"]);hj23=hj23+parseInt(item["t23"]);hj24=hj24+parseInt(item["t24"]);hj25=hj25+parseInt(item["t25"]);hj26=hj26+parseInt(item["t26"]);
		hj27=hj27+parseInt(item["t27"]);hj28=hj28+parseInt(item["t28"]);hj29=hj29+parseInt(item["t29"]);hj30=hj30+parseInt(item["t30"]);hj31=hj31+parseInt(item["t31"]);
		hj32=hj32+parseInt(item["t32"]);hj33=hj33+parseInt(item["t33"]);hj34=hj34+parseInt(item["t34"]);hj35=hj35+parseInt(item["t35"]);hj36=hj36+parseInt(item["t36"]);
		hj37=hj37+parseInt(item["t37"]);hj39=hj39+parseInt(item["t39"]);hj41=hj41+parseInt(item["t41"]);hj43=hj43+parseInt(item["t43"]);
		hj44=hj44+parseInt(item["t44"]);hj45=hj45+parseInt(item["t45"]);hj46=hj46+parseInt(item["t46"]);hj47=hj47+parseInt(item["t47"]);hj48=hj48+parseInt(item["t48"]);
		hj49=hj49+parseInt(item["t49"]);hj50=hj50+parseInt(item["t50"]);hj51=hj51+parseInt(item["t51"]);
		
		
		if(item["t00"]=="正职" || item["t00"]=="副职" ){
			xj1=xj1+parseInt(item["t01"]);xj2=xj2+parseInt(item["t02"]);xj3=xj3+parseInt((tval09).toString());xj5=xj5+parseInt(item["t05"]);xj6=xj6+parseInt(item["t06"]);
			xj7=xj7+parseInt(item["t07"]);xj8=xj8+parseInt(item["t08"]);xj9=xj9+parseInt(item["t09"]);xj10=xj10+parseInt(item["t10"]);xj11=xj11+parseInt(item["t11"]);
			xj12=xj12+parseInt(item["t12"]);xj13=xj13+parseInt(item["t13"]);xj14=xj14+parseInt(item["t14"]);xj15=xj15+parseInt(item["t15"]);xj16=xj16+parseInt(item["t16"]);
			xj17=xj17+parseInt(item["t17"]);xj18=xj18+parseInt(item["t18"]);xj19=xj19+parseInt(item["t19"]);xj20=xj20+parseInt(item["t20"]);xj21=xj21+parseInt(item["t21"]);
			xj22=xj22+parseInt(item["t22"]);xj23=xj23+parseInt(item["t23"]);xj24=xj24+parseInt(item["t24"]);xj25=xj25+parseInt(item["t25"]);xj26=xj26+parseInt(item["t26"]);
			xj27=xj27+parseInt(item["t27"]);xj28=xj28+parseInt(item["t28"]);xj29=xj29+parseInt(item["t29"]);xj30=xj30+parseInt(item["t30"]);xj31=xj31+parseInt(item["t31"]);
			xj32=xj32+parseInt(item["t32"]);xj33=xj33+parseInt(item["t33"]);xj34=xj34+parseInt(item["t34"]);xj35=xj35+parseInt(item["t35"]);xj36=xj36+parseInt(item["t36"]);
			xj37=xj37+parseInt(item["t37"]);xj39=xj39+parseInt(item["t39"]);xj41=xj41+parseInt(item["t41"]);xj43=xj43+parseInt(item["t43"]);
			xj44=xj44+parseInt(item["t44"]);xj45=xj45+parseInt(item["t45"]);xj46=xj46+parseInt(item["t46"]);xj47=xj47+parseInt(item["t47"]);xj48=xj48+parseInt(item["t48"]);
			xj49=xj49+parseInt(item["t49"]);xj50=xj50+parseInt(item["t50"]);xj51=xj51+parseInt(item["t51"]);
			
		}
	});
	
	
	document.getElementById("hj1").innerHTML=isnull(hj1);document.getElementById("hj2").innerHTML=isnull(hj2);document.getElementById("hj3").innerHTML=isnull(hj3);document.getElementById("hj4").innerHTML=isnull(hj4);
	document.getElementById("hj6").innerHTML=isnull(hj6);document.getElementById("hj7").innerHTML=isnull(hj7);document.getElementById("hj8").innerHTML=isnull(hj8);
	document.getElementById("hj9").innerHTML=isnull(hj9);document.getElementById("hj10").innerHTML=isnull(hj10);document.getElementById("hj11").innerHTML=isnull(hj11);document.getElementById("hj12").innerHTML=isnull(hj12);
	document.getElementById("hj13").innerHTML=isnull(hj13);document.getElementById("hj14").innerHTML=isnull(hj14);document.getElementById("hj15").innerHTML=isnull(hj15);document.getElementById("hj16").innerHTML=isnull(hj16);  
	document.getElementById("hj17").innerHTML=isnull(hj17);document.getElementById("hj18").innerHTML=isnull(hj18);document.getElementById("hj19").innerHTML=isnull(hj19);document.getElementById("hj20").innerHTML=isnull(hj20);  
	document.getElementById("hj21").innerHTML=isnull(hj21);document.getElementById("hj22").innerHTML=isnull(hj22);document.getElementById("hj23").innerHTML=isnull(hj23);document.getElementById("hj24").innerHTML=isnull(hj24);  
	document.getElementById("hj25").innerHTML=isnull(hj25);document.getElementById("hj26").innerHTML=isnull(hj26);document.getElementById("hj27").innerHTML=isnull(hj27);document.getElementById("hj28").innerHTML=isnull(hj28);  
	document.getElementById("hj29").innerHTML=isnull(hj29);document.getElementById("hj30").innerHTML=isnull(hj30);document.getElementById("hj32").innerHTML=isnull(hj32);  
	document.getElementById("hj34").innerHTML=isnull(hj34);document.getElementById("hj35").innerHTML=isnull(hj35);document.getElementById("hj36").innerHTML=isnull(hj36);  
	document.getElementById("hj37").innerHTML=isnull(hj37);document.getElementById("hj39").innerHTML=isnull(hj39);document.getElementById("hj41").innerHTML=isnull(hj41);  
	document.getElementById("hj43").innerHTML=isnull(hj43);document.getElementById("hj44").innerHTML=isnull(hj44);
	document.getElementById("hj45").innerHTML=isnull(hj45);document.getElementById("hj46").innerHTML=isnull(hj46);document.getElementById("hj47").innerHTML=isnull(hj47);document.getElementById("hj48").innerHTML=isnull(hj48);
	document.getElementById("hj49").innerHTML=isnull(hj49);document.getElementById("hj50").innerHTML=isnull(hj50);document.getElementById("hj51").innerHTML=isnull(hj51);
	document.getElementById("hj31").innerHTML=isnull(hj31);
	document.getElementById("hj33").innerHTML=isnull(hj33);
	hj38=Math.round(hj37*1000/hj2)/10+"%";
	document.getElementById("hj38").innerHTML=isnull(hj38);
	hj40=Math.round(hj39*1000/hj2)/10+"%";
	document.getElementById("hj40").innerHTML=isnull(hj40);
	hj42=Math.round(hj41*1000/hj2)/10+"%";
	document.getElementById("hj42").innerHTML=isnull(hj42);
	
	
	
	document.getElementById("xj1").innerHTML=isnull(xj1);document.getElementById("xj2").innerHTML=isnull(xj2);document.getElementById("xj3").innerHTML=isnull(xj3);document.getElementById("xj4").innerHTML=isnull(xj4);
	document.getElementById("xj6").innerHTML=isnull(xj6);document.getElementById("xj7").innerHTML=isnull(xj7);document.getElementById("xj8").innerHTML=isnull(xj8);
	document.getElementById("xj9").innerHTML=isnull(xj9);document.getElementById("xj10").innerHTML=isnull(xj10);document.getElementById("xj11").innerHTML=isnull(xj11);document.getElementById("xj12").innerHTML=isnull(xj12);
	document.getElementById("xj13").innerHTML=isnull(xj13);document.getElementById("xj14").innerHTML=isnull(xj14);document.getElementById("xj15").innerHTML=isnull(xj15);document.getElementById("xj16").innerHTML=isnull(xj16);  
	document.getElementById("xj17").innerHTML=isnull(xj17);document.getElementById("xj18").innerHTML=isnull(xj18);document.getElementById("xj19").innerHTML=isnull(xj19);document.getElementById("xj20").innerHTML=isnull(xj20);  
	document.getElementById("xj21").innerHTML=isnull(xj21);document.getElementById("xj22").innerHTML=isnull(xj22);document.getElementById("xj23").innerHTML=isnull(xj23);document.getElementById("xj24").innerHTML=isnull(xj24);  
	document.getElementById("xj25").innerHTML=isnull(xj25);document.getElementById("xj26").innerHTML=isnull(xj26);document.getElementById("xj27").innerHTML=isnull(xj27);document.getElementById("xj28").innerHTML=isnull(xj28);  
	document.getElementById("xj29").innerHTML=isnull(xj29);document.getElementById("xj30").innerHTML=isnull(xj30);document.getElementById("xj32").innerHTML=isnull(xj32);  
	document.getElementById("xj34").innerHTML=isnull(xj34);document.getElementById("xj35").innerHTML=isnull(xj35);document.getElementById("xj36").innerHTML=isnull(xj36);  
	document.getElementById("xj37").innerHTML=isnull(xj37);document.getElementById("xj39").innerHTML=isnull(xj39);document.getElementById("xj41").innerHTML=isnull(xj41);  
	document.getElementById("xj43").innerHTML=isnull(xj43);document.getElementById("xj44").innerHTML=isnull(xj44);
	document.getElementById("xj45").innerHTML=isnull(xj45);document.getElementById("xj46").innerHTML=isnull(xj46);document.getElementById("xj47").innerHTML=isnull(xj47);document.getElementById("xj48").innerHTML=isnull(xj48);
	document.getElementById("xj49").innerHTML=isnull(xj49);document.getElementById("xj50").innerHTML=isnull(xj50);document.getElementById("xj51").innerHTML=isnull(xj51);
	document.getElementById("xj31").innerHTML=isnull(xj31);
	document.getElementById("xj33").innerHTML=isnull(xj33);
	xj38=Math.round(xj37*1000/xj2)/10+"%";
	document.getElementById("xj38").innerHTML=isnull(xj38);
	xj40=Math.round(xj39*1000/xj2)/10+"%";
	document.getElementById("xj40").innerHTML=isnull(xj40);
	xj42=Math.round(xj41*1000/xj2)/10+"%";
	document.getElementById("xj42").innerHTML=isnull(xj42);
	
	if(xj3<0)
		document.getElementById("xj3").style.backgroundColor = 'red';
	if(hj3<0)
		document.getElementById("hj3").style.backgroundColor = 'red'; 
	
	
	
	$('td:nth-child(3),td:nth-child(6),td:nth-child(7),td:nth-child(8),td:nth-child(9),td:nth-child(10),td:nth-child(11),'+
	'td:nth-child(12),td:nth-child(13),td:nth-child(14),td:nth-child(15),td:nth-child(16),td:nth-child(17),td:nth-child(19),td:nth-child(20),'+
	'td:nth-child(21),td:nth-child(22),td:nth-child(23),td:nth-child(24),td:nth-child(25),td:nth-child(26),td:nth-child(27),td:nth-child(28),td:nth-child(29),td:nth-child(30),'+
	'td:nth-child(31),td:nth-child(32),td:nth-child(33),td:nth-child(34),td:nth-child(35),td:nth-child(36),td:nth-child(37),td:nth-child(38),td:nth-child(40),'+	
	'td:nth-child(42),td:nth-child(44),td:nth-child(45),td:nth-child(46),td:nth-child(47),td:nth-child(48),td:nth-child(49),td:nth-child(50),td:nth-child(51),td:nth-child(52)','#coordTable2 tr:gt(0)').each(function (i, item) {
        $(this).addClass('pointer');
        $(this).on('click',function(){
        	var p = {maximizable:false,resizable:false};
        	p['colIndex'] = $(this).index();
        	//alert($(this).parent().index())
        	
        	p['b0111'] = ROWID[$(this).parent().index()-1];
        	p['query_type']="XZLDGBPB";
        	openMate(p);
        })
    });
});
function isnull(v){
	if(v==""||v==null||v=="null"||v=="0"||v=="0%"||v=="0.0%"){
		v="&nbsp";
	}
	return v;
}
function openMate(p){///hzb_hz/WebContent/pages/sysorg/hzb/Mate.jsp
	$h.openWin('mateWin','pages.sysorg.org.hzb.Mate','人员列表',720,540,'','<%=request.getContextPath()%>',null,p,true);
}
function SetTDtext(td,v) {
  $(td).html((v==""||v==null||v=="null"||v=="0"||v=="0%"||v=="0.0%")?" ":v.replace(/\n/g,"<br/>"));
}

function expExcel(){
	var dataArray = [];
	
	var trend = $("#selectable3 tr");
	$.each(trend,function(iend,itemend){
		var tdend = $("th",$(this));
		var tdEndArray = [];
		$.each(tdend,function (tiend, titemend){
			tdEndArray.push($(this).text());
	 		});
		if(tdEndArray.length>0){
	 		dataArray.push(tdEndArray);
	 	}
	});
	
	
	var tr = $("#selectable2 tr");
	selectable3
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
	    ajaxSubmit('expExcel',{"dataArray":Ext.encode(dataArray),"excelname":"乡镇领导干部配备情况统计分析表"});
	}
}

function downloadByUUID(){
	var downloadUUID = document.getElementById('docpath').value;
	$('#iframe_expBZYP').attr('src','<%= request.getContextPath() %>/PublishFileServlet?method=downloadFile&uuid='+downloadUUID);
	return false
}
</script>
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
}
th,td{
	border-left: 1px solid #000000;
	border-bottom: 1px solid #000000;
	font-family: 宋体;
	font-weight: normal;
	font-size: 14px;
}
td{
	text-align: center;
}
.textleft{
	text-align: center;
	height: 40px;
	width:60px;
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
	width: 2300px;
}
#selectable2{
	width:2300px;
	overflow:auto;
}
#selectable3{
width:2300px;
}
#selectable4{
	width:1200px;
	white-space:nowrap;
	overflow-x:auto;
}
table{
	width: 2300px;
}
.th1{width: 6%;}.th2{width: 3%;}.th3{width: 3%;}.th4{width: 2%;}.th5{width: 66%;}
.th6{width: 15%;}.th7{width: 5%;text-align: left;}.th8{width: 3%;}
.th14{width: 40px;}.th11{width:100px}.th18{width:50px}
</style>
</head>
<body>


<div id="selectable4">
	<div id="c">
	<table id="coordTable" cellspacing="0" width="100%" >
		<tr>
		    <td colspan="80" class="borderTop title borderRight">全市98个乡镇领导干部配备情况统计分析表</td>
		</tr>
		<tr>
			<th rowspan="3"  class="th11">区（县）市</th>
			<!-- <th rowspan="3" class="th2">单位数</th> -->
			<th rowspan="1" colspan="3" >领导班子职数配备</th>
			<th colspan="39" >年龄结构</th>
			<th rowspan="3" colspan="1" class="th14">女干部</th>
			<th rowspan="3" colspan="1" class="th14">党外干部</th>
			<th colspan="5"  >最高学历</th>
			<th colspan="2"  >全日制学历</th>
		</tr>
		<tr>
			
			<th rowspan="2" class="th18">核定职数</th>
		    <th rowspan="2" class="th18">实配</th>
		    <th rowspan="2" class="th18">缺配</th>
			
		    <th rowspan="2" class="th18">平均年龄</th>
		    <th rowspan="2" class="th14">61年生</th>
		    <th rowspan="2" class="th14">62年生</th>
		    <th rowspan="2" class="th14">63年生</th>
		    <th rowspan="2" class="th14">64年生</th>
		    <th rowspan="2" class="th14">65年生</th>
		    <th rowspan="2" class="th14">66年生</th>
		    <th rowspan="2" class="th14">67年生</th>
		    <th rowspan="2" class="th14">68年生</th>
		    <th rowspan="2" class="th14">69年生</th>
		    <th rowspan="2" class="th14">70年生</th>
		    <th rowspan="2" class="th14">71年生</th>
		    <th rowspan="2" class="th14">72年生</th>
		    <th rowspan="2" class="th14">73年生</th>
		    <th rowspan="2" class="th14">74年生</th>
		    <th rowspan="2" class="th14">75年生</th>
		    <th rowspan="2" class="th14">76年生</th>
		    <th rowspan="2" class="th14">77年生</th>
		    <th rowspan="2" class="th14">78年生</th>
		    <th rowspan="2" class="th14">79年生</th>
		    <th rowspan="2" class="th14">80后</th>
		    <th colspan="12" style="height: 20px;border-left: 1px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    <th rowspan="2" class="th14">40岁左右及以下</th>
		    <th colspan="1" style="height: 20px;border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    <th rowspan="2" class="th14">35岁左右及以下</th>
		    <th colspan="1" style="height: 20px;border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    <th rowspan="2" class="th14">30岁左右及以下</th>
		    <th colspan="1" style="height: 20px;border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    
		    <th rowspan="2" class="th14">大专及以下</th>
		    <th rowspan="2" class="th14">大学</th>
		    <th   style="border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    <th rowspan="2" class="th14">研究生</th>
		    <th   style="border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		    <th rowspan="2" class="th14">大学及以上</th>
		    <th  style="border-left: 0px solid #000000;border-bottom: 1px solid #000000;">&nbsp;</th>
		</tr>
		<tr>
			<th class="th14">80年生</th>
			<th class="th14">81年生</th>
			<th class="th14">82年生</th>
			<th class="th14">83年生</th>
			<th class="th14">84年生</th>
			<th class="th14">85年生</th>
			<th class="th14">86年生</th>
			<th class="th14">87年生</th>
			<th class="th14">88年生</th>
			<th class="th14">89年生</th>
			<th class="th14">90年生</th>
			<th class="th14">91后</th>
			
			<th class="th18">占比</th>
			<th class="th18">占比</th>
			<th class="th18">占比</th>
			
			<th class="th14">硕士</th>
			<th class="th14">博士</th>
			<th class="th14">研究生</th>
		</tr>
	</table>
	</div>
	<div id="selectable3">
	<table  cellspacing="0" width="100%" >
	 	<tr>
			<th  class="th11" style="height: 40px;">总合计</th>
			<th  id="hj1" class="th18"></th><th  id="hj2" class="th18"></th><th  id="hj3" class="th18"></th><th  id="hj4" class="th18"></th><th  id="hj5" class="th14"></th>
			<th  id="hj6" class="th14"></th><th  id="hj7" class="th14"></th><th  id="hj8" class="th14"></th><th  id="hj9" class="th14"></th><th  id="hj10" class="th14"></th>
			<th  id="hj11" class="th14"></th><th  id="hj12" class="th14"></th><th  id="hj13" class="th14"></th><th  id="hj14" class="th14"></th><th  id="hj15" class="th14"></th>
			<th  id="hj16" class="th14"></th><th  id="hj17" class="th14"></th><th  id="hj18" class="th14"></th><th  id="hj19" class="th14"></th><th  id="hj20" class="th14"></th>
			<th  id="hj21" class="th14"></th><th  id="hj22" class="th14"></th><th  id="hj23" class="th14"></th><th  id="hj24" class="th14"></th><th  id="hj25" class="th14"></th>
			<th  id="hj26" class="th14"></th><th  id="hj27" class="th14"></th><th  id="hj28" class="th14"></th><th  id="hj29" class="th14"></th><th  id="hj30" class="th14"></th>
			<th  id="hj31" class="th14"></th><th  id="hj32" class="th14"></th><th  id="hj33" class="th14"></th><th  id="hj34" class="th14"></th><th  id="hj35" class="th14"></th>
			<th  id="hj36" class="th14"></th><th  id="hj37" class="th14"></th><th  id="hj38" class="th18"></th><th  id="hj39" class="th14"></th><th  id="hj40" class="th18"></th>
			<th  id="hj41" class="th14"></th><th  id="hj42" class="th18"></th><th  id="hj43" class="th14"></th><th  id="hj44" class="th14"></th><th  id="hj45" class="th14"></th>
			<th  id="hj46" class="th14"></th><th  id="hj47" class="th14"></th><th  id="hj48" class="th14"></th><th  id="hj49" class="th14"></th><th  id="hj50" class="th14"></th>
			<th  id="hj51" class="th14"></th>
		</tr>
		<tr>
			<th  class="th11" style="height: 40px;">正副职小计</th>
			<th  id="xj1" class="th18"></th><th  id="xj2" class="th18"></th><th  id="xj3" class="th18"></th><th  id="xj4" class="th18"></th><th  id="xj5" class="th14"></th>
			<th  id="xj6" class="th14"></th><th  id="xj7" class="th14"></th><th  id="xj8" class="th14"></th><th  id="xj9" class="th14"></th><th  id="xj10" class="th14"></th>
			<th  id="xj11" class="th14"></th><th  id="xj12" class="th14"></th><th  id="xj13" class="th14"></th><th  id="xj14" class="th14"></th><th  id="xj15" class="th14"></th>
			<th  id="xj16" class="th14"></th><th  id="xj17" class="th14"></th><th  id="xj18" class="th14"></th><th  id="xj19" class="th14"></th><th  id="xj20" class="th14"></th>
			<th  id="xj21" class="th14"></th><th  id="xj22" class="th14"></th><th  id="xj23" class="th14"></th><th  id="xj24" class="th14"></th><th  id="xj25" class="th14"></th>
			<th  id="xj26" class="th14"></th><th  id="xj27" class="th14"></th><th  id="xj28" class="th14"></th><th  id="xj29" class="th14"></th><th  id="xj30" class="th14"></th>
			<th  id="xj31" class="th14"></th><th  id="xj32" class="th14"></th><th  id="xj33" class="th14"></th><th  id="xj34" class="th14"></th><th  id="xj35" class="th14"></th>
			<th  id="xj36" class="th14"></th><th  id="xj37" class="th14"></th><th  id="xj38" class="th18"></th><th  id="xj39" class="th14"></th><th  id="xj40" class="th18"></th>
			<th  id="xj41" class="th14"></th><th  id="xj42" class="th18"></th><th  id="xj43" class="th14"></th><th  id="xj44" class="th14"></th><th  id="xj45" class="th14"></th>
			<th  id="xj46" class="th14"></th><th  id="xj47" class="th14"></th><th  id="xj48" class="th14"></th><th  id="xj49" class="th14"></th><th  id="xj50" class="th14"></th>
			<th  id="xj51" class="th14"></th>
		</tr>
	</table>
	</div>
	<div  id="selectable2">
	
	<table id="coordTable2" cellspacing="0" width="100%" >
		<tr>
			<th class="th11"></th><th class="th18"></th><th class="th18"></th><th class="th18"></th><th class="th18"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th18"></th><th class="th14"></th>
			<th class="th18"></th><th class="th14"></th><th class="th18"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			<th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th><th class="th14"></th>
			
		</tr>
	</table>
	
</div>
</div>
<br/>
<br/>
<div align="right"><img id="expSelect" onclick="expExcel()" src="<%=request.getContextPath()%>/images/tpbj/exp_excel.png" width="150px" 
style="cursor:pointer;margin-right:8px"/></div>
	<!-- <tr>
			<th rowspan="5" class="th1">总体情况</th>
			<th class="th2">总计（不含市级领导）</th>
			<th rowspan="5" class="th3">131</th>
			<th id="A101" ></th><th id="A102" ></th><th id="A103" ></th><th id="A104" ></th><th id="A105" ></th><th id="A106" ></th></th><th id="A107" ></th><th id="A108" ></th><th id="A109" ></th><th id="A110" ></th>
			<th id="A111" ></th><th id="A112" ></th><th id="A113" ></th><th id="A114" ></th><th id="A115" ></th><th id="A116" ></th></th><th id="A117" ></th><th id="A118" ></th><th id="A119" ></th><th id="A120" ></th>
			<th id="A121" ></th><th id="A122" ></th><th id="A123" ></th><th id="A124" ></th><th id="A125" ></th><th id="A126" ></th></th><th id="A127" ></th><th id="A128" ></th><th id="A129" ></th><th id="A130" ></th>
			<th id="A131" ></th><th id="A132" ></th><th id="A133" ></th><th id="A134" ></th><th id="A135" ></th><th id="A136" ></th></th><th id="A137" ></th><th id="A138" ></th><th id="A139" ></th><th id="A140" ></th>
			<th id="A141" ></th><th id="A142" ></th>
		</tr>
		<tr>
			<th class="th2">正副职小计</th>
			<th id="A201" ></th><th id="A202" ></th><th id="A203" ></th><th id="A204" ></th><th id="A205" ></th><th id="A206" ></th></th><th id="A207" ></th><th id="A208" ></th><th id="A209" ></th><th id="A210" ></th>
			<th id="A211" ></th><th id="A212" ></th><th id="A213" ></th><th id="A214" ></th><th id="A215" ></th><th id="A216" ></th></th><th id="A217" ></th><th id="A218" ></th><th id="A219" ></th><th id="A220" ></th>
			<th id="A221" ></th><th id="A222" ></th><th id="A223" ></th><th id="A224" ></th><th id="A225" ></th><th id="A226" ></th></th><th id="A227" ></th><th id="A228" ></th><th id="A229" ></th><th id="A230" ></th>
			<th id="A231" ></th><th id="A232" ></th><th id="A233" ></th><th id="A234" ></th><th id="A235" ></th><th id="A236" ></th></th><th id="A237" ></th><th id="A238" ></th><th id="A239" ></th><th id="A240" ></th>
			<th id="A241" ></th><th id="A242" ></th>
		</tr> -->
<!-- <div  id="selectable2">
	<div>
	<table id="coordTable2" cellspacing="0" width="100%" >
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
			<th class="th4"></th>
			<th class="th5"></th>
		</tr>
		
	</table>
	</div>
</div>
<div id="selectable3">
	<table  cellspacing="0" width="100%" >
		<tr>
			<th  class="th6" >合计</th>
			<th id="hj1"  class="th2"></th>
			<th id="hj2"  class="th3"></th>
			<th id="hj3"  class="th4"></th>
			<th id="hj4"  class="th4"></th>
		</tr>
	</table>
</div>
 -->
</body>
</html>