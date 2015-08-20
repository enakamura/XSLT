
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- variaveis sao imutaveis -->
<!-- ou seja, ela continua a armazenar o valor que ela possui -->
<!-- no exemplo abaixo temos um loop para chamada de um template -->
<!-- no primeiro exemplo, a cada iteracao do loop temos a impressao de um elemento 'item' com o resultado da chamda do template.
Podemos ver que ele exibe o resultado de cada elemento de forma individual -->
<!-- no segundo exemplo, temos toda a iteracao realizada e armazenada em uma variavel, para depois ser feita a impressao dela.
Podemos ver que ele exibe o resultado de cada iteracao concatenada na iteracao anterior-->

<!-- Qual a diferença do primeiro para o segundo exemplo?
Ele se comporta da mesma forma, mas no primeiro temos a ilusao de que ele nao esta armazendando o valor da iteracao anterior.
Mas esta, a unica diferenca do primeiro exemplo para o segundo é que estamos pedindo para ele exibir cada iteracao dentro de um elemento 'item'-->

	<xsl:template match="/">
		<root>
			<xsl:for-each select="//item">
				<item>
					<xsl:call-template name="sum">
						<xsl:with-param name="value" select="."></xsl:with-param>
					</xsl:call-template>
				</item>
			</xsl:for-each>
			
			<xsl:variable name="soma">
				<xsl:for-each select="//item">
					<xsl:call-template name="sum">
						<xsl:with-param name="value" select="."></xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:variable>
			<item>
				<xsl:copy-of select="$soma"/>
			</item>
		</root>
	</xsl:template>
	
	<xsl:template name="sum">
		<xsl:param name="value"/>
		<xsl:value-of select="$value+1"/>
	</xsl:template>
</xsl:stylesheet>
