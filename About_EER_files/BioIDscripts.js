var szVersion = "3.10";
var szBuild = "1250";
var szDate = "03/03/2004";
var szTime = "12:28";

var szPreliminary = "[This is preliminary documentation and subject to change]";
var nColumns = 1;

function printHeader( caption )
{
	// that's the table arround the whole body (it is closed in printFooter)
	document.write("<table border=0 width='100%' cellspacing=0 cellpadding=0>");
	// the header row
	document.write("<tr><td align=left width='100%'>");
	// split columns
	document.write("<table width='100%' border=0 cellspacing=0 cellpadding=0><tr>");
	// 1. column - BioID logo
	document.write("<td bgColor='#000099' style='WIDTH: 100px' width=100 noWrap>");
	document.write("<IMG alt='BioID' border=0 height=34 src='images/BioID_inv.gif' width=100></td>");
	// 2. column - free for some text!?
	document.write("<td bgColor='#000099' noWrap class='header'>&nbsp;</td>");
	// 3. column - HumanScan manikin
	document.write("<td bgColor='#000099' style='WIDTH: 75px' width=75 noWrap>");
	document.write("<IMG alt=' ' border=0 height=34 src='images/Maennchen.gif' width=75></td>");
	if(nColumns == 2)
		document.write("</tr></table>");
	// 4. column - HumanScan logo
	document.write("<td style='WIDTH: 206px' width=206 noWrap>");
	document.write("<IMG alt='HumanScan' border=0 height=34 src='images/HumanScan.gif' width=206></td></tr>");
	if(nColumns != 2)
		document.write("</table></td></tr>");

	// the body follows - align borders
	document.write("<tr><td style='PADDING-LEFT: 10mm; PADDING-RIGHT: 5mm' vAlign=top><br>");

	// document title
	document.write("<h1>");
	if(caption != null)
	   document.write(caption);
	else
	  document.write(document.title);
	document.write("</h1>");
}

function printHeader2( caption )
{
	nColumns = 2;
	printHeader(caption);
}

function BeginSecondCol()
{
	document.write("</td><td>");
}

function EndSecondCol()
{
	document.write("</td></tr><tr><td style='PADDING-LEFT: 10mm; PADDING-RIGHT: 5mm' vAlign=top><br>");
}

function printFooter( preliminary )
{
	// begin of footer
	// end of surrounding table
	document.write("<br>");
	if(nColumns == 2)
		document.write("</td><td>&nbsp;");
	document.write("</td></tr></table>");

	// preliminary ?
	if(preliminary != null)
	{
		document.write("<div class='footer'><font color='red'>" + szPreliminary +"</font></div>");
		document.write("<hr style='COLOR: #000099' width='100%'>");
		document.write("<div align='center' class='footer'>");
	}
	else
	{
		document.write("<hr style='COLOR: #000099' width='100%'>");
		document.write("<div align='center' class='footer'>");
	}
	// Version / Date
	document.write("BioID Version " + szVersion + " (build " + szBuild + "), " + szDate + "<br>");
	// Feedback
	document.write("Send&nbsp;feedback&nbsp;to&nbsp;<A href='mailto:support@humanscan.de?Subject=BioID Reference Feedback'>support@humanscan.de</A><br>");
	// Copyright
	document.write("Copyright&nbsp;&copy;&nbsp;2004&nbsp;<a href='http://www.humanscan.de/' target='_blank'>HumanScan&nbsp;GmbH</a><br><br>");
	document.write("</div>");
	// end of footer
}
