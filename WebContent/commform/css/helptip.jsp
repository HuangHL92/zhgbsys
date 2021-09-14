<%@ page contentType="text/css; charset=GBK" language="java" %>
/*
	Notice that IE has a display problem if the help link is on
	the last line of a container with no padding. If this is the
	case increase the padding bottom to at least 1px
*/

a.helpLink {
	color:				Green;
	text-decoration:	none;
	border-bottom:		1px dashed Green;
	cursor:				help;
}

a.helpLink:hover {
	color:				Red;
	text-decoration:	none;
	border-bottom:		1px dashed Red;
}

.help-tooltip {
	position:	absolute;
	width:		250px;
	border:		1px Solid WindowFrame;
	background:	Infobackground;
	color:		InfoText;
	font:		StatusBar;
	font:		Status-Bar;
	padding:	3px;
	filter:		progid:DXImageTransform.Microsoft.Shadow(color="#777777", Direction=135, Strength=3);
	z-index:	10000;
}


.help-tooltip a,
.help-tooltip a:hover {
	color:		blue !important;
	background:	none;
}
