<%@page contentType="text/javascript; charset=GBK"language="java"%>function proxyRequest(action){var requestURL=<%=request.getContextPath()%>+action
var XMLHTTP=new ActiveXObject("Microsoft.XMLHTTP");XMLHTTP.open("POST",requestURL,false);XMLHTTP.send("");var result="";result=XMLHTTP.responseText;var begin=result.indexOf("#");var end=result.lastIndexOf("#");if(-1!=begin){return result.substring(begin+1,end-1);}else{return"";}}