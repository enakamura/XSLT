    <xsl:template name="upperCase">
  	<xsl:param name="text"/>
  	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
  	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  	<xsl:value-of select="translate($text,$smallcase,$uppercase)"/>
  </xsl:template>
