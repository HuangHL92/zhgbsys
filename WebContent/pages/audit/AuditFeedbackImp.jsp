<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="com.insigma.siis.local.pagemodel.sysorg.org.SysOrgPageModel"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%
SysOrgPageModel sys = new SysOrgPageModel();
String picType = (String) (sys.areaInfo.get("picType"));
String ereaname = (String) (sys.areaInfo.get("areaname"));
String ereaid = (String) (sys.areaInfo.get("areaid"));
String manager = (String) (sys.areaInfo.get("manager"));
String ctxPath = request.getContextPath();
String downloadfile="auditFeedback";

%>
<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" charset="GBK" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title></title>
<script type="text/javascript">var contextPath = "<%=ctxPath%>", downloadfileName = "<%=downloadfile%>";</script>
<odin:head />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/imp/excelImp.css" />
<script type="text/javascript" src="<%=ctxPath%>/basejs/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/basejs/ext/ext-all.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/basejs/odin.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/radow/corejs/radow.util.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/basejs/helperUtil.js"></script>
</head>
<body>
	<div style="width: 100%; height: 160px;">
		<table style="width: 100%; height: 100%;margin-top:10px;">
			<tr>
				<td colspan="2">
					<form id="data" name="data" method="post" enctype="multipart/form-data">
						<div>
							<font style="font-size: 13px;">&nbsp&nbsp选择要导入的文件：</font>
							<input id="import" type="file" class="file" name="ww" /> 
						</div>
					</form>
				</td>
			</tr>
<!-- 			<tr>
				<td colspan="2">
					<div class="imgDiv">
					点击下载模板:
					<a href="javascript:downLoadExcel('省纪委省监委')">&nbsp省纪委省监委</a>
					<a href="javascript:downLoadExcel('干部综合处')">&nbsp干部综合处</a>
					<a href="javascript:downLoadExcel('干部监督室')">&nbsp干部监督室</a>
					<a href="javascript:downLoadExcel('省信访局')">&nbsp省信访局</a>
					<a href="javascript:downLoadExcel('省法院')">&nbsp省法院</a>
					<a href="javascript:downLoadExcel('省检察院')">&nbsp省检察院</a>
					<a href="javascript:downLoadExcel('省发改委')">&nbsp省发改委</a>
					<a href="javascript:downLoadExcel('省公安厅')">&nbsp省公安厅</a>
					<a href="javascript:downLoadExcel('省人力社保厅')">&nbsp省人力社保厅</a>
					<a href="javascript:downLoadExcel('省自然资源厅')">&nbsp省自然资源厅</a>
					<a href="javascript:downLoadExcel('省生态环境厅')">&nbsp省生态环境厅</a>
					<a href="javascript:downLoadExcel('省卫健委')">&nbsp省卫健委</a>
					<a href="javascript:downLoadExcel('省应急管理厅')">&nbsp省应急管理厅</a>
					<br><a href="javascript:downLoadExcel('省审计厅')">&nbsp省审计厅</a>
					<a href="javascript:downLoadExcel('省市场监管局')">&nbsp省市场监管局</a>
					<a href="javascript:downLoadExcel('省统计局')">&nbsp省统计局</a>
					<a href="javascript:downLoadExcel('省总工会')">&nbsp省总工会</a>
					<a href="javascript:downLoadExcel('国家税务总局浙江省税务局')">&nbsp国家税务总局浙江省税务局</a>
					</div>
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<hr/>
				</td>
			</tr>
			<tr>
				<td colspan="2" >
					<font style="font-size: 13px; ">&nbsp* 导入的Excel文件的格式必须与填写模板一致,否则不能导入!</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="&nbsp;开始导入&nbsp;" id="start" onclick="startImport()" />
					<input type="button" value="&nbsp;&nbsp;关闭&nbsp;&nbsp;" id="closeWin" onclick="gbWin()" />
				</td>
			</tr>
		</table>
	</div>
	<script  type="text/javascript">
	/* 关闭 */
	function gbWin(){
	
		parent.odin.ext.getCmp('AuditExcelImp').close();
		
	}

	/* 开始导入 */
	function startImport() {
		var impType=parent.document.getElementById("impType").value;
		var batchid=parent.document.getElementById("impBatch").value;
		var path = contextPath + '/FormImportAction.do?method=startImp&imptype='+impType+'&batchid='+batchid;
		ShowCellCover('start', '系统提示', '正在处理EXCEL文件,需要一定时间,请您稍等...');
		Ext.Ajax.request({
			url : path,
			form : 'data',
			callback : function(options, success, response) {
				if (success) {
					var result = response.responseText;
					if (result) {
						result = result.substring(5, result.length - 6);
						var json = eval('(' + result + ')');
						var data = json.data;
						for ( var key in data) {
							if ('success' == key) {
								parent.ShowCellCover('success', '系统提示', data.success);
								parent.radow.doEvent('unitreGrid.dogridquery');
								gbWin();// 关闭页面
							}
							if ('error' == key) {
								ShowCellCover('failure', '错误提示', data.error);
							}
						}
					}
				}
			}
		});
	}

	/**
	 * 下载模板
	 */
	function downLoadExcel(value){
		var fileName=value+'.xlsx';
		window.location=contextPath +"/ProblemDownServlet?method=downloadExcel&downloadfileName="+downloadfileName+"&fileName="+encodeURI(encodeURI(fileName))
	}

	</script>
</body>
</html>