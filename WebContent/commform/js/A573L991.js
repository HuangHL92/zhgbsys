
window.XartWebui_AjaxCall=function(method,param,bArguments){var returnValue=null,qzzc,url=location.href,urlDelim=url.indexOf("?")>0?"&":"?",postData="Cart_Callback_Method="+method;if(bArguments||param instanceof Array){for(var qzba=0;qzba<param.length;qzba++){postData+="&Cart_Callback_Method_Param="+param[qzba];}}else{postData+="&Cart_Callback_Method_Param="+param;}
function qzzs(){if(qzzc.readyState&&qzzc.readyState!=4&&qzzc.readyState!="complete"){return;}
if(qzzc&&qzzc.documentElement){returnValue=qzzc.documentElement.nodeValue;}else{alert("The data could not be loaded.");}}
if(window.XMLHttpRequest){qzzc=new XMLHttpRequest();qzzc.open("POST",url,false);qzzc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");qzzc.send(postData);if(qzzc.responseXML&&qzzc.responseXML.documentElement){returnValue=qzzc.responseXML.documentElement.firstChild.nodeValue;return returnValue;}}else{if(document.implementation&&document.implementation.createDocument){qzzc=document.implementation.createDocument("","",null);qzzc.async=false;qzzc.onload=qzzs;}else{if(document.all){if(window.ActiveXObject){try{qzzc=new ActiveXObject("Microsoft.XMLHTTP");qzzc.open("POST",url,false);qzzc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");qzzc.send(postData);if(qzzc.responseXML&&qzzc.responseXML.documentElement){returnValue=qzzc.responseXML.documentElement.firstChild.nodeValue;return returnValue;}}
catch(ex){}}
if(qzzc==null){var qzac=this.Id+"_island",qzv=document.getElementById(qzac);if(!qzv){qzv=document.createElement("xml");qzv.id=qzac;document.body.appendChild(qzv);}
if(qzv.XMLDocument){qzzc=qzv.XMLDocument;qzzc.async=false;qzzc.onreadystatechange=qzzs;}else{return null;}}}}}
qzzc.async=false;try{qzzc.load(url+urlDelim+postData);}
catch(ex){alert("Data not loaded: "+(ex.message?ex.message:ex));}
return returnValue;};