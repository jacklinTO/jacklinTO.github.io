<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"
	omit-xml-declaration="yes"
	media-type="text/html"
	encoding="utf-8"
	doctype-system="about:legacy-compat" />

<xsl:template match="topic">
  <div class="card border-secondary">
		<div class="card-header">
			<!--<h3 id="topic-1" style="float: left"><i class="bi bi-book" data-bs-toggle="tooltip"></i>&nbsp;Topic 1</h3> -->
			<xsl:apply-templates select="date"/>
    </div>
    <ul class="list-group list-group-flush">
			<li class="list-group-item">
				<xsl:apply-templates select="pre"/>
			  <br/>
				<xsl:apply-templates select="main"/>
      </li>
		</ul>
	</div>
	<br/>
</xsl:template>

<xsl:template match="date">
	<div style="float: right">
		<xsl:value-of select="."/>
	</div>
</xsl:template>

<xsl:template match="pre">
	<div class="pre">
		<xsl:value-of select="."/>
	</div>
</xsl:template>

<xsl:template match="main">
	<div class="main">
		<xsl:value-of select="."/>
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
									<li><a href="#topic-1" class="text-white">Topic 1</a></li>
									<li><a href="#topic-2" class="text-white">Topic 2</a></li>
									<li><a href="#topic-3" class="text-white">Topic 3</a></li>
									<li><a href="#topic-4" class="text-white">Topic 4</a></li>
									<li><a href="#topic-5" class="text-white">Topic 5</a></li>
									<li><a href="#topic-6" class="text-white">Topic 6</a></li>
								</ul>								
							</div>
						</div>
					</div>
					<br/>
					
					<a name="recent"></a>
					
					<xsl:apply-templates/>
				
				</div>
			</div>
		</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>