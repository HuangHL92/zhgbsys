
var qztd=false,qzrv,qzbz=null,qzbw=null,qzpt,qzps,qzvo,qzlv,qqZe,qzva,qzxp;function art_InitDraggable(qzro,qzyu,qzAjz){var qzg=art_GetInstance(qzro);qzg.qztf=(qzyu=="FreeStyle"||qzyu=="Horizontal");qzg.qzvp=(qzyu=="FreeStyle"||qzyu=="Vertical");qzg.qzik=qzAjz;}
function qxc(qzim,qzgx){qzic=false;qzmg=null;qzlx=-1;qzrv=false;if(cart_browser_ie){qzim.cancelBubble=true;}else{qzim.preventDefault();qzim.stopPropagation();}
var qzg=qzgx,frameObj=qzg.Frame;qzbw=qzg;var qzdv=qzg.qzdv;if(!qzdv){qzdv=new Array();qzg.qzdv=qzdv;}
qzvo=qzg.qzik;qzlv=qzg.qznp;if(qzg.BringToTopOnClick){qzgq++;frameObj.style.zIndex=qzgq;}
if(cart_browser_ie){qzpt=qztz(qzim,frameObj);qzps=qzty(qzim,frameObj);}else{if(cart_browser_opera){qzpt=qzim.offsetX;qzps=qzim.offsetY;}else{qzpt=qzim.layerX;qzps=qzim.layerY;}}
if(qzg.qzAbc){qzAej(qzdv);}
qzmi(qzg);qqZe=document.onmousedown;qzva=document.onmousemove;qzxp=document.onmouseup;document.onmousedown=XartWebui_CancelEvent;document.onmousemove=qzAlf;document.onmouseup=qzAiz;return false;}
function qzAlf(qzim){if(cart_browser_ie){event.cancelBubble=true;}else{qzim.preventDefault();qzim.stopPropagation();}
if(!qzrv){qzrv=true;qztd=true;qzbz=qzAih(qzbw,qzvo,qzlv);if(qzbz==qzbw.Frame&&qzbw.qzms){qzAfg(art_dragInstanceId,qzmh(qzbw.Frame),qzhf(qzbw.Frame));}
if(qzvo=="Original"){qzbw.Frame.style.visibility="hidden";}}
var qzp=cart_browser_ie?event.clientX+(document.documentElement&&document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft):qzim.pageX,qzf=cart_browser_ie?event.clientY+(document.documentElement&&document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop):qzim.pageY;if(!qzbw.qztf){qzp=qzmh(qzbz)+parseInt(qzbz.style.width)/2;}
if(!qzbw.qzvp){qzf=qzhf(qzbz)+parseInt(qzbz.style.height)/2;}
if(qzbw.qzAbc){var qzAgq=false;for(var qzba=0;qzba<qzbr.length;qzba++){if(qzf>qzkm[qzba]&&qzf<qzkm[qzba]+qzpu[qzba]&&qzp>qzhe[qzba]&&qzp<qzhe[qzba]+qzno[qzba]){var qzcf=qzAbr(qzbz,qzbr[qzba],qzp,qzf);if((!qzic||qzmg!=qzbr[qzba]||qzlx!=qzcf)){if(qzlv=="Original"){qxa(qzbw.Id,qzbr[qzba],qzcf);}else{qzAfd(qzbw,qzba,qzcf);}
qzmg=qzbr[qzba];qzlx=qzcf;qzic=true;}
qzAgq=true;break;}}
if(!qzAgq){qzyt(qzbw);qzic=false;}}
var qzze=qzp-qzpt,qzzd=qzf-qzps;if(qzbw.qztf){qzbz.style.left=qzze+"px";}
if(qzbw.qzvp){qzbz.style.top=qzzd+"px";}
qzgb(qzbw,qzze,qzzd,qzbz.offsetWidth,qzbz.offsetHeight);return false;}
function qzAiz(qzim){qztd=false;document.onmousedown=qqZe;document.onmousemove=qzva;document.onmouseup=qzxp;if(!qzrv){return false;}
var frameObj=qzbw.Frame,qzxo=qzmh(qzbz),qzxn=qzhf(qzbz);if(qzbz!=frameObj){qzAdu(qzbz);}
qzAfe(qzbw,qzxo,qzxn);qzym();frameObj.style.visibility="visible";frameObj.style.visibility="";qzjg(qzbw);return false;}
function qzAfe(qzg,qzxo,qzxn){var frameObj=qzg.Frame;if(qzg.qzAcg&&!qzic){if(qzg.qzms){return false;}else{if(qzg.qzpv){qxa(qzg.Id,qzg.qzpv,qzg.qzvq);return false;}}}
if(qzg.qzms){qzAfg(qzg,qzxo,qzxn);}else{frameObj.style.left=qzxo+"px";frameObj.style.top=qzxn+"px";}
if(qzic){var qzbs=document.getElementById(qzmg);if(qzlx>qzbs.childNodes.length){qzlx=qzbs.childNodes.length;}
qxa(qzg.Id,qzmg,qzlx);}else{frameObj.style.height=qzg.qznq;frameObj.style.height="";frameObj.style.width=qzg.qzpf+"px";if(qzg.qzlb){if(qzg.FloatAlignment=="Default"){var qzkh=window.document.body.scrollLeft,qzlz=window.document.body.scrollTop;qzg.qzqg=qzxo-qzkh;qzg.qzqf=qzxn-qzlz;}
art_RepositionFloater(qzg);}}}
function qzAfd(qzg,qzka,qzcf){var qzAcd=false,qzak=qzg.qzak;if(qzak!=null){qzyt(qzg);qzak=qzg.qzak;}
if(qzak==null){qzak=document.createElement("div");qzak.style.position="absolute";qzak.style.fontSize="1px";qzak.style.visibility="hidden";document.body.insertBefore(qzak,document.body.firstChild);qzAcd=true;}
var qzbs=document.getElementById(qzbr[qzka]);if(qzg.qzms&&qzg.qzpv==qzbr[qzka]&&qzcf>=qzbs.childNodes.length){qzcf=qziv(qzbr[qzka],qzcf);}
if(qzcf==-1){qzak.style.top=qzkm[qzka]+"px";qzak.style.left=qzhe[qzka]+"px";qzak.style.height=Math.min(qzbz.offsetHeight,qzpu[qzka])+"px";qzak.style.width=qzno[qzka]+"px";}else{if(qzcf>=qzbs.childNodes.length){qzcf=qziv(qzbr[qzka],qzbs.childNodes.length);var qzkf=qzbs.childNodes[qzcf],qzxm=qzhf(qzkf)+qzkf.offsetHeight,qzAlv=Math.min(qzkm[qzka]+qzpu[qzka]-qzxm,qzbz.offsetHeight);qzak.style.top=qzxm+"px";qzak.style.left=qzhe[qzka]+"px";qzak.style.height=qzbz.offsetHeight+"px";qzak.style.width=qzno[qzka]+"px";}else{var qzkf=qzbs.childNodes[qzcf];qzak.style.top=qzhf(qzkf)+"px";qzak.style.left=qzhe[qzka]+"px";qzak.style.height=qzkf.offsetHeight+"px";qzak.style.width=qzno[qzka]+"px";}}
if(qzAcd){qzAhc(qzak,qzlv);}
qzak.style.zIndex=qzgq+1;qzak.style.visibility="visible";qzg.qzak=qzak;}
function qzyt(qzg){var qzak=qzg.qzak;if(qzak!=null){if(qzlv=="TransparentRectangle"||qzlv=="Shadow"){qzAdu(qzak);qzg.qzak=null;}else{qzak.style.visibility="hidden";}}}
function qzAih(qzg,qzik,qznp){var frameObj=qzg.Frame;if(qzik=="Original"&&qznp=="Original"){return frameObj;}
var qzdd=document.createElement("DIV");qzdd.style.position="absolute";qzdd.style.left=qzmh(frameObj)+"px";qzdd.style.top=qzhf(frameObj)+"px";qzdd.style.height=frameObj.offsetHeight+"px";qzdd.style.width=frameObj.offsetWidth+"px";qzdd.style.zIndex=qzgq+1;switch(qzik){case"SolidOutline":qzdd.style.borderStyle="solid";qzdd.style.borderWidth="2px";document.body.insertBefore(qzdd,document.body.firstChild);qzdd.style.visibility="visible";break;case"DashedOutline":qzdd.style.borderStyle="dashed";qzdd.style.borderWidth="1px";qzdd.style.borderColor="#ffffff";var qzeu=document.createElement("div");qzeu.style.borderWidth="1px";qzeu.style.borderColor="#000000";qzeu.style.borderStyle="dashed";qzeu.style.width="100%";qzeu.style.height="100%";qzdd.appendChild(qzeu);document.body.insertBefore(qzdd,document.body.firstChild);qzdd.style.visibility="visible";break;case"GhostCopy":var qzct=frameObj.cloneNode(true);qzct.id="tempDrag_"+qzg.Id;if(cart_browser_ie){qzct.style.filter="alpha(opacity=50)";}else{qzct.style.opacity=0.5;qzct.style.setProperty("-moz-opacity",0.5,"");}
qzct.style.position="absolute";qzct.style.top="0px";qzct.style.left="0px";qzct.style.height="100%";qzct.style.width="100%";if(qzg.RenderOverWindowedObjects){var qzuz=qzxt(qzct);if(qzuz){qzct.removeChild(qzuz);}}
qzdd.appendChild(qzct);document.body.insertBefore(qzdd,document.body.firstChild);break;case"Original":var qzct=frameObj.cloneNode(true);qzct.id="tempDrag_"+qzg.Id;qzct.style.position="absolute";qzct.style.top="0px";qzct.style.left="0px";qzct.style.height="100%";qzct.style.width="100%";if(qzg.RenderOverWindowedObjects){var qzuz=qzxt(qzct);if(qzuz){qzct.removeChild(qzuz);}}
qzdd.appendChild(qzct);document.body.appendChild(qzdd);break;case"TransparentRectangle":document.body.insertBefore(qzdd,document.body.firstChild);qzAch(qzdd,"#000000","#505050");break;case"Shadow":document.body.insertBefore(qzdd,document.body.firstChild);qzAab(qzdd,"#202020");break;default:qzdd.style.display="none";document.body.insertBefore(qzdd,document.body.firstChild);break;}
if(cart_browser_ie&&qzg.RenderOverWindowedObjects&&(qzik=="Shadow"||qzik=="GhostCopy"||qzik=="TransparentRectangle")){var qztc=document.createElement("iframe");qztc.style.position="absolute";qztc.style.top="0px";qztc.style.left="0px";qztc.style.width="100%";qztc.style.height="100%";qztc.style.display="block";qztc.style.zIndex=-1;if(cart_browser_ie){qztc.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";}else{qzct.style.opacity=0;qzct.style.setProperty("-moz-opacity",0,"");}
qzdd.appendChild(qztc);}
return qzdd;}
var XartWebui_Snap_Drag_Loaded=true;