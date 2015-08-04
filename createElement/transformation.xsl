<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:mes="http://namespace/do/mes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:esb="http://schemas.timbrasil.com.br/mw/soa/esb/message" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xsl esb fn">
	<xsl:template match="/">
		<root>
			<xsl:element name="ServiceName">
				<xsl:value-of select="//mes:property[mes:name = 'ServiceName']/mes:value"/>
			</xsl:element>
			<xsl:element name="ResultCode">
				<xsl:value-of select="//mes:property[mes:name = 'ResultCode']/mes:value"/>
			</xsl:element>
			<xsl:element name="RemoteId">
				<xsl:value-of select="//mes:property[mes:name = 'RemoteId']/mes:value"/>
			</xsl:element>
			<xsl:element name="Version">
				<xsl:value-of select="//mes:property[mes:name = 'Version']/mes:value"/>
			</xsl:element>
		</root>
	</xsl:template>
</xsl:stylesheet>
