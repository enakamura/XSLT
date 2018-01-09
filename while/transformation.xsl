<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:strip-space elements="*" />
        <xsl:template match="/">
                
                <ROOT>
                	<xsl:call-template name="while">
                		<xsl:with-param name="value1">100</xsl:with-param>
                		<xsl:with-param name="value2">30</xsl:with-param>
                		<xsl:with-param name="until">5</xsl:with-param>
                	</xsl:call-template>
                </ROOT>
        </xsl:template>
        
        <xsl:template name="while">
        	<xsl:param name="value1"></xsl:param>
        	<xsl:param name="value2"></xsl:param>
        	<xsl:param name="until"></xsl:param>
        	<xsl:choose>
        		<xsl:when test="$until = 0">
        			<xsl:value-of select="concat('SELECT ',$value1 + 1,' AS NOME, ',$value2 + 1,' AS IDADE FROM DUAL;', '&#10;')"/>
        		</xsl:when>
        		<xsl:otherwise>
        			<xsl:value-of select="concat('SELECT ',$value1 + 1,' AS NOME, ',$value2 + 1,' AS IDADE FROM DUAL UNION', '&#10;')"/>
        			<xsl:call-template name="while">
        				<xsl:with-param name="value1" select="$value1 + 1"></xsl:with-param>
                		<xsl:with-param name="value2" select="$value2 + 1"></xsl:with-param>
        				<xsl:with-param name="until" select="$until - 1"></xsl:with-param>
        			</xsl:call-template>
        		</xsl:otherwise>
        	</xsl:choose>
        </xsl:template>
</xsl:stylesheet>
