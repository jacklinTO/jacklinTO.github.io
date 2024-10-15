<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"
	omit-xml-declaration="yes"
	media-type="text/html"
	encoding="utf-8"
	doctype-system="about:legacy-compat" />

<xsl:template match="topic" mode="links">
	<li>
		<a class="text-white">
			<xsl:apply-templates select="link" mode="links"/>
			<xsl:apply-templates select="title" mode="links"/>
		</a>
  </li>
</xsl:template>

<xsl:template match="topic" mode="content">
  <div class="card border-secondary">
		<div class="card-header">
			<h3 style="float: left">
				<xsl:apply-templates select="link" mode="content"/>
				<i class="bi">
					<xsl:apply-templates select="icon" mode="content"/>
				</i>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="title"/>
			</h3>
			<xsl:apply-templates select="date" mode="content"/>
    </div>
    <ul class="list-group list-group-flush">
			<li class="list-group-item">
				<xsl:apply-templates select="pre" mode="content"/>
			  <br/>
				<xsl:apply-templates select="main" mode="content"/>
      </li>
		</ul>
	</div>
	<br/>
</xsl:template>

<xsl:template match="icon" mode="content">
	<xsl:attribute name="class">
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="link" mode="links">
	<xsl:attribute name="href">
		<xsl:text>#</xsl:text>
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="link" mode="content">
	<xsl:attribute name="id">
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="date" mode="content">
	<div style="float: right">
		<xsl:value-of select="."/>
	</div>
</xsl:template>

<xsl:template match="pre" mode="content">
	<div class="pre">
		<i>
			<xsl:value-of select="." disable-output-escaping="yes"/>
		</i>
	</div>
</xsl:template>

<xsl:template match="main" mode="content">
	<div class="main">
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</div>
</xsl:template>

<xsl:template match="/">

<html>
	<head>
		<title>Blog</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></link>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"></link>
		<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
		<link rel="icon" type="image/ico" href="resources/favicon.ico"></link>
	</head>
	<body>
		<div class="row">
			<div class="col-sm" align="right">
				<h2>
					<a href="index.html"><i class="bi bi-house-door-fill" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home"></i></a>
				</h2>
			</div>
		</div>
		
		<div class="container">
			<div class="clearfix">
				<div class="col">
					<h1>Pitch Black with Jack</h1>
					
					<div class="col">
						<div class="card text-white bg-primary">
							<div class="card-body">
								<ul>
									<xsl:apply-templates select="*" mode="links"/>
								</ul>								
							</div>
						</div>
					</div>
					
					<br/>
					
					<a name="recent"></a>
					
					<xsl:apply-templates select="*" mode="content"/>
				
				</div>
			</div>
		</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>