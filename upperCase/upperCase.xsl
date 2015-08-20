
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- As variaveis sao imutaveis no XSLT -->
<!-- Para utilizar um contador, é necessario utilizar recursividade no template -->
<!-- O template precisa chamar ele mesmo passando como parametro a variavel com valor + 1 -->
	
	<xsl:template match="/">
		<root>
			<xsl:variable name="texto" select="/root"></xsl:variable>
			<xsl:call-template name="upperCase">
				<xsl:with-param name="text" select="$texto"></xsl:with-param>
			</xsl:call-template>
		</root>
	</xsl:template>
	
	<xsl:template name="upperCase">
		<xsl:param name="text"/>
		<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
		<xsl:value-of select="translate($text,$smallcase,$uppercase)"/>
	</xsl:template>

</xsl:stylesheet>
