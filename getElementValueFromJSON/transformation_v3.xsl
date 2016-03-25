<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes" />
	<xsl:strip-space elements="*" />
	
	<xsl:template name="elementValue">
		<xsl:param name="source"></xsl:param>
		<xsl:param name="element"></xsl:param>
		<xsl:variable name="valueSelect">
			<xsl:value-of select="normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), ','))"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$valueSelect != ''">
				<xsl:choose>
					<xsl:when test="contains($valueSelect,'[')">
						<xsl:value-of select="normalize-space(translate(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')),']'),'[',''))"/>
					</xsl:when>
					<xsl:when test="normalize-space(substring-before($valueSelect, '}')) != ''">
						<xsl:value-of select="translate(normalize-space(substring-before($valueSelect, '}')),'&quot;','')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="translate($valueSelect,'&quot;','')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="translate(normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), '}')),'&quot;','')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="/">
		<ROOT>
			<xsl:variable name="OUTPUT" select="/ROOT/BODY" />
			<element>
				<xsl:call-template name="elementValue">
					<xsl:with-param name="source" select="$OUTPUT"/>
					<xsl:with-param name="element" select="'cpfCnpj'"/>
				</xsl:call-template>
			</element>
		</ROOT>
	</xsl:template>

</xsl:stylesheet>
