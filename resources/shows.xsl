<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"
	omit-xml-declaration="yes"
	media-type="text/html"
	encoding="utf-8"
	doctype-system="about:legacy-compat" />

<xsl:template match="annual">
	<tr>
		<xsl:apply-templates select="year"/>
	</tr>

	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="red"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>

		<xsl:apply-templates select="show"/>

	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
</xsl:template>

<xsl:template match="show">
	<tr>
		<xsl:apply-templates select="date"/>
				
		<td>
			<xsl:apply-templates select="headliner"/>
			<xsl:apply-templates select="support"/>
		</td>

		<xsl:apply-templates select="venue"/>

		<xsl:apply-templates select="notes"/>
	</tr>
	
	<tr><td/><td bgcolor="red" colspan="4"/></tr>
	<tr bgcolor="white"><td colspan="5"/></tr>
</xsl:template>

<xsl:template match="year">
	<td>
		<span class="year">
			<xsl:value-of select="."/>
		</span>
	</td>
</xsl:template>

<xsl:template match="date">
	<td/>
	<td> 
		<span class="date">
			<xsl:value-of select="."/>
		</span>
	</td>
</xsl:template>

<xsl:template match="venue">
	<td> 
		<span class="venue">
			<xsl:value-of select="."/>
		</span>
	</td>
</xsl:template>

<xsl:template match="headliner">
	<xsl:choose>
		<xsl:when test="setlist">
			<span class="headliner">
				<a href="javascript:slideLayer('name');">
					<xsl:value-of select="name"/>
				</a>
			</span>
			<br/>
			<xsl:apply-templates select="setlist"/>
		</xsl:when>
		<xsl:otherwise>
			<span class="headliner">
				<xsl:value-of select="name"/>
			</span>
			<br/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="support">
	<xsl:choose>
		<xsl:when test="setlist">
			<span class="support">
				<a href="javascript:slideLayer('name');">
					<xsl:value-of select="name"/>
				</a>
			</span>
			<br/>
			<xsl:apply-templates select="setlist"/>
		</xsl:when>
		<xsl:otherwise>
			<span class="support">
				<xsl:value-of select="name"/>
			</span>
			<br/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="setlist">
	<span class="song">
		<div style="display: none" id="name">		
			<xsl:apply-templates select="song"/>
		</div>
	</span>
</xsl:template>

<xsl:template match="song">
	<xsl:value-of select="."/>
	<br/>
</xsl:template>

<xsl:template match="notes">
	<td> 
		<span class="notes">
			<xsl:value-of select="."/>
		</span>
	</td>
</xsl:template>

<xsl:template match="/">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> </meta>

<title>Gigography</title>

<link rel="stylesheet" href="resources/style.css" type="text/css"> </link>

</head>

<body class="mid">

<h2> Gigography </h2>

<a href="#recent">See Most Recent</a>

<br/>

<br/>

<table border="0" width="80%">
	<tr bgcolor="#99FFFF" align="left">
		<td>Year</td>
		<td>Date</td>
		<td>Performers</td>
		<td>Venue</td>
		<td>Notes</td>
	</tr>
	<xsl:apply-templates/>
</table>

<a name="recent"></a>

<xsl:for-each select="name">
<xsl:sort select="name"  order="descending"/>
<xsl:if test="position()=1">
	Most common value: "<xsl:value-of select="current()"/>" (<xsl:value-of select="count(//show/annual/show/headliner/name/contents[text()=current()])"/>)
</xsl:if>               
</xsl:for-each>

</body>

</html>

</xsl:template>

</xsl:stylesheet>