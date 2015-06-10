  <xsl:template name="alignZeroes">
  	<xsl:param name="value"/>
  	<xsl:variable name="zeroes">000</xsl:variable>
  	<xsl:variable name="str" select="concat($zeroes,$value)"></xsl:variable>
  	<xsl:value-of select="substring($str,string-length($str)-2,string-length($str))"/>
  </xsl:template>
