<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<xsl:variable name="resultado">
			<xsl:call-template name="comparaData">
				<xsl:with-param name="data1"><xsl:value-of select="root/data1"/></xsl:with-param>
				<xsl:with-param name="data2"><xsl:value-of select="root/data2"/></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:if test="$resultado = 'maior'">
			<xsl:text>data1 é maior</xsl:text>
		</xsl:if>
		<xsl:if test="$resultado = 'igual'">
			<xsl:text>data1 é igual a data2</xsl:text>
		</xsl:if>
		<xsl:if test="$resultado = 'menor'">
			<xsl:text>data2 é maior</xsl:text>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template name="comparaData">
		<!-- Compara data1 com data2.
		Se data1 > data2 retorna 'maior'
		Se data1 = data2 retorna 'igual'
		Se data1 < data2 retorna 'menor' -->
		<xsl:param name="data1"/>
		<xsl:param name="data2"/>
		<xsl:variable name="data1formated" select="translate($data1,'-T:','')"></xsl:variable>
		<xsl:variable name="data2formated" select="translate($data2,'-T:','')"></xsl:variable>
		<xsl:if test="$data1formated &gt; $data2formated">
			<xsl:text>maior</xsl:text>
		</xsl:if>
		<xsl:if test="$data1formated = $data2formated">
			<xsl:text>igual</xsl:text>
		</xsl:if>
		<xsl:if test="$data1formated &lt; $data2formated">
			<xsl:text>menor</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
