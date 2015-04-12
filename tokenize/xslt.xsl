<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<root>
			<body <xsl:variable name="sequence" select="//sequence"></xsl:variable>
			<sequence>
				<xsl:value-of select="$sequence"/>
			</sequence>
			<itens>
				<xsl:call-template name="tokenize">
					<xsl:with-param name="texto" select="$sequence"></xsl:with-param>
				</xsl:call-template>
			</itens>
		</root>
	</root>
</xsl:template>
	
<xsl:template name="tokenize">
	<xsl:param name="texto"></xsl:param>
	<xsl:variable name="textoFormatado" select="concat($texto,',')"></xsl:variable>
	<xsl:if test="substring-before($textoFormatado,',') != ''">
		<item>
			<xsl:value-of select="substring-before($textoFormatado,',')"/>
		</item>
		<xsl:call-template name="tokenize">
			<xsl:with-param name="texto" select="substring-after($textoFormatado,',')"></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
