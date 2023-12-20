<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="iso-8859-1"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body style="width:20cm;">
				<h1 style="text-align:center;">
					<xsl:value-of select="/photos/titre"/>
				</h1>
				<xsl:apply-templates select="//signature"/>
				<!--pour chaque /photos/pages/page -->
				<xsl:for-each select="//page">
					<!--contenu de la boucle-->
					<table style="page-break-before:always;width:20cm;height:28.7cm;border:1px solid black">
						<tbody>
							<tr>
								<xsl:apply-templates select="image[position() &lt;= 2]"/>
							</tr>
							<xsl:if test="count(image)>2">
								<tr>
									<xsl:apply-templates select="image[position() &gt; 2]"/>
								</tr>
							</xsl:if>
							<!--si else if else usage de <xsl:choose>
								<xsl:when test="test1">si test1 vrai</xsl:when>
								<xsl:when test="test2">sinon si test2 vrai </xsl:when>
								<xsl:otherwise>sinon</xsl:otherwise>
							</xsl:choose>-->
						</tbody>
					</table>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="image">
		<th>
			<xsl:value-of select="."/>
			<br/>
			<img src="{@path}{@href}" alt="" style="max-width:8.5cm"/>
		</th>
	</xsl:template>
	<xsl:template match="signature">
		<div style="text-align:center; margin-top:10cm;font-size:x-large;font-weight:700;">
			<div style="font-size:xx-large;font-weight:900;">Contact</div>
			<xsl:value-of select="mail"/> - <xsl:value-of select="tel"/>
		</div>
	</xsl:template>
</xsl:stylesheet>
