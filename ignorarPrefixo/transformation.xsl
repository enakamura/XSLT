<?xml version="1.0" encoding="ISO-8859-1" ?>
<!-- comentario 
Quando usamos XSLT 1.0, nao conseguimos usar o wildcard * para substituir o prefixo no xpath.
Para selecionarmos um elementos sem importar o prefixo dele, temos que usar a funcao local-name().
Para usar essa funcao, temos que declarar dentro de um *[]
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:output indent="yes"/>
	<xsl:template match="/">

		<ROOT>
			<BODY>
				<code><xsl:value-of select="//ROOT/BODY/OUTPUT//*[local-name()='result-code']"/></code>
			</BODY>
		</ROOT>

	</xsl:template>
</xsl:stylesheet>
