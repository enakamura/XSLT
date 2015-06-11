<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- As variaveis sao imutaveis no XSLT -->
<!-- Para utilizar um contador, é necessario utilizar recursividade no template -->
<!-- O template precisa chamar ele mesmo passando como parametro a variavel com valor + 1 -->

	<xsl:template match="/">
		<root>
			<xsl:variable name="counter" select="1"></xsl:variable>
			<xsl:call-template name="loop">
				<xsl:with-param name="loopCounter" select="$counter"></xsl:with-param>
			</xsl:call-template>
		</root>
	</xsl:template>

	<xsl:template name="loop">
		<xsl:param name="loopCounter"></xsl:param>
		<loopCounter>
			<xsl:value-of select="$loopCounter"/>
		</loopCounter>
		<!-- teste para saber quando parar a chamada recursiva -->
		<xsl:if test="$loopCounter &lt;= 5">
			<xsl:call-template name="loop">
				<!-- chama o template com contador + 1 -->
				<xsl:with-param name="loopCounter" select="$loopCounter+1"></xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
