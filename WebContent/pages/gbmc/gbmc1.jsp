<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK" %>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/gbmc/gbtp.css">

<html>
<head>
 <meta charset="utf-8">
 <script type="text/javascript">
	 $(document).ready(function () {
	     $("#BiaoTouTitle").html("干部名册"); 
	 }); 
	//增加表格
	function addNewTable(index,o){
		if (index>1){
	    	var coordTable_html = $("#coordTable1")[0].outerHTML; 
	    	coordTable_html = coordTable_html.replace("coordTable1","coordTable"+index);
	    	$("#coordTable_div").append(coordTable_html);
	    	$("#coordTable_div").append("<div id='br_"+index+"' class='noprint' style='text-align:center;valign:center' ><br><br><span>..........................................（第"+(index)+"页）..........................................</span><br><br></div>");	        	
		} else{ 
			$("#coordTable_div").append("<div id='br_"+index+"' class='noprint' style='text-align:center;valign:center' ><br><br><span>..........................................（第"+(index)+"页）..........................................</span><br><br></div>");
		} 
		var objTable = $("#coordTable"+index); 
		$(objTable).find("tr td").each(function(){
			SetTDtext(this,"","");
		});
		$.each(o,function (i, rowData){
			if (i==0){
		
				var firstTr = $(objTable).find("tr:eq(0)");
				var th1 = $(firstTr).find("th:eq(0)"); 
				SetTDtext(th1, rowData["a0201a"]);  //   单位
				$(th1).html(rowData["a0201a"]);
			}
			var tr = $(objTable).find("tr:eq("+(i+3)+")");
			var tds = $("td:nth-child(n+2)", tr);
	        SetTDtext(tds[0],"a0101", rowData["a0101"]);  //   姓名
	        SetTDtext(tds[1],"a0283g", rowData["a0283g"]);  //   现工作单位及职务全称
	        SetTDtext(tds[2],"a0104",rowData["a0104"]);  //   性别
	        SetTDtext(tds[3],"a0117", rowData["a0117"]);  //   民族
	        SetTDtext(tds[4],"a0111a", rowData["a0111a"]);  //   籍贯
	        SetTDtext(tds[5],"qrzxl", rowData["qrzxl"]);  //   最高全日制学历
	        SetTDtext(tds[6],"qrzxlxx", rowData["qrzxlxx"]);  //   院校系专业（最高全日制学历）
	        SetTDtext(tds[7],"zzxl", rowData["zzxl"]);  //   最高在职学历
	        SetTDtext(tds[8],"zzxlxx", rowData["zzxlxx"]);  //   院校系专业（最高在职学历）
            SetTDtext(tds[9],"a0107", rowData["a0107"]);  //   出生日期
            SetTDtext(tds[10],"a0134", rowData["a0134"]);  //   参加工作时间
            SetTDtext(tds[11],"a0140", rowData["a0140"]);  //   入党时间
            SetTDtext(tds[12],"a0243", rowData["a0243"]);  //   任现职时间
	        //如果任该职级时间为空则填入任现职务层次时间
	        if(rowData["a0192c"]=='')
	        	{
	        	 SetTDtext(tds[13],"a0192c", rowData["a0288"]);  //   任现职务层次时间
	        	}
	        else{
	        	SetTDtext(tds[13],"a0192c", rowData["a0192c"]);  //   任该职级时间
	        }
	        SetTDtext(tds[13],"a0192c", rowData["a0192c"]);  //   任该职级时间
	        SetTDtext(tds[14],"comments", rowData["comments"]);  //   最高学位，专业技术
		});		
		/*
        SetTDtext(tds[0], rowData["a0101"]);  //   姓名
        SetTDtext(tds[1], rowData["a0283g"]);  //   现工作单位及职务全称
        SetTDtext(tds[2], rowData["a0104"]);  //   性别
        SetTDtext(tds[3], rowData["a0117"]);  //   民族
        SetTDtext(tds[4], rowData["a0111a"]);  //   籍贯
        SetTDtext(tds[5], rowData["qrzxl"]);  //   最高全日制学历
        SetTDtext(tds[6], rowData["qrzxlxx"]);  //   院校系专业（最高全日制学历）
        SetTDtext(tds[7], rowData["zzxl"]);  //   最高在职学历
        SetTDtext(tds[8], rowData["zzxlxx"]);  //   院校系专业（最高在职学历）
        SetTDtext(tds[9], rowData["a0107"]);  //   出生日期
        SetTDtext(tds[10], rowData["a0144"]);  //   入党时间
        SetTDtext(tds[11], rowData["a0134"]);  //   参加工作时间
        SetTDtext(tds[12], rowData["a0288"]);  //   任现职务层次时间
        SetTDtext(tds[13], rowData["a0192c"]);  //   任该职级时间
        SetTDtext(tds[14], rowData["comments"]);  //   最高学位，专业技术*/
        
	}

  
    function printTable() {

        var tableToPrint = document.getElementById('coordTable');//将要被打印的表格
        var newWin = window.open("<%=request.getContextPath()%>/pages/gbmc/printpreview.jsp", 'newwindow', 'height=' + screen.height + ',width=' + screen.width + ',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');//新打开一个空窗口
 
    }
  
	/** 列宽如下：
	   6.63 +
       18.75 +
       2.88 + 
       2.88 +
       4.25 +
       6.63 +
       8.63 +
       6.63 +
       8.63 +       
       8.38 +
       8.38 +
       8.38 +
       8.38 +
       8.38 +
       6.63	**/
