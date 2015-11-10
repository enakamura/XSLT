<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes" />
	<xsl:strip-space elements="*" />
	
	<xsl:template name="elementValue">
		<xsl:param name="source"></xsl:param>
		<xsl:param name="element"></xsl:param>
		<xsl:choose>
			<xsl:when test="normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), ',')) != ''">
				<xsl:value-of select="translate(normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), ',')),'&quot;','')"/>
			</xsl:when>
			<xsl:when test="normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), '&quot;')) != ''">
				<xsl:value-of select="translate(normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), '&quot;')),'&quot;','')"/>
			</xsl:when>			
			<xsl:when test="normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), '}')) != ''">
				<xsl:value-of select="translate(normalize-space(substring-before(substring-after($source, concat('&quot;',$element,'&quot;:')), '}')),'&quot;','')"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="/">
		<xsl:variable name="OUTPUT" select="/ROOT/BODY" />
		<resultCode>
			<xsl:call-template name="elementValue">
				<xsl:with-param name="source" select="$OUTPUT"/>
				<xsl:with-param name="element" select="'errorType'"/>
			</xsl:call-template>
		</resultCode>
	</xsl:template>

</xsl:stylesheet>
