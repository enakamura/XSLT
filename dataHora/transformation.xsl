<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ex="http://exslt.org/dates-and-times" extension-element-prefixes="ex">
	<xsl:output encoding="iso-8859-1" omit-xml-declaration="yes" indent="yes" />
	<xsl:variable name="data">
		<xsl:value-of select="ex:date-time()" />
	</xsl:variable>
	<xsl:variable name="ano">
		<xsl:value-of select="substring-before($data,'-')" />
	</xsl:variable>
	<xsl:variable name="mes">
		<xsl:value-of select="substring-before(substring-after($data,'-'),'-')" />
	</xsl:variable>
	<xsl:variable name="dia">
		<xsl:value-of select="substring-before(substring-after(substring-after($data,'-'),'-'),'T')" />
	</xsl:variable>
	<xsl:variable name="hora">
		<xsl:value-of select="substring(substring-before(substring-after($data,'T'),'-'),1,5)" />
	</xsl:variable>
	<xsl:template match="/">
		<root>
		<date><xsl:value-of select="$data"/></date>
		<dateFormated>
			<xsl:value-of select="concat($ano,'/',$mes,'/',$dia, '-', $hora)"/>
		</dateFormated>
		</root>
	</xsl:template>
</xsl:stylesheet>