</script>

</head>
<body>
<table id="coordTable1" class="coordTable A3" style="WIDTH: 1380px" cellspacing="0" sizcache="26" sizset="0">
 <tbody sizcache="26" sizset="0">
 <tr>
  <th style="FONT-SIZE: 15pt; BORDER-TOP: medium none; FONT-FAMILY: 黑体; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; FONT-WEIGHT: 600; TEXT-ALIGN: left; BORDER-LEFT: medium none" colspan="15">&nbsp; </th>
 </tr>
 <tr id="insertadd">
  <th class="lign" style="WIDTH: 1%; DISPLAY: none" rowspan="2">序<br />号</th>
  <th class="lign aligh_sensc" style="FONT-SIZE: 11pt; WIDTH: 79px; PADDING-BOTTOM: 9px !important; PADDING-TOP: 9px !important; PADDING-LEFT: 9px !important; PADDING-RIGHT: 9px !important" rowspan="2">姓&nbsp;名 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 226px;text-align:center" rowspan="2">现任职务 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 35px" rowspan="2">性<br />别 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 35px" rowspan="2">民<br />族 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 51px" rowspan="2">籍贯 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important" colspan="2">全日制教育 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important" colspan="2">在职教育 </th>
  <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 101px" rowspan="2">出生<br />年月 </th>
     <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 104px;"  rowspan="2">参加工<br>作时间 </th>
     <th class="lign" style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 104px" rowspan="2">入党<br />时间 </th>
  <th style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 104px;" rowspan="2">任现职<br />时&nbsp;&nbsp;间 </th>
  <th style="FONT-SIZE: 11pt; HEIGHT: 50px !important; WIDTH: 104px;" rowspan="2">任现职<br />级时间 </th>
  <th class="lign aligh_sensc" style="FONT-SIZE: 11pt; WIDTH: 80px;" rowspan="2">备&nbsp;注 </th>
 </tr>
 <tr>
  <th class="lign" style="FONT-SIZE: 11pt; WIDTH: 79px; TEXT-ALIGN: center; ">学历 </th>
  <th class="lign" style="FONT-SIZE: 11pt; WIDTH: 104px;TEXT-ALIGN: center;  BACKGROUND-COLOR: white">毕业院校<br />及&nbsp;专&nbsp;业 </th>
  <th class="lign" style="FONT-SIZE: 11pt; WIDTH: 79px; TEXT-ALIGN: center;">学历 </th>
  <th class="lign" style="FONT-SIZE: 11pt; WIDTH: 104px; TEXT-ALIGN: center; BACKGROUND-COLOR: white">毕业院校<br />及&nbsp;专&nbsp;业 </th>
 </tr>
 <tr class="data" sizcache="17" sizset="0">
  <td class="rownum default_color aligh_sensc" style="DISPLAY: none" nodeindex="1">1</td>
  <td class="default_color " sizcache="16" sizset="0" nodeindex="2">
  </td>
  <td sizcache="16" sizset="1" nodeindex="3" style="text-align: left">
  </td>
  <td  sizcache="16" sizset="2" nodeindex="4">
  </td>
  <td  sizcache="16" sizset="3" nodeindex="5">
  </td>
  <td  sizcache="16" sizset="4" nodeindex="6">
  </td>
  <td class="align-center" sizcache="16" sizset="5" nodeindex="7">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="6" nodeindex="8" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="7" nodeindex="9">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="8" nodeindex="10" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="9" nodeindex="11">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="14" nodeindex="16">
  </td>
 </tr>
 <tr class="data" sizcache="17" sizset="15">
  <td class="rownum default_color aligh_sensc" style="DISPLAY: none" nodeindex="1">1</td>
  <td class="default_color " sizcache="16" sizset="0" nodeindex="2">
  </td>
  <td sizcache="16" sizset="1" nodeindex="3" style="text-align: left">
  </td>
  <td  sizcache="16" sizset="2" nodeindex="4">
  </td>
  <td  sizcache="16" sizset="3" nodeindex="5">
  </td>
  <td  sizcache="16" sizset="4" nodeindex="6">
  </td>
  <td class="align-center" sizcache="16" sizset="5" nodeindex="7">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="6" nodeindex="8" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="7" nodeindex="9">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="8" nodeindex="10" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="9" nodeindex="11">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="14" nodeindex="16">
  </td>
 </tr>
 <tr class="data" sizcache="17" sizset="30">
  <td class="rownum default_color aligh_sensc" style="DISPLAY: none" nodeindex="1">1</td>
  <td class="default_color " sizcache="16" sizset="0" nodeindex="2">
  </td>
  <td sizcache="16" sizset="1" nodeindex="3" style="text-align: left">
  </td>
  <td  sizcache="16" sizset="2" nodeindex="4">
  </td>
  <td  sizcache="16" sizset="3" nodeindex="5">
  </td>
  <td  sizcache="16" sizset="4" nodeindex="6">
  </td>
  <td class="align-center" sizcache="16" sizset="5" nodeindex="7">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="6" nodeindex="8" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="7" nodeindex="9">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="8" nodeindex="10" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="9" nodeindex="11">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="14" nodeindex="16">
  </td>
 </tr>
 <tr class="data" sizcache="17" sizset="45">
  <td class="rownum default_color aligh_sensc" style="DISPLAY: none" nodeindex="1">1</td>
  <td class="default_color " sizcache="16" sizset="0" nodeindex="2">
  </td>
  <td sizcache="16" sizset="1" nodeindex="3" style="text-align: left">
  </td>
  <td  sizcache="16" sizset="2" nodeindex="4">
  </td>
  <td  sizcache="16" sizset="3" nodeindex="5">
  </td>
  <td  sizcache="16" sizset="4" nodeindex="6">
  </td>
  <td class="align-center" sizcache="16" sizset="5" nodeindex="7">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="6" nodeindex="8" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="7" nodeindex="9">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="8" nodeindex="10" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="9" nodeindex="11">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="14" nodeindex="16">
  </td>
 </tr>
 <tr class="data" sizcache="17" sizset="45">
  <td class="rownum default_color aligh_sensc" style="DISPLAY: none" nodeindex="1">1</td>
  <td class="default_color " sizcache="16" sizset="0" nodeindex="2">
  </td>
  <td sizcache="16" sizset="1" nodeindex="3" style="text-align: left">
  </td>
  <td  sizcache="16" sizset="2" nodeindex="4">
  </td>
  <td  sizcache="16" sizset="3" nodeindex="5">
  </td>
  <td  sizcache="16" sizset="4" nodeindex="6">
  </td>
  <td class="align-center" sizcache="16" sizset="5" nodeindex="7">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="6" nodeindex="8" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="7" nodeindex="9">
  </td>
  <td style="TEXT-ALIGN: left" sizcache="16" sizset="8" nodeindex="10" WIDTH = "100px" >
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="9" nodeindex="11">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="10" nodeindex="12">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="11" nodeindex="13">
  </td>
  <td style="TEXT-ALIGN: center" sizcache="16" sizset="14" nodeindex="16">
  </td>
 </tr>
 <tr class="data" sizcache="17" sizset="60">
 </tr>

 </tbody>
</table>
</body>
</html>


