<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions">
  <xsl:template match="/">
  <xsl:variable name="msisdn" select="//msisdn"></xsl:variable>
  <root>
      <xsl:choose>
        <xsl:when test="$msisdn &gt; = 11000000000 and $msisdn &lt; 11939999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 11960000000 and $msisdn &lt; 11999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 41000000000 and $msisdn &lt; 47999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 81000000000 and $msisdn &lt; 84999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 19000000000 and $msisdn &lt; 19999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 90000000000 and $msisdn &lt; 99999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 30000000000 and $msisdn &lt; 39999999999">
          <xsl:call-template name="IB"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 50000000000 and $msisdn &lt; 59999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 12000000000 and $msisdn &lt; 18999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 60000000000 and $msisdn &lt; 69999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 20000000000 and $msisdn &lt; 29999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 70000000000 and $msisdn &lt; 79999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>          
        <xsl:when test="$msisdn &gt; = 48000000000 and $msisdn &lt; 49999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 85000000000 and $msisdn &lt; 89999999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
        <xsl:when test="$msisdn &gt; = 11940000000 and $msisdn &lt; 11959999999">
          <xsl:call-template name="NMWS"/>
        </xsl:when>
      </xsl:choose>
    </root>
  </xsl:template>
  <xsl:template name="NMWS">
    <rule>
      <serviceName>NMWS</serviceName>
      <businessService>CRD_Create_CreditRecharge/proxy/Nmws_Consult_RechargeStatus</businessService>
      <isProxy>true</isProxy>
    </rule>
  </xsl:template>
  <xsl:template name="IB">
    <rule>
      <serviceName>IB</serviceName>
      <businessService>CRD_Create_CreditRecharge/proxy/PS-CRD_Create_CreditRecharge</businessService>
      <isProxy>true</isProxy>
    </rule>
  </xsl:template>
</xsl:stylesheet>
