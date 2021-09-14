<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<html lang="en">
<head>
<script src="jquery-1.7.2.min.js"> </script>

<%
String ctxPath = request.getContextPath(); 
String subWinId = request.getParameter("subWinId");
%>
<script type="text/javascript">
var subWinId = '<%=subWinId%>';
var realParent = parent.Ext.getCmp(subWinId).initialConfig.thisWin;
</script>
<script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="gbk" src="<%=ctxPath%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
.indentclass {

    padding-left: 9em!important;
	text-indent: -9em!important;

}
</style>
</head>
<body>

	<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
	
	<button onclick="appendContent()">追加内容</button>
<script type="text/javascript">
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor');
//alert(ue);
$(function(){
	//获得简历
	setTimeout('setContent()',500);
	
	
}); 

function setContent(){
	var a1701 = realParent.document.getElementById("a1701").value;
	var pas = a1701.split(/\r|\n|\r\n/g);
	//console.log(pas)
	//ue.setContent(pas, true);
	ue.setContent(pas[0], false);
	for(var i=1;i<pas.length;i++){
		//console.log(pas[i])
		ue.setContent(pas[i], true);
	}
}
function save(){return;
	//简历内容
	var resume = document.getElementById("resume").value;
	//调用父页面方法 
	realParent.setResume(resume);
	//关闭本页面 
	parent.odin.ext.getCmp('resumeWin').close();
}
function appendContent() {
	ue.setContent('<p>11</p>', true);
}


var cce;
ue.addListener('selectionchange',function(a,b,c){
	clearTimeout(cce);
	cce = setTimeout(function() {
		changeCss();
	}, 300);
  //  console.log("选区已经变化！");
});


function changeCss(){
	var iwin = document.getElementById("ueditor_0").contentWindow;
	var pnodes = iwin.$("#bodyContent p");
	///^[0-9 ]{4}[\. ．][0-9| ]{2}[\-─-]{1,2}[[0-9 ]{4}[\. ．][0-9 ]{2}[ ]]{0,1}/
	//console.log(iwin.$)
	 //console.log(pnodes.length)
	// console.log(c);
	pnodes.each(function(){
		var text = $(this).text();
		
		if(text.match(/^[0-9 ]{4}[\. ．][0-9| ]{2}[\-─-]{1,2}[[0-9 ]{4}[\. ．][0-9 ]{2}[ ]{2}]{0,1}/)){
			$(this).attr('style','text-indent: -9em!important');
			
		}else{
			$(this).css('text-indent','');
		}
	});
}

//

</script>
</body>
</html>
