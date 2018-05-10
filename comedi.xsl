<?xml version='1.0'?>
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY site "file:///home/ds/cvs/comedi-www/src">
  <!-- <!ENTITY site "http://www.comedi.org"> -->
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

	<xsl:output method="xml" indent="yes"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>

	<!-- identify even/odd table rows so we can apply alternating color scheme -->
	<xsl:template match="table">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:for-each select="*">
				<xsl:copy>
					<xsl:if test="name()='tr'">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 0">even</xsl:when>
								<xsl:otherwise>odd</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:if>
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</xsl:copy>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

<xsl:template match="page">
<xsl:param name="title" select="Big_Kitten_LLC" />
<xsl:param name="content" />

<html xml:lang="en" lang="en">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <meta name="GENERATOR" content="Mozilla/4.7 [en] (X11; I; Linux 2.3.50 i686) [Netscape]" />
   <xsl:apply-templates select="title"/>
		<link rel="stylesheet" href="comedi-www.css" type="text/css"/>
</head>
<body>


<table border="0" width="99%" align="center" cellpadding="2" cellspacing="2"
	bgcolor="#ffffff">
<tr valign="top">
<td valign="top" rowspan="5">
<center>
<font size="8" face="arial,helvetica"><b>
<img width="417" src="images/comedi_logo.png" srcset="images/comedi_logo.svg" alt="Comedi - The Linux Control and Measurement Interface" />
</b></font>
</center>
</td>
</tr>
</table>

<table>
	<tr>
		<td>
			<div class="navigation-bar">
				<h4>Index</h4>
				<ul>
					<li><a href="index.html">Introduction</a></li>
					<li><a href="download.html">Download</a></li>
					<li><a href="documentation.html">Documentation</a></li>
					<li><a href="mailinglist.html">Mailing list</a></li>
					<li><a href="hardware.html">Supported<br/>hardware</a></li>
					<li><a href="links.html">Manufacturers</a></li>
					<li><a href="applications.html">Applications</a></li>
					<!-- <li><a href="https://bugzilla.comedi.org/cgi-bin/bugzilla/query.cgi">Bug Tracking</a></li> -->
				</ul>
				<h4>Links</h4>
				<ul>
					<li><a href="http://www.linux.org/">Linux</a></li>
					<li><a href="http://www.debian.org/">Debian</a></li>
					<li><a href="http://www.rtai.org/">RTAI</a></li>
					<li><a href="http://www.schleef.org/">David Schleef</a></li>
				</ul>
			</div>
		</td>
		<td>
			<div class="body">
				<xsl:apply-templates select="body/*"/>
			</div>
		</td>
	</tr>
</table>
</body>
</html>

</xsl:template>

</xsl:stylesheet>

