
var qzuy,qzwf,qzys,qzxl,qztb=null;function art_NetscapeWindowPoller(qzAmw){var qzdh=self.innerHeight,qzgj=self.innerWidth,scrollTop=self.pageYOffset,scrollLeft=self.pageXOffset;if(!qzAmw){if(qzdh!=qzuy||qzgj!=qzwf){if(window.onresize){window.onresize();}}
if(scrollTop!=qzys||scrollLeft!=qzxl){if(window.onscroll){window.onscroll();}}}
qzuy=qzdh;qzwf=qzgj;qzys=scrollTop;qzxl=scrollLeft;}
function art_TakeOverEvents(qzaz,qzxj){var qzg=art_GetInstance(qzaz);if(qzxj){qzg.OldScrollHandler=window.onscroll;window.onscroll=qzg.RepositionFloater;}
qzg.OldResizeHandler=window.onresize;window.onresize=qzg.RepositionFloater;if(cart_browser_n6||cart_browser_mozilla){art_NetscapeWindowPoller(true);if(!qztb){qztb=setInterval("art_NetscapeWindowPoller(false)",100);}}}
function art_InitFloater(qzaz,qzvc,qzxb,qzAad,offsetX,offsetY,qzAko,qzxj){var qzg=art_GetInstance(qzaz);qzg.qzlb=true;qzg.FloatAlignment=qzvc;qzg.qzqg=parseInt(offsetX);qzg.qzqf=parseInt(offsetY);qzg.FloatMinLeft=qzxb;qzg.FloatMinTop=qzAad;qzg.qzzz=qzAko;if(!qzg.qzms){art_PositionSpan(qzg.Id,qzvc,qzxb,qzAad,offsetX,offsetY,false);}
setTimeout("art_TakeOverEvents('"+qzaz+"',"+qzxj+")",100);qzg.Frame.style.visibility="visible";}
function art_RepositionFloater(qzg){if(!qzg.qzms){if(qzg.qzzz){if(qzg.qzlo){clearTimeout(qzg.qzlo);qzg.qzlo=null;}
var qzAmx="art_PositionSpan('"+qzg.Id+"','"+qzg.FloatAlignment+"',"+qzg.FloatMinLeft+","+qzg.FloatMinTop+","+qzg.qzqg+","+qzg.qzqf+",true);";qzg.qzlo=setTimeout(qzAmx,200);}else{art_PositionSpan(qzg.Id,qzg.FloatAlignment,qzg.FloatMinLeft,qzg.FloatMinTop,qzg.qzqg,qzg.qzqf,false);}}
if(qzg.OldScrollHandler){qzg.OldScrollHandler();}
if(qzg.OldResizeHandler){qzg.OldResizeHandler();}}
var XartWebui_Snap_Float_Loaded=true;