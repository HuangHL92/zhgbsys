
var qxd=20;function qzzg(qzro,qztg){var qzg=art_GetInstance(qzro),qzAfk=document.getElementById(qzg.ClientPrefix+"HeaderSpan"),qzAfj=document.getElementById(qzg.ClientPrefix+"FooterSpan"),qzoy=document.getElementById(qzg.ClientPrefix+"CollapsedHeaderSpan"),qzox=document.getElementById(qzg.ClientPrefix+"CollapsedFooterSpan");qzg.qzAme=qzAfk;qzg.qzAmd=qzAfj;qzg.qzAlx=qzoy;qzg.qzAlw=qzox;if(qzoy){qzg.Frame.removeChild(qzoy);qzoy.style.display="block";}
if(qzox){qzg.Frame.removeChild(qzox);qzox.style.display="block";}
if(qztg){qzAcj(qzg,true,true);}}
function art_DoExpandCollapseStep(qzaz,qzyx,qzfu,qzeb,qzAbl){var qzg=art_GetInstance(qzaz),qzua=qzg.InnerFrame.offsetHeight,qzAac=qzg.Frame.offsetHeight,qzpo=qzg.qzAkr,qzAge=qzg.qzAmi,qzcp=(new Date()).getTime()-qzg.ExpColStartTime,qzcc=XartWebui_SlidePortionCompleted(qzcp,qzfu,qzeb);if(qzcc==1||qzAbl){if(qzyx==0){qzg.Frame.style.height=qzAge-(qzpo-1);qzg.InnerFrame.style.display="none";qzg.InnerFrame.style.height="1px";}else{qzg.Frame.style.height="";qzg.InnerFrame.style.height="";qzg.InnerFrame.style.overflow="";}
qzg.CollapseExpanding=false;qzg.qznq=qzg.Frame.offsetHeight;qzwq(qzg);}else{if(qzyx==0){qzg.InnerFrame.style.height=Math.ceil((1-qzcc)*qzpo)+"px";var qzzh=qzua-qzg.InnerFrame.offsetHeight;qzg.Frame.style.height=(qzAac-qzzh)+"px";}else{qzg.InnerFrame.style.height=Math.max(1,Math.ceil(qzcc*qzpo))+"px";var qzzh=qzua-qzg.InnerFrame.offsetHeight;qzg.Frame.style.height=(qzAac-qzzh)+"px";}
setTimeout("art_DoExpandCollapseStep('"+qzaz+"',"+qzyx+","+qzfu+","+qzeb+",false);",qxd);}}
function qzwq(qzg){var qzAgd=qzg.qzpk,qzeo=qzg.Frame,qzwu=qzg.qzAme,qzwt=qzg.qzAmd,qzws=qzg.qzAlx,qzwr=qzg.qzAlw;if(qzAgd==0){if(qzws){if(qzwu){qzeo.removeChild(qzwu);}
qzeo.insertBefore(qzws,qzeo.childNodes[0]);}
if(qzwr){if(qzwt){qzeo.removeChild(qzwt);}
qzeo.appendChild(qzwr);}}else{if(qzws){qzeo.removeChild(qzws);if(qzwu){qzeo.insertBefore(qzwu,qzeo.childNodes[0]);}}
if(qzwr){qzeo.removeChild(qzwr);if(qzwt){qzeo.appendChild(qzwt);}}}
if(qzg.qzlb){art_RepositionFloater(qzg);}
if(qzg.qzms){var qzvb=qzg.qzup,qzbs=document.getElementById(qzvb),qzAck=qzkb(qzbs);if(qzAck){var qzmj=qzhs(qzAck);if(qzmj.qzlb){art_RepositionFloater(qzmj);}}}
qzjg(qzg);}
function qzAcj(qzg,qzAbl,qzma){qzg.qzpk=0;if(!qzma&&qzg.ClientSideOnCollapse){qzg.ClientSideOnCollapse(qzg);}
if(!qzma&&qzg.AutoPostBackOnCollapse){__doPostBack(qzg.ControlId,"COLLAPSE");return;}
if(!qzma&&qzg.AutoCallBackOnCollapse){qzg.Callback();}
qzg.InnerFrame.style.overflow="hidden";qzg.qzAmi=qzg.Frame.offsetHeight;qzg.qzAkr=qzg.InnerFrame.offsetHeight;var qzfu=qzAbl?0:qzg.CollapseDuration;if((qzg.CollapseTransition>0||qzg.CollapseTransitionCustomFilter!="")&&qzfu>0&&cart_browser_transitions){var qzn=qzg.InnerFrame;if(!qzn.CollapseTransitionFilterDefined){var qzcy=EffectiveTransitionString(qzg.CollapseTransition,qzg.CollapseTransitionCustomFilter);qzn.CollapseTransitionFilterIndex=qzn.filters.length;qzn.CollapseTransitionFilterDefined=true;qzn.runtimeStyle.filter=qzn.currentStyle.filter+" "+qzcy;}
qzn.filters[qzn.CollapseTransitionFilterIndex].apply();qzn.style.visibility="hidden";qzn.filters[qzn.CollapseTransitionFilterIndex].play(qzfu/1000);}
if(qzg.CollapseSlide==0&&qzfu>0){qzg.ExpColStartTime=(new Date()).getTime()+qzfu;setTimeout("art_DoExpandCollapseStep('"+qzg.Id+"', 0,0,0,false);",qzfu);}else{qzg.ExpColStartTime=(new Date()).getTime();art_DoExpandCollapseStep(qzg.Id,0,qzfu,qzg.CollapseSlide,false);}}
function qzAkb(qzg){qzg.qzpk=1;if(qzg.ClientSideOnExpand){qzg.ClientSideOnExpand(qzg);}
if(qzg.AutoPostBackOnExpand){__doPostBack(qzg.ControlId,"EXPAND");return;}
if(qzg.AutoCallBackOnExpand){qzg.Callback();}
qzg.InnerFrame.style.height="1px";qzg.InnerFrame.style.display="block";if((qzg.ExpandTransition>0||qzg.ExpandTransitionCustomFilter!="")&&qzg.ExpandDuration>0&&cart_browser_transitions){var qzn=qzg.InnerFrame;if(!qzn.ExpandTransitionFilterDefined){var qzdi=EffectiveTransitionString(qzg.ExpandTransition,qzg.ExpandTransitionCustomFilter);qzn.ExpandTransitionFilterIndex=qzn.filters.length;qzn.ExpandTransitionFilterDefined=true;qzn.runtimeStyle.filter=qzn.currentStyle.filter+" "+qzdi;}
qzn.filters[qzn.ExpandTransitionFilterIndex].apply();qzn.style.visibility="visible";qzn.filters[qzn.ExpandTransitionFilterIndex].play(qzg.ExpandDuration/1000);}
qzg.ExpColStartTime=(new Date()).getTime();art_DoExpandCollapseStep(qzg.Id,1,qzg.ExpandDuration,qzg.ExpandSlide,false);}
function qxb(qzgx){if(cart_browser_opera){return false;}
var qzg=qzgx;if(qzg.CollapseExpanding){return false;}
qzg.CollapseExpanding=true;if(qzg.BringToTopOnClick){qzgq++;qzg.Frame.style.zIndex=qzgq;}
var qzAgd=qzg.qzpk,qzAkc=(qzAgd==0?1:0),qzAil=10;if(qzAkc==0){qzAcj(qzg,false);}else{qzAkb(qzg);}
return false;}
var XartWebui_Snap_Collapse_Loaded=true;