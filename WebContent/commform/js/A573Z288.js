
function XartWebui_Rotator(){this.GlobalID="";this.ElementID="";this.ContainerID="";this.AutoStart=true;this.HideEffect=null;this.HideEffectDuration=0;this.Loop=true;this.PauseOnMouseOver=true;this.RotationType="ContentScroll";this.ScrollDirection="up";this.ScrollInterval=10;this.qzAfm=1;this.ShowEffect=null;this.ShowEffectDuration=0;this.SlidePause=2000;this.qzAdo="Medium";this.Slides=new Array();this.Tickers=new Array();this.LeadTickers=new Array();this.qzev=-1;this.qzng=0;this.qzix=0;this.qzft=0;this.qzvs=0;this.qzpw=true;this.HasTickers=false;this.qzAmr=null;this.qzsk=false;this.qzAdc=false;this.Status="";}
XartWebui_Rotator.prototype.GetProperty=function(propName){return this[propName];};XartWebui_Rotator.prototype.SetProperty=function(propName,propValue){this[propName]=propValue;};function rcr_Start(qzl){if(cart_browser_ie){if(qzl.RotationType=="SlideShow"){ss_ShowNextSlide(qzl);}else{qzAjd(qzl);if(qzl.HasTickers){rcr_StartTickerSequence(qzl);}else{var qzbn="scroll_ShowNextSlide("+qzl.GlobalID+")";qzl.qzft=window.setTimeout(qzbn,qzl.SlidePause);}}}else{if(qzl.RotationType=="SlideShow"){ss_ShowNextSlide(qzl);}else{qzAjd(qzl);scroll_ShowNextSlide(qzl);}}}
function qzAim(qzl){if(!qzl.qzsk){return null;}
qzl.qzsk=false;if(!qzl.qzAdc){if(qzl.RotationType=="SlideShow"){qzAmg(qzl);}else{qzAjc(qzl);}}}
function qzAbg(qzl){if(qzl.qzsk){return null;}
qzl.qzsk=true;window.clearTimeout(qzl.qzft);window.clearTimeout(qzl.qzvs);if(qzl.SlidePause==0){window.clearInterval(qzl.qzix);}
if(qzl.RotationType=="SlideShow"){var qzbi=document.getElementById(qzl.ContainerID);qzbi.style.visibility="visible";}}
function qzsl(qzl){if(cart_browser_ie){if(qzl.qzev==-1){if(qzl.RotationType=="SlideShow"){qzl.qzev=0;}else{qzl.qzev=1;}}else{if(qzl.qzev==qzl.Slides.length-1){qzl.qzev=0;qzl.qzpw=false;}else{qzl.qzev++;}}}else{if(qzl.qzev==-1){qzl.qzev=0;}else{if(qzl.qzev==qzl.Slides.length-1){qzl.qzev=0;qzl.qzpw=false;}else{qzl.qzev++;}}}}
function qzAjd(qzl){if(cart_browser_ie){var qzbi=document.getElementById(qzl.ContainerID);qzbi.style.visibility="visible";qzbi.parentNode.scrollTop=0;qzbi.parentNode.scrollLeft=0;}else{var qzbi=document.getElementById(qzl.ContainerID),qzAag=document.getElementById(qzl.ElementID),qzAen,qzAcm;switch(qzl.ScrollDirection){case"up":qzAen=parseInt(qzAag.style.height.replace("px",""))+"px";qzAcm="0px";break;case"left":qzAen="0px";qzAcm=parseInt(qzAag.style.width.replace("px",""))+"px";break;}
qzbi.style.top=qzAen;qzbi.style.left=qzAcm;qzbi.style.visibility="visible";}}
function qzAjc(qzl){if(qzl.qzix==0){scroll_ShowNextSlide(qzl);}else{if(qzl.SlidePause==0){var qzbn="scroll_NextSlideToView("+qzl.GlobalID+")";qzl.qzix=window.setInterval(qzbn,qzl.ScrollInterval);}}}
function scroll_ShowNextSlide(qzl){qzsl(qzl);if(!qzl.Loop&&!qzl.qzpw){qzAbg(qzl);return null;}
var qzbn="scroll_NextSlideToView("+qzl.GlobalID+")";qzl.qzix=window.setInterval(qzbn,qzl.ScrollInterval);}
function scroll_NextSlideToView(qzl){if(cart_browser_ie){var qzbi=document.getElementById(qzl.ContainerID),qzxy=document.getElementById(qzl.Slides[qzl.qzev]),qzgg=qzbi.parentNode.scrollTop,qzfc=qzbi.parentNode.scrollLeft,qzev=document.getElementById(qzl.Slides[qzl.qzev]);if(qzev){var slideHeight=qzev.offsetHeight,slideWidth=qzev.offsetWidth;}
var qzAcl=0;switch(qzl.ScrollDirection){case"up":if(qzl.RotationType=="ContentScroll"){qzgg+=qzl.qzAfm;}else{qzAcl=abs(slideHeight-qzgg)/qzpx(qzl);if(qzAcl<=2){qzAcl=1;}
qzgg+=qzAcl;}
break;case"left":if(qzl.RotationType=="ContentScroll"){qzfc+=qzl.qzAfm;}else{qzAcl=abs(slideWidth-qzfc)/qzpx(qzl);if(qzAcl<=2){qzAcl=1;}
qzfc+=qzAcl;}
break;}
if((qzgg>=slideHeight&&qzl.ScrollDirection=="up")||(qzfc>=slideWidth&&qzl.ScrollDirection=="left")){window.clearInterval(qzl.qzix);qzl.qzix=0;if(!(qzl.qzpw&&qzl.qzev==0)){qzxx(qzl);}
qzbi.parentNode.scrollTop=0;qzbi.parentNode.scrollLeft=0;if(qzl.HasTickers){rcr_StartTickerSequence(qzl);}else{var qzbn="scroll_ShowNextSlide("+qzl.GlobalID+")";if(!qzl.qzsk){qzl.qzft=window.setTimeout(qzbn,qzl.SlidePause);}}}else{qzbi.parentNode.scrollTop=qzgg;qzbi.parentNode.scrollLeft=qzfc;}}else{var qzbi=document.getElementById(qzl.ContainerID),qzxy=document.getElementById(qzl.Slides[qzl.qzev]),qzgg=parseInt(qzbi.style.top.replace("px","")),qzfc=parseInt(qzbi.style.left.replace("px","")),qztj=0,qzrz=0,qzvg=document.getElementById(qzl.Slides[qzpy(qzl)]);if(!(qzl.qzpw&&qzl.qzev==0)){qztj=qzvg.offsetHeight;qzrz=qzvg.offsetWidth;}
var qzAcl=0;switch(qzl.ScrollDirection){case"up":if(qzl.RotationType=="ContentScroll"){qzgg-=qzl.qzAfm;}else{qzAcl=abs(qztj+qzgg)/qzpx(qzl);if(qzAcl<=2){qzAcl=1;}
qzgg-=qzAcl;}
break;case"left":if(qzl.RotationType=="ContentScroll"){qzfc-=qzl.qzAfm;}else{qzAcl=abs(qzrz+qzfc)/qzpx(qzl);if(qzAcl<=2){qzAcl=1;}
qzfc-=qzAcl;}
break;}
qzbi.style.top=qzgg+"px";qzbi.style.left=qzfc+"px";if((qzgg+qztj==0&&qzl.ScrollDirection=="up")||(qzfc+qzrz==0&&qzl.ScrollDirection=="left")){window.clearInterval(qzl.qzix);qzl.qzix=0;if(!(qzl.qzpw&&qzl.qzev==0)){qzxx(qzl);}
if(qzl.HasTickers){rcr_StartTickerSequence(qzl);}else{var qzbn="scroll_ShowNextSlide("+qzl.GlobalID+")";if(!qzl.qzsk){qzl.qzft=window.setTimeout(qzbn,qzl.SlidePause);}}}}}
function qzxx(qzl){if(cart_browser_ie){var qzbi=document.getElementById(qzl.ContainerID);if(qzl.ScrollDirection=="up"){var qzvg=document.getElementById(qzl.Slides[qzpy(qzl)]),qzAhi=qzvg.cloneNode(true);qzbi.removeChild(qzvg);qzbi.parentNode.scrollTop=0;qzbi.appendChild(qzAhi);qzry(qzl);}else{var qzAlo=document.getElementById(qzl.ContainerRowID),qzAhh=qzAlo.cells[0],qzAon=qzAlo.removeChild(qzAhh);qzbi.parentNode.scrollLeft=0;var qzAof=qzAlo.appendChild(qzAon);qzry(qzl);}}else{var qzbi=document.getElementById(qzl.ContainerID);if(qzl.ScrollDirection=="up"){var qzvg=document.getElementById(qzl.Slides[qzpy(qzl)]),qzAhi=qzvg.cloneNode(true);qzbi.removeChild(qzvg);qzbi.style.top="0px";qzbi.appendChild(qzAhi);qzry(qzl);}else{var qzAlo=document.getElementById(qzl.ContainerRowID),qzAhh=qzAlo.cells[0],qzAon=qzAlo.removeChild(qzAhh);qzbi.style.left="0px";var qzAof=qzAlo.appendChild(qzAon);qzry(qzl);}}}
function qzpy(qzl){if(qzl.qzev==0){return qzl.Slides.length-1;}else{return qzl.qzev-1;}}
function qzpx(qzl){switch(qzl.qzAdo){case"Slow":return 8;break;case"Medium":return 6;break;case"Fast":return 4;break;}}
function qzAmg(qzl){if(qzl.HasTickers&&qzl.Status=="PlayingShowEffect"){return null;}
if(!qzl.qzAdc){ss_PlayHideEffect(qzl);var qzAdd=0;if(qzl.HideEffect){qzAdd=qzl.HideEffectDuration;}
qzbn="ss_ShowNextSlide("+qzl.GlobalID+")";qzl.qzft=window.setTimeout(qzbn,qzAdd);}}
function ss_ShowNextSlide(qzl){if(qzl.qzsk){return null;}
qzsl(qzl);var qzbi=document.getElementById(qzl.ContainerID),qzxy=document.getElementById(qzl.Slides[qzl.qzev]);qzbi.innerHTML=qzxy.innerHTML;qzxy.innerHTML="";qzry(qzl);qzAdq(qzl);if(qzl.HasTickers){var qzbn="rcr_StartTickerSequence("+qzl.GlobalID+")",qzAnw=window.setTimeout(qzbn,qzl.ShowEffectDuration);}else{var qzbn="ss_DisplaySlide("+qzl.GlobalID+")";qzl.qzft=window.setTimeout(qzbn,qzl.ShowEffectDuration);}}
function ss_DisplaySlide(qzl){if(qzl.qzsk){return null;}
qzl.Status="DisplayingSlide";window.clearTimeout(qzl.qzvs);window.clearTimeout(qzl.qzft);if(!qzl.Loop&&qzl.qzev==qzl.Slides.length-1){qzAbg(qzl);return null;}
var qzbn="ss_PlayHideEffect("+qzl.GlobalID+")";qzl.qzvs=window.setTimeout(qzbn,qzl.SlidePause);var qzAdd=0;if(qzl.HideEffect){qzAdd+=qzl.HideEffectDuration;}
qzAdd+=qzl.SlidePause;qzbn="ss_ShowNextSlide("+qzl.GlobalID+")";qzl.qzft=window.setTimeout(qzbn,qzAdd);}
function qzAdq(qzl){qzl.Status="PlayingShowEffect";var qzbi=document.getElementById(qzl.ContainerID);if(qzbi.filters&&qzl.ShowEffect){qzbi.style.filter=qzl.ShowEffect;qzbi.filters[0].apply();}
qzbi.style.visibility="visible";if(qzbi.filters&&qzl.ShowEffect){qzbi.filters[0].play();}}
function ss_PlayHideEffect(qzl){qzl.Status="PlayingHideEffect";var qzbi=document.getElementById(qzl.ContainerID);if(qzbi.filters&&qzl.HideEffect){qzbi.style.filter=qzl.HideEffect;qzbi.filters[0].apply();}
var qzxy=document.getElementById(qzl.Slides[qzl.qzev]);qzxy.innerHTML=qzbi.innerHTML;qzbi.style.visibility="hidden";if(qzbi.filters&&qzl.HideEffect){qzbi.filters[0].play();}}
function rcr_StartTickerSequence(qzl){qzl.Status="RunningTickers";qzl.qzAdc=true;rcr_StartTicker(qzl.LeadTickers[qzl.qzng]);}
function rcr_EndTickerSequence(qzl){qzl.qzAdc=false;if(!qzl.qzsk){if(qzl.RotationType=="SlideShow"){ss_DisplaySlide(qzl);}else{var qzbn="scroll_ShowNextSlide("+qzl.GlobalID+")";qzl.qzft=window.setTimeout(qzbn,qzl.SlidePause);}}
qzAaf(qzl);}
function qzAaf(qzl){if(qzl.qzng==qzl.LeadTickers.length-1){qzl.qzng=0;}else{qzl.qzng++;}}
function qzry(qzl){if(qzl.HasTickers){for(var qzba=0;qzba<qzl.Tickers.length;qzba++){qzwd(qzl.Tickers[qzba],"");}}}
function ie_MsOver(qzbc,qzgr){if(!qzbc.contains(event.fromElement)&&qzgr){qzAbg(qzgr);}}
function ie_MsOut(qzbc,qzgr){if(!qzbc.contains(event.toElement)&&qzgr){qzAim(qzgr);}}
function ns_MsOver(qzAgt,qzAbf,qzgr){if(qzwh(qzAbf,qzAgt)&&qzgr){qzAbg(qzgr);}}
function ns_MsOut(qzAgt,qzAbf,qzgr){if(!qzwh(qzAbf,qzAgt)&&qzgr){qzAim(qzgr);}}
function qzwh(qzAjn,qzAgt){if(qzAjn!=null){var qzbc=document.getElementById(qzAjn),qzAjp=qzAlm(qzbc)-1,qzAkv=qzAll(qzbc)-1,qzAln=qzAjp+qzbc.offsetWidth+1,qzAku=qzAkv+qzbc.offsetHeight+1;if((qzAgt.pageX>qzAjp)&&(qzAgt.pageX<qzAln)&&(qzAgt.pageY>qzAkv)&&(qzAgt.pageY<qzAku)){return true;}else{return false;}}else{return false;}}
function qzAlm(qzcg){var x=0;do{if(qzcg.style.position=="absolute"){return x+qzcg.offsetLeft;}else{x+=qzcg.offsetLeft;if(qzcg.offsetParent){if(qzcg.offsetParent.tagName=="TABLE"){if(parseInt(qzcg.offsetParent.border)>0){x+=1;}}}}}while((qzcg=qzcg.offsetParent));return x;}
function qzAll(qzcg){var y=0;do{if(qzcg.style.position=="absolute"){return y+qzcg.offsetTop;}else{y+=qzcg.offsetTop;if(qzcg.offsetParent){if(qzcg.offsetParent.tagName=="TABLE"){if(parseInt(qzcg.offsetParent.border)>0){y+=1;}}}}}while((qzcg=qzcg.offsetParent));return y;}
function abs(x){if(x<0){return-x;}else{return x;}}