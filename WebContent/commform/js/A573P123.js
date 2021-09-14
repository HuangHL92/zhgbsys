
if(!window.XartWebui_ComboBox_Kernel_Loaded){function XartWebui_ComboBox(id){this.DomElementId=id;this.element=this.DomElement=document.getElementById(this.DomElementId);if(window.XartWebui_Atlas){XartWebui.Web.UI.ComboBox.initializeBase(this,[this.element]);this.beginUpdate=function(){this._updating=true;};this.dispose=function(){XartWebui.Web.UI.ComboBox.callBaseMethod(this,"dispose");this.Dispose();};this.endUpdate=function(){this._updating=false;this.Render(true);};this.get_isUpdating=function(){return this._updating;};this.getDescriptor=function(){return _qE4(this.constructor);};}else{this.beginUpdate=function(){this._updating=true;};this.endUpdate=function(){this._updating=false;this.Render(true);};this.get_isUpdating=function(){return this._updating;};}
this.ClientControlId=this.Id=id;this.ItemHeight=10;}
XartWebui_ComboBox.prototype.PublicProperties=[["CssClass",String],["ItemCount",Number],["SelectedIndex",Number,1],["Text",String,1,1],["TextBoxCssClass",String]];XartWebui_ComboBox.prototype.PublicMethods=[["AddItem",,null,[["item",Object],["index",Number]]],["Collapse"],["Disable"],["Dispose"],["Enable"],["Expand"],["Filter",,null,[["filterString",String]]],["Focus"],["GetItem",,Object,[["index",Number]]],["GetSelectedItem",,Object],["RemoveItemAt",,null,[["index",Number]]],["SelectItem",,null,[["item",Object]]],["SelectItemByIndex",,null,[["id",String]]],["ToggleExpand"]];XartWebui_ComboBox.prototype.PublicEvents=[["CallbackComplete"],["CallbackError"],["Change"],["Collapse"],["Expand"],["Load"]];_qE3(XartWebui_ComboBox);window.XartWebui.Web.UI.ComboBox=window.XartWebui_ComboBox;if(window.XartWebui_Atlas){XartWebui.Web.UI.ComboBox.registerClass("XartWebui.Web.UI.ComboBox",Sys.UI.Control);if(Sys.TypeDescriptor){Sys.TypeDescriptor.addType("XartWebuiWebUI","comboBox",XartWebui.Web.UI.ComboBox);}}
function XartWebui_ComboBoxItem(_2){if(window.XartWebui_Atlas){XartWebui.Web.UI.ComboBoxItem.initializeBase(this);this.getDescriptor=function(){return _qE4(this.constructor);};}
this.Enabled=true;if(_2){this.Data=_2;}else{this.Data=[];}}
XartWebui_ComboBoxItem.prototype.PublicProperties=[["Enabled"],["Id"],["Text"],["Value"]];XartWebui_ComboBoxItem.prototype.PublicMethods=[["GetProperty",,Object],["SetProperty",,,[["propertyName",String],["propertyValue",Object]]]];_qE3(XartWebui_ComboBoxItem);window.XartWebui.Web.UI.ComboBoxItem=window.XartWebui_ComboBoxItem;if(window.XartWebui_Atlas){XartWebui.Web.UI.ComboBoxItem.registerClass("XartWebui.Web.UI.ComboBoxItem");if(Sys.TypeDescriptor){Sys.TypeDescriptor.addType("XartWebuiWebUI","comboBoxItem",XartWebui.Web.UI.ComboBoxItem);}}
XartWebui_ComboBoxItem.prototype.GetProperty=function(_3,_4){for(var i=0;i<this.Data.length;i++){if(this.Data[i][0]==_3){return this.Data[i][1];}}
return _4;};XartWebui_ComboBoxItem.prototype.SetProperty=function(_6,_7){var _8=false;for(var i=0;i<this.Data.length;i++){if(this.Data[i][0]==_6){this.Data[i][1]=_7;_8=true;break;}}
if(!_8){this.Data[this.Data.length]=[_6,_7];}
this[_6]=_7;};XartWebui_ComboBox.prototype.get_text=function(){var _a=document.getElementById(this.Id+"_Input");return _a?_a.value:"";};XartWebui_ComboBox.prototype.set_text=function(_b){var _c=document.getElementById(this.Id+"_Input");if(_c){_c.value=_b;}};XartWebui_ComboBox.prototype.GetProperty=function(_d){return this[_d];};XartWebui_ComboBox.prototype.SetProperty=function(_e,_f){this[_e]=_f;};XartWebui_ComboBox.prototype.AddItem=function(_10,_11){if(!(_11||_11==0)){_11=this.Data.length;}
this.Data=this.Data.slice(0,_11).concat([_10.Data]).concat(this.Data.slice(_11));this.ItemCount++;this.LoadedItemCount++;this.TextCache.length=0;this.CssClasses.length=0;};XartWebui_ComboBox.prototype.Callback=function(url,_13){if(this.CallingBack){return false;}
var _14=this;var _15=false;var _16;function Cleanup(){_14.CallingBack=false;_14.HideReloading();if(_14.AutoComplete||_14.AutoHighlight){_14.CompleteAndHighlight();}}
function _q18F(){if(_16.readyState&&_16.readyState!=4&&_16.readyState!="complete"){return;}
var _17=_15?_16.responseXML:_16;if(_17&&_17.documentElement&&_17.documentElement.childNodes.length==2){var _18=_17.documentElement.childNodes[0];var _19=_17.documentElement.childNodes[1];if(_18.nodeName=="ComboBoxError"){var _1a=_18.firstChild.nodeValue;var _1b=_14.get_events().getHandler("callbackError");if(_1b){_1b(_14,new XartWebui.Web.UI.ComboBoxCallbackErrorEventArgs(_1a));}else{alert("Callback error:\n"+_1a);}}else{var _1c=_18.firstChild.nodeValue;var _1d=eval(_1c);_14.LoadItems(_1d,_13);_14.LoadParams(_19.childNodes);_14.Render(true);}}else{if(_16.status&&_16.status!=200&&_16.responseText){document.body.innerHTML=_16.responseText;}else{alert("Error loading callback data.");}}
Cleanup();var _1b=_14.get_events().getHandler("callbackComplete");if(_1b){_1b(_14,Sys.EventArgs.Empty);}}
this.CallingBack=true;if(window.XMLHttpRequest){_15=true;var _16=new XMLHttpRequest();_16.onreadystatechange=_q18F;_16.open("GET",url,true);_16.send(null);}else{if(document.implementation&&document.implementation.createDocument){_16=document.implementation.createDocument("","",null);_16.onload=_q18F;}else{if(cart_browser_ie){var _1e=this.Id+"_island";var _1f=document.getElementById(_1e);if(!_1f){_1f=document.createElement("xml");_1f.id=_1e;document.body.appendChild(_1f);}
if(_1f.XMLDocument){_16=_1f.XMLDocument;_16.onreadystatechange=_q18F;}else{return false;}}else{return false;}}}
if(!_15){_16.async=true;try{_16.load(url);}
catch(ex){Cleanup();alert("Data not loaded: "+(ex.message?ex.message:ex));}}
return true;};XartWebui_ComboBox.prototype.Collapse=function(){if(this.Resizing){return;}
var _20=document.getElementById(this.Id+"_DropDown");if(_20&&_20.style.display!="none"){_20.style.overflow="hidden";this.CollapseElement=_20;this.CollapseStartTime=(new Date()).getTime();var _21=XartWebui_GetAdjustedHeight(_20);XartWebui_ComboBox_CollapseStep(this,_21);}
this.Expanded=false;};XartWebui_ComboBox.prototype.CollapseIfBlurred=function(){if(document.activeElement){var _22=document.getElementById(this.Id+"_DropDown");for(var o=document.activeElement;o.parentNode&&o.parentNode!=document.body;o=o.parentNode){if(o.parentNode==_22){this.Focus();break;}}}
if(!this.Focused){this.Collapse();}};XartWebui_ComboBox.prototype.CompleteAndHighlight=function(){var _24=document.getElementById(this.Id+"_Input");if(!_24||!_24.value){return;}
var _25=_q105(_24);var _26=_24.value.toLowerCase().substring(0,_25);for(var i=0;i<this.TextCache.length;i++){var _28=this.TextCache[i];if(_28&&_28.indexOf(_26)==0){if(this.AutoComplete){_24.value=_28;this.SelectItemByIndex(i);XartWebui_SetSelectionRange(_24,_26.length,_24.value.length);}
if(this.AutoHighlight){if(!this.AutoComplete){this.SelectItemByIndex(i);}
this.Expand();}
break;}}};XartWebui_ComboBox.prototype.Disable=function(){if(this.element){this.element.disabled=true;}
if(this.TextBoxEnabled){var _29=document.getElementById(this.Id+"_Input");if(_29){_29.disabled=true;if(this.TextBoxDisabledCssClass&&this.TextBoxCssClass){_29.className=this.TextBoxDisabledCssClass;}}}else{var _2a=document.getElementById(this.Id+"_TextBox");if(_2a){if(this.TextBoxDisabledCssClass&&this.TextBoxCssClass){_2a.className=this.TextBoxDisabledCssClass;}}}
this.Collapse();if(this.DisabledCssClass&&this.CssClass){this.element.className=this.DisabledCssClass;}
this.Disabled=true;};XartWebui_ComboBox.prototype.Dispose=function(){XartWebui_Dispose(this);this.CollapseElement=this.ExpandElement=null;var _2b=document.getElementById(this.Id+"_DropDown");_qE7(_2b);if(this.OverlayElement){_qE7(this.OverlayElement);}
if(this.ContainerObj){_qE7(this.ContainerObj);}};XartWebui_ComboBox.prototype.Enable=function(){if(this.element){this.element.disabled=false;}
if(this.TextBoxEnabled){var _2c=document.getElementById(this.Id+"_Input");if(_2c){_2c.disabled=false;if(this.TextBoxDisabledCssClass&&this.TextBoxCssClass){_2c.className=this.TextBoxCssClass;}}}else{var _2d=document.getElementById(this.Id+"_TextBox");if(_2d){if(this.TextBoxDisabledCssClass&&this.TextBoxCssClass){_2d.className=this.TextBoxCssClass;}}}
if(this.DisabledCssClass&&this.CssClass){this.element.className=this.CssClass;}
this.Disabled=false;};XartWebui_ComboBox.prototype.EnsureDomElement=function(){this.element=this.DomElement=document.getElementById(this.DomElementId);};XartWebui_ComboBox.prototype.Expand=function(){this.EnsureDomElement();var _2e=document.getElementById(this.Id+"_DropDown");var _2f=document.getElementById(this.Id+"_DropDownContent");if(_2e&&_2e.style.display=="none"){var x=qzAfx(this.element);var y=this.ExpandBaseLine=qzAfw(this.element)+(this.ExpandDirection==0?XartWebui_GetAdjustedHeight(this.element):-1);_2e.style.zIndex=90210;_2e.style.position="absolute";_2e.style.top=y+"px";_2e.style.left=x+"px";_2e.style.height="";_2e.style.visibility="hidden";_2e.style.display="";if(!this.DropDownWidth){this.DropDownWidth=XartWebui_GetAdjustedWidth(this.element);}
_2e.style.width=this.DropDownWidth+"px";_2f.style.width=this.DropDownWidth-(this.CacheMapWidth?this.CacheMapWidth:0)+"px";if(!this.DropDownHeight){if(this.HasDropDownContent){this.DropDownHeight=XartWebui_GetAdjustedHeight(_2f);this.ItemHeight=0;}else{if(_2f.childNodes.length>this.DropDownPageSize){this.DropDownHeight=_2f.childNodes[this.DropDownPageSize].offsetTop;this.ItemHeight=Math.round(this.DropDownHeight/this.DropDownPageSize);}else{this.ItemHeight=XartWebui_GetAdjustedHeight(_2f.firstChild);this.DropDownHeight=this.ItemHeight*this.DropDownPageSize;}}}
_2f.style.height=this.DropDownHeight+"px";_2f.style.overflow="auto";_2f.style.overflowX="hidden";var _32=XartWebui_GetAdjustedHeight(_2e);_2e.style.height="1px";_2e.style.overflow="hidden";_2e.style.visibility="";this.ExpandStartTime=(new Date()).getTime();this.ExpandElement=_2e;XartWebui_ComboBox_ExpandStep(this,_32);this.DropDownX=x;this.DropDownY=y;}
this.Expanded=true;};XartWebui_ComboBox.prototype.Fetch=function(_33,_34){var _35=document.getElementById(this.Id+"_CacheMap");if(_35){for(var i=_33;i<_33+_34;i++){this.Data[i]=[];}
this.RenderCacheMap(_35);}
var url=this.CallbackPrefix+"&Cart_"+this.Id+"_Callback_StartIndex="+_33+"&Cart_"+this.Id+"_Callback_NumItems="+_34;if(this.CallbackFilterString){url+="&Cart_"+this.Id+"_Callback_Filter="+this.CallbackFilterString;}
this.LoadedItemCount+=_34;while(this.LoadedItemCount>this.CacheSize){this.UnloadStalePage();}
this.Callback(url,_33);};XartWebui_ComboBox.prototype.Filter=function(_38){if(this.RunningMode==0){this.FilterString=_38.toLowerCase();this.RenderDropDown();return true;}else{if(_38&&this.CallbackFilterString&&_38.indexOf(this.CallbackFilterString)==0&&this.Data.length==this.ItemCount){this.FilterString=_38.toLowerCase();this.CallbackFilterString=_38;this.RenderDropDown();return true;}
var _39=false;var _3a=false;if(this.FilterCache){var _3b=_38.toLowerCase();var _3c=this.CallbackFilterString?this.CallbackFilterString.toLowerCase():"";var _3d=[_3c,this.ItemCount,this.Data.concat()];for(var i=0;i<this.FilterCache.length;i++){if(this.FilterCache[i][0]==_3b){_39=true;this.CallbackFilterString=_38;this.ItemCount=this.FilterCache[i][1];this.Data=this.FilterCache[i][2].concat();}
if(this.FilterCache[i][0]==_3c){_3a=true;}}
if(_3d&&!_3a){this.FilterCache=[_3d].concat(this.FilterCache);if(this.FilterCache.length>this.FilterCacheSize){this.FilterCache.length=this.FilterCacheSize;}}}
this.FilterString=null;if(_39){this.RenderDropDown();return true;}else{this.Data.length=0;this.CallbackFilterString=_38;this.ShowReloading();this.Fetch(0,this.DropDownPageSize*2);return false;}}};XartWebui_ComboBox.prototype.Focus=function(){var _3f=document.getElementById(this.Id+"_Input");if(_3f){try{_3f.focus();}
catch(ex){}}
this.Focused=true;};XartWebui_ComboBox.prototype.GetClientTemplate=function(sID){if(this.ClientTemplates){for(var i=0;i<this.ClientTemplates.length;i++){if(this.ClientTemplates[i][0]==sID){return this.ClientTemplates[i][1];}}}
return null;};XartWebui_ComboBox.prototype.GetItem=function(_42){if(this.Data.length>_42&&_42>=0){var _43=this.Data[_42];if(_43){var _44=new XartWebui_ComboBoxItem(_43);for(var i=0;i<_43.length;i++){_44[_43[i][0]]=_43[i][1];}
if(_44.Text==null){_44.Text="";}
_44.ParentComboBox=this;_44.Index=_42;return _44;}else{return null;}}
return null;};XartWebui_ComboBox.prototype.GetSelectedItem=function(){if(this.SelectedIndex>=0){return this.GetItem(this.SelectedIndex);}
return null;};XartWebui_ComboBox.prototype.HandleBlur=function(e){if(this.CssClass&&this.FocusedCssClass&&this.element){this.element.className=this.CssClass;}
if(this.TextBoxFocusedCssClass){if(this.TextBoxEnabled){var _47=document.getElementById(this.Id+"_Input");if(_47){_47.className=this.TextBoxCssClass;}}else{var _48=document.getElementById(this.Id+"_TextBox");if(_48){_48.className=this.TextBoxCssClass;}}}
this.Focused=false;setTimeout(this.Id+".CollapseIfBlurred()",100);};XartWebui_ComboBox.prototype.HandleClick=function(e,o,_4b){this.Collapse();this.SelectItemByIndex(_4b);};XartWebui_ComboBox.prototype.HandleDropClick=function(e,o){XartWebui_CancelEvent(e);if(!this.Disabled){if(this.DropActiveImageUrl){o.src=this.DropActiveImageUrl;}
this.ToggleExpand();setTimeout(this.Id+".Focus()",10);}
return false;};XartWebui_ComboBox.prototype.HandleDropMouseUp=function(e,o){if(this.DropActiveImageUrl){if(this.DropHoverImageUrl){e.src=this.DropHoverImageUrl;}else{e.src=this.DropImageUrl;}}};XartWebui_ComboBox.prototype.HandleFocus=function(){this.EnsureDomElement();window.qqPa=this;if(this.FocusedCssClass&&this.element){this.element.className=this.FocusedCssClass;}
if(this.TextBoxEnabled){var _50=document.getElementById(this.Id+"_Input");_50.select();}
if(this.TextBoxFocusedCssClass){if(this.TextBoxEnabled){var _50=document.getElementById(this.Id+"_Input");if(_50){_50.className=this.TextBoxFocusedCssClass;}}else{var _51=document.getElementById(this.Id+"_TextBox");if(_51){_51.className=this.TextBoxFocusedCssClass;}}}
this.Focused=true;};XartWebui_ComboBox.prototype.HandleInputChange=function(){var _52=document.getElementById(this.Id+"_Input");if(_52.value!=this.InputValue){this.InputValue=_52.value;}else{return;}
var _53=_q105(_52);var _54=this.GetSelectedItem();if(_54&&_54.Text==this.InputValue){return;}
if(this.AutoFilter){var _55=_52.value;_55=_55.substring(0,_53);if(this.RunningMode==1){this.Expand();clearTimeout(this.FilterTimeout);this.FilterTimeout=setTimeout("if("+this.Id+".Filter('"+_55.replace("'","\\")+"')) {"+this.Id+".CompleteAndHighlight(); }",250);return;}else{this.Filter(_55);this.Expand();}}
if(this.AutoComplete||this.AutoHighlight){this.CompleteAndHighlight();}};XartWebui_ComboBox.prototype.HandleInputMouseOut=function(e,o){if(this.TextBoxHoverCssClass){if(this.TextBoxEnabled){var _58=document.getElementById(this.Id+"_Input");if(_58){_58.className=this.TextBoxCssClass;}}else{var _59=document.getElementById(this.Id+"_TextBox");if(_59){_59.className=this.TextBoxCssClass;}}}
if(this.DropHoverImageUrl){var _5a=document.getElementById(this.Id+"_DropImage");if(_5a){_5a.src=this.DropImageUrl;}}
if(this.CssClass&&this.HoverCssClass&&this.element){this.element.className=this.CssClass;}};XartWebui_ComboBox.prototype.HandleInputMouseOver=function(e,o){if(this.TextBoxHoverCssClass){if(this.TextBoxEnabled){var _5d=document.getElementById(this.Id+"_Input");if(_5d&&_5d.className==this.TextBoxCssClass){_5d.className+=" "+this.TextBoxHoverCssClass;}}else{var _5e=document.getElementById(this.Id+"_TextBox");if(_5e&&_5e.className==this.TextBoxCssClass){_5e.className+=" "+this.TextBoxHoverCssClass;}}}
if(this.DropHoverImageUrl){var _5f=document.getElementById(this.Id+"_DropImage");if(_5f){_5f.src=this.DropHoverImageUrl;}}
if(this.CssClass&&this.HoverCssClass&&this.element&&this.element.className==this.CssClass){this.element.className+=" "+this.HoverCssClass;}};XartWebui_ComboBox.prototype.HandleItemMouseOver=function(e,o,_62){if(XartWebui_Contains(o,XartWebui_FromElement(e))){return;}
o.className+=" "+this.CssClasses[_62].Hover;};XartWebui_ComboBox.prototype.HandleItemMouseOut=function(e,o,_65){if(XartWebui_Contains(o,XartWebui_ToElement(e))){return;}
o.className=this.CssClasses[_65].Base;};XartWebui_ComboBox.prototype.HandleKeyPress=function(e,o){var _68=cart_browser_ie?e.keyCode:e.which;if(_68==8){var _69=_q105(o);var _6a=cart_browser_ie7?2:1;if(_69>_6a){o.value=o.value.substring(0,_69-_6a);XartWebui_SetSelectionRange(o,_69-_6a,o.value.length);}else{o.value="";XartWebui_SetSelectionRange(o,0,0);}
XartWebui_CancelEvent(e);}else{if(_68==13){this.Collapse();XartWebui_CancelEvent(e);if(this.AutoPostBack){this.PostBack();}
return;}}
setTimeout(this.Id+".HandleInputChange()",1);};XartWebui_ComboBox.prototype.HandleMouseDown=function(e,o){XartWebui_CancelEvent(e);if(this.ResizeArea){_qE1=this;var _6d=document.getElementById(this.Id+"_DropDown");if(this.DropDownResizingStyle=="Outline"){XartWebui_ComboBox_ResizingContentObj=null;XartWebui_ComboBox_ResizingFrameObj=document.createElement("div");XartWebui_ComboBox_ResizingFrameObj.style.zIndex=90211;XartWebui_ComboBox_ResizingFrameObj.style.border="1px solid #505050";XartWebui_ComboBox_ResizingFrameObj.style.position="absolute";XartWebui_ComboBox_ResizingFrameObj.style.top=qzAfw(_6d)+"px";XartWebui_ComboBox_ResizingFrameObj.style.left=qzAfx(_6d)+"px";XartWebui_ComboBox_ResizingFrameObj.style.height=XartWebui_GetAdjustedHeight(_6d)+"px";XartWebui_ComboBox_ResizingFrameObj.style.width=XartWebui_GetAdjustedWidth(_6d)+"px";document.body.insertBefore(XartWebui_ComboBox_ResizingFrameObj,document.body.firstChild);}else{XartWebui_ComboBox_ResizingContentObj=document.getElementById(this.Id+"_DropDownContent");XartWebui_ComboBox_ResizingFrameObj=_6d;}
XartWebui_ComboBox_ResizingLastX=cart_browser_ie?event.clientX+(document.documentElement&&document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft):e.pageX;XartWebui_ComboBox_ResizingLastY=cart_browser_ie?event.clientY+(document.documentElement&&document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop):e.pageY;this.Resizing=true;var _6e=document.getElementById(this.Id+"_CacheMap");if(_6e){_6e.innerHTML="";}
document.onmousemove=_qDF;document.onmouseup=_qE0;}
setTimeout(this.Id+".Focus()",10);return false;};XartWebui_ComboBox.prototype.HandleMouseMove=function(e,o){var _71=15;if(this.Resizing){return true;}else{var _72=cart_browser_ie?event.clientX+(document.documentElement&&document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft):e.pageX;var _73=cart_browser_ie?event.clientY+(document.documentElement&&document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop):e.pageY;if(this.DropDownResizingMode=="Corner"){if(Math.abs(_72-(this.DropDownX+this.DropDownWidth))<_71&&Math.abs(_73-(this.DropDownY+this.DropDownHeight))<_71){this.ResizeArea=true;o.style.cursor="se-resize";}}else{if(this.DropDownResizingMode=="Bottom"){if(Math.abs(_73-(this.DropDownY+this.DropDownHeight))<_71){this.ResizeArea=true;o.style.cursor="s-resize";}}}}};XartWebui_ComboBox.prototype.HandleMouseOut=function(e,o){this.ResizeArea=false;o.style.cursor="";};XartWebui_ComboBox.prototype.HandleMouseUp=function(e,o){if(this.Scrolling){clearTimeout(this.FetchTimeout);this.HandleScrollFetch();}};XartWebui_ComboBox.prototype.HandleScroll=function(e,o){if(this.RunningMode!=1){return;}
this.Scrolling=true;var _7a=Math.round((o.scrollTop*(this.ItemCount-1))/(o.scrollHeight-o.offsetHeight));clearTimeout(this.FetchTimeout);if(_7a>=0&&_7a<this.ItemCount){var _7b=Math.floor(_7a/this.DropDownPageSize);this.PageViews[_7b]=++this.PageViewOrder;this.ScrollIndex=_7a;this.FetchTimeout=setTimeout(this.Id+".HandleScrollFetch()",500);}};XartWebui_ComboBox.prototype.HandleScrollFetch=function(){this.Scrolling=false;var _7c=this.ScrollIndex;var _7d=this.DropDownPageSize*2;var _7e=_7c-_7c%this.DropDownPageSize;var _7f=_7e+this.DropDownPageSize;if(!this.Data[_7c]||!this.Data[_7e]||!this.Data[_7f]){var _80=!this.Data[_7c]?_7c:!this.Data[_7e]?_7e:_7f;var _81=_80;for(var i=0;i<_7d&&_81>0;i++){if(this.Data[_81-1]){break;}
_81--;}
var _83=_80;for(var i=0;i<_7d&&_83<this.ItemCount;i++){if(this.Data[_83]){break;}
_83++;}
this.Fetch(_81,_83-_81);}};XartWebui_ComboBox.prototype.HideOverlay=function(){if(this.OverlayElement){this.OverlayElement.style.display="none";}};XartWebui_ComboBox.prototype.HideReloading=function(){if(this.CallbackProgressDomObj){this.CallbackProgressDomObj.style.display="none";}};XartWebui_ComboBox.prototype.Initialize=function(){_q123(this);if(this.EnableViewState){XartWebui_ClientStateControls[XartWebui_ClientStateControls.length]=this;}
this.PageViews=[1];this.PageViewOrder=1;this.LoadedItemCount=this.Data.length;this.TextCache=[];this.CssClasses=[];if(this.AutoFilter){this.FilterCache=[];}
var _84=document.getElementById(this.Id+"_Input");if(_84){_84.style.width="1px";_84.style.visibility="hidden";_84.style.display="";var _85=XartWebui_GetAdjustedWidth(_84,0);_84.style.width=(XartWebui_GetAdjustedWidth(_84.parentNode)+_85)+"px";_84.style.visibility="";_84.XartWebuiInput=true;}
var _86=document.getElementById(this.Id+"_DropDown");if(_86&&_86.parentNode){_86.parentNode.removeChild(_86);document.body.insertBefore(_86,document.body.firstChild);}
var _87=document.createElement("div");_87.style.position="absolute";_87.style.visibility="hidden";document.body.insertBefore(_87,document.body.firstChild);this.ContainerObj=_87;this.Render(true);var _88=document.getElementById(this.Id+"_DropDownContent");if(_88){_88.onfocus=new Function(this.Id+".Focus()");}
if(!this.Enabled){this.Disable();}
var _89=this.get_events().getHandler("load");if(_89){_89(this,Sys.EventArgs.Empty);}};XartWebui_ComboBox.prototype.LoadItems=function(_8a,_8b){if(_8a.length>0){for(var i=0;i<_8a.length;i++){this.Data[_8b+i]=_8a[i];var _8d=Math.floor((_8b+i)/this.DropDownPageSize);this.PageViews[_8d]=++this.PageViewOrder;}}};XartWebui_ComboBox.prototype.LoadParams=function(_8e){for(var _8f=0;_8f<_8e.length;_8f++){var _90=_8e.item(_8f);var _91=_90.nodeName;var _92=_90.firstChild?_90.firstChild.nodeValue:null;this[_91]=_92;}};XartWebui_ComboBox.prototype.RemoveItemAt=function(_93){if(_93>=0&&_93<this.Data.length){this.Data=this.Data.slice(0,_93).concat(this.Data.slice(_93+1));this.ItemCount--;this.LoadedItemCount--;this.TextCache.length=0;this.CssClasses.length=0;}};XartWebui_ComboBox.prototype.Render=function(_94){this.element=this.DomElement=document.getElementById(this.DomElementId);if(this.element){this.element.className=this.CssClass;}
if(this.TextBoxClientTemplateId){var _95=document.getElementById(this.Id+"_TextBox");if(_95){var _96=this.GetClientTemplate(this.TextBoxClientTemplateId);if(_96){var _97=XartWebui_InstantiateClientTemplate(_96,this,this.GetSelectedItem());if(_97){var _98="#$InputBox";if(_97.indexOf(_98)>=0){var _99=document.getElementById(this.Id+"_Input");if(_99){if(this.InputBox){this.RestoreInputBox();}
var _9a="<div id=\""+this.Id+"_InputBoxPlaceHolder\" style=\"overflow:hidden;height:"+_99.offsetHeight+"px;width:"+_99.offsetWidth+"px;\">&nbsp;</div>";_97=_97.replace(_98,_9a);var _9b=document.createElement("div");_9b.innerHTML=_9a;this.ContainerObj.appendChild(_99.parentNode.replaceChild(_9b,_99));this.InputBox=_99;}}
_95.innerHTML=_97;if(this.InputBox){clearTimeout(this.RestoreInputBoxTimeout);this.RestoreInputBoxTimeout=setTimeout(this.Id+".RestoreInputBox()",0);}}}}}else{if(this.TextBoxEnabled){var _99=document.getElementById(this.Id+"_Input");if(_99){_99.className=this.TextBoxCssClass;}}else{var _95=document.getElementById(this.Id+"_TextBox");if(_95){_95.className=this.TextBoxCssClass;}}}
var _9c=document.getElementById(this.Id+"_CacheMap");if(_9c){this.RenderCacheMap(_9c);}
if(_94){this.RenderDropDown();}};XartWebui_ComboBox.prototype.RenderCacheMap=function(_9d){var _9e=["<table width=\""+this.CacheMapWidth+"\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">"];for(var i=0;i<_9d.offsetHeight;i++){var _a0=this.Data[Math.round((i*this.ItemCount)/_9d.offsetHeight)];var _a1=_a0?(_a0.length==0?this.CacheMapLoadingColor:this.CacheMapLoadedColor):this.CacheMapNotLoadedColor;_9e[_9e.length]="<tr><td height=\"1\" bgcolor=\""+_a1+"\"></td></tr>";}
_9e[_9e.length]="</table>";_9d.innerHTML=_9e.join("");};XartWebui_ComboBox.prototype.RenderDropDown=function(){if(this.HasDropDownContent){return;}
var _a2=document.getElementById(this.Id+"_DropDownContent");if(_a2){var _a3=0;var _a4=[];for(var i=0;i<this.ItemCount;i++){var _a6=i<this.Data.length?this.GetItem(i):null;if(_a6){this.TextCache[i]=_a6.Text.toLowerCase();if(!this.FilterString||(this.FilterString&&this.TextCache[i].indexOf(this.FilterString)==0)){if(_a3>0){this.RenderMissingItems(_a4,_a3);_a3=0;}
this.RenderItem(_a6,_a4);}}else{_a3++;}}
if(_a3>0){this.RenderMissingItems(_a4,_a3);_a3=0;}
_a2.innerHTML=_a4.join("");}};XartWebui_ComboBox.prototype.RenderItem=function(_a7,_a8){var _a9=_a7.CssClass?_a7.CssClass:this.ItemCssClass;if(!_a7.Enabled&&this.DisabledItemCssClass){_a9+=" "+this.DisabledItemCssClass;}
if(this.SelectedItemCssClass&&_a7.Index==this.SelectedIndex){_a9+=" "+this.SelectedItemCssClass;}
var _aa=this.SelectedItemHoverCssClass&&_a7.Index==this.SelectedIndex?this.SelectedItemHoverCssClass:this.ItemHoverCssClass;this.CssClasses[_a7.Index]={"Base":_a9,"Hover":_aa};_a8[_a8.length]="<div style=\"text-wrap:none;\" id=\""+this.Id+"_item_"+_a7.Index+"\"";if(_a9){_a8[_a8.length]=" class=\""+_a9+"\"";}
if(_a7.Enabled){if(_aa){_a8[_a8.length]=" onmouseover=\""+this.Id+".HandleItemMouseOver(event,this, "+_a7.Index+");\"";_a8[_a8.length]=" onmouseout=\""+this.Id+".HandleItemMouseOut(event,this, "+_a7.Index+");\"";}
_a8[_a8.length]=" onclick=\""+this.Id+".HandleClick(event,this,"+_a7.Index+")\"";}
_a8[_a8.length]=" onmousedown=\"XartWebui_CancelEvent(event)\"><nobr>";var _ab=_a7.ClientTemplateId?_a7.ClientTemplateId:this.ItemClientTemplateId;if(_ab){var _ac=this.GetClientTemplate(_ab);if(_ac){var _ad=XartWebui_InstantiateClientTemplate(_ac,this,_a7);if(_ad){_a8[_a8.length]=_ad;}}}else{_a8[_a8.length]=_a7.Text;}
_a8[_a8.length]="</nobr></div>";};XartWebui_ComboBox.prototype.RenderMissingItem=function(_ae){_ae[_ae.length]="<div style=\"visibility:hidden;overflow:hidden;\" class=\""+this.ItemCssClass+"\">&nbsp;</div>";};XartWebui_ComboBox.prototype.RenderMissingItems=function(_af,_b0){_af[_af.length]="<div style=\"visibility:hidden;overflow:hidden;height:"+(_b0*this.ItemHeight)+"px;\">&nbsp;</div>";};XartWebui_ComboBox.prototype.RestoreInputBox=function(){if(this.InputBox){var _b1=document.getElementById(this.Id+"_InputBoxPlaceHolder");if(_b1){_b1.parentNode.replaceChild(this.InputBox,_b1);this.InputBox.focus();this.InputBox=null;}else{clearTimeout(this.RestoreInputBoxTimeout);this.RestoreInputBoxTimeout=setTimeout(this.Id+".RestoreInputBox()",10);}}};XartWebui_ComboBox.prototype.SaveData=function(){var _b2=document.getElementById(this.Id+"_Data");if(_b2){_b2.value=XartWebui_ArrayToXml(this.Data,true);}};XartWebui_ComboBox.prototype.ScrollIntoView=function(_b3){var _b4=document.getElementById(this.Id+"_item_"+_b3);var _b5=document.getElementById(this.Id+"_DropDownContent");if(_b4){if(_b4.offsetTop+_b4.offsetHeight>_b5.scrollTop+_b5.offsetHeight||_b4.offsetTop<_b5.scrollTop){_b5.scrollTop=_b4.offsetTop;}}};XartWebui_ComboBox.prototype.SelectItem=function(_b6){if(!_b6.Enabled){return;}
var _b7=_b6.Index;if(this.SelectedItemCssClass){if(this.SelectedIndex>=0){var _b8=this.GetItem(this.SelectedIndex);if(_b8){var _b9=_b8.CssClass?_b8.CssClass:this.ItemCssClass;this.CssClasses[this.SelectedIndex].Base=_b9;if(this.ItemHoverCssClass){this.CssClasses[this.SelectedIndex].Hover=_b9+" "+this.ItemHoverCssClass;}
var _ba=document.getElementById(this.Id+"_item_"+this.SelectedIndex);if(_ba){_ba.className=_b9;}}}
this.CssClasses[_b7].Base+=" "+this.SelectedItemCssClass;if(this.SelectedHoverCssClass){this.CssClasses[_b7].Hover+=" "+this.SelectedHoverCssClass;}
var _bb=document.getElementById(this.Id+"_item_"+_b7);if(_bb){_bb.className=this.CssClasses[_b7].Base;}}
this.SelectedIndex=_b7;var _bc=document.getElementById(this.Id+"_SelectedIndex");if(_bc){_bc.value=_b7;}
var _bd=document.getElementById(this.Id+"_Input");if(_bd){_bd.value=_b6.Text;}
this.Render();this.ScrollIntoView(_b7);var _be=this.get_events().getHandler("change");if(_be){_be(this,Sys.EventArgs.Empty);}
if(this.AutoPostBack){this.Postback();}};XartWebui_ComboBox.prototype.SelectItemByIndex=function(_bf){var _c0=this.GetItem(_bf);if(_c0){this.SelectItem(_c0);}};XartWebui_ComboBox.prototype.ShowOverlay=function(){if(!cart_browser_ie){return;}
if(!this.OverlayElement){var _c1=document.createElement("iframe");_c1.src="javascript:false";_c1.style.position="absolute";if(cart_browser_ie){_c1.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";}else{_c1.style.opacity=0;_c1.style.setProperty("-moz-opacity",0,"");}
document.body.insertBefore(_c1,document.body.firstChild);this.OverlayElement=_c1;}
var _c2=document.getElementById(this.Id+"_DropDown");this.OverlayElement.style.top=qzAfw(_c2)+"px";this.OverlayElement.style.left=qzAfx(_c2)+"px";this.OverlayElement.style.width=_c2.offsetWidth+"px";this.OverlayElement.style.height=_c2.offsetHeight+"px";this.OverlayElement.style.border="1px solid black";this.OverlayElement.style.display="block";};XartWebui_ComboBox.prototype.ShowReloading=function(){var _c3=document.getElementById(this.Id+"_DropDownContent");_c3.innerHTML="";if(!this.Expanded){return;}
if(!this.CallbackProgressDomObj){this.CallbackProgressDomObj=document.createElement("div");this.CallbackProgressDomObj.style.position="absolute";this.CallbackProgressDomObj.style.display="none";this.CallbackProgressDomObj.style.textAlign="center";if(this.LoadingClientTemplateId){var _c4=this.GetClientTemplate(this.LoadingClientTemplateId);if(_c4){var _c5=XartWebui_InstantiateClientTemplate(_c4,this,null);if(_c5){this.CallbackProgressDomObj.innerHTML=_c5;}}}else{this.CallbackProgressDomObj.innerHTML=this.LoadingText;}
document.body.insertBefore(this.CallbackProgressDomObj,document.body.firstChild);}
var _c3=document.getElementById(this.Id+"_DropDownContent");if(_c3){this.CallbackProgressDomObj.style.top=qzAfw(_c3)+"px";this.CallbackProgressDomObj.style.left=qzAfx(_c3)+"px";this.CallbackProgressDomObj.style.width=XartWebui_GetAdjustedWidth(_c3)+"px";this.CallbackProgressDomObj.style.height=XartWebui_GetAdjustedHeight(_c3)+"px";this.CallbackProgressDomObj.style.zIndex=_c3.style.zIndex+1;this.CallbackProgressDomObj.style.display="";}};XartWebui_ComboBox.prototype.ToggleExpand=function(){if(this.Expanded){this.Collapse();}else{this.Expand();}};XartWebui_ComboBox.prototype.UnloadStalePage=function(){var _c6=this.PageViews.slice().sort(function(a,b){return(!a?1:!b?-1:a-b);});var _c9=_c6[0];for(var i=0;i<this.PageViews.length;i++){if(this.PageViews[i]==_c9){this.PageViews[i]=null;var _cb=i*this.DropDownPageSize;var _cc=_cb+this.DropDownPageSize;for(var j=_cb;j<_cc;j++){this.Data[j]=null;}
this.LoadedItemCount-=(_cc-_cb);break;}}};window.XartWebui_ComboBox_Kernel_Loaded=true;}