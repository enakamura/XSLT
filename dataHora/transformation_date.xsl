<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--converter YYYYDDMM para MM/DD/YYYY-->	
	<xsl:template name="formataData">
		<xsl:param name="data"/>
		<xsl:variable name="dia" select="substring($data,7,2)"/>
		<xsl:variable name="mes" select="substring($data,5,2)"/>
		<xsl:variable name="ano" select="substring($data,1,4)"/>
		<xsl:value-of select="concat($dia,'/',$mes,'/',$ano)"/>
	</xsl:template>
</xsl:stylesheet>
