<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:variable name="input" select="ROOT/BODY/data"/>
        <xsl:call-template name="format">
            <xsl:with-param name="name">operation-type</xsl:with-param>
            <xsl:with-param name="element">
                <xsl:value-of select="$input/operation-type"/>
            </xsl:with-param>
            <xsl:with-param name="size">3</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="format">
            <xsl:with-param name="name">msisdn</xsl:with-param>
            <xsl:with-param name="element">
                <xsl:value-of select="$input/msisdn"/>
            </xsl:with-param>
            <xsl:with-param name="size">12</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="format">
        <xsl:param name="name"/>
        <xsl:param name="element"/>
        <xsl:param name="size"/>
        <xsl:variable name="spaces">
            <xsl:text>&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
        </xsl:variable>
        <xsl:variable name="str" select="concat($element,$spaces)"/>
        <xsl:value-of select="concat($name,'=',substring($str,1,$size))"/>
        <xsl:text>&#x9;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
