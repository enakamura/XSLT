<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    <xsl:strip-space elements="*"/>
   
    <xsl:variable name="OUTPUT_SPCODE" select="//ROOT/CURSOR_DEMO/DEMO_SPCODE" /><!-- Verificar se precisa utilizar! -->
    <xsl:variable name="OUTPUT_SNCODE" select="//ROOT/CURSOR_DEMO/DEMO_SNCODE" /><!-- Verificar se precisa utilizar! -->
   
    <xsl:template match="/">
        <xsl:apply-templates select="ROOT"/>
    </xsl:template>
    <xsl:template match="/">
        <ib-msg>
            <ib-info>
                <result>
                    <xsl:choose>
                        <xsl:when test="ROOT//RC = '0'">
                            <code>1</code>
                            <xsl:if test="ROOT//RC_DESC != ''">
                                   <desc><xsl:value-of select="ROOT//RC_DESC/text()" /></desc>
                           </xsl:if>
                        </xsl:when>
                        <xsl:when test="ROOT//RC = '1'
                                        or ROOT//RC = '2'
                                        or ROOT//RC = '3'
                                        or ROOT//RC = '4'
                                        or ROOT//RC = '5'">
                            <code><xsl:value-of select="-(40000 + //RC)" /></code>
                            <xsl:if test="ROOT//RC_DESC/text() != ''">
                                <desc><xsl:value-of select="ROOT//RC_DESC/text()" /></desc>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <code>-40000</code>
                            <desc>Erro GenÃÂ©rico</desc>
                        </xsl:otherwise>
                    </xsl:choose>
                </result>
            </ib-info>
            <data>
                <xsl:if test="ROOT//RC = '0'">
                    <customer>
                        <id><xsl:value-of select="ROOT/CS_ID/text()" /></id>
                        <code><xsl:value-of select="ROOT/CS_CODE/text()" /></code>
                        <status><xsl:value-of select="ROOT/CS_STATUS/text()" /></status>
                        <contract>
                            <id><xsl:value-of select="ROOT/CO_ID/text()" /></id>
                            <status><xsl:value-of select="ROOT/CO_STATUS/text()" /></status>
                            <change-event>
                                <reason>
                                    <code><xsl:value-of select="ROOT/CO_REASON-CODE/text()" /></code>
                                </reason>
                            </change-event>
                            <activation-date><xsl:value-of select="ROOT/CO_ACTIVATION_DATE/text()" /></activation-date>
                            <xsl:if test="ROOT/CO_DEACTIVATION_DATE/text() != ''">
                                <deactivation-date><xsl:value-of select="ROOT/CO_DEACTIVATION_DATE/text()" /></deactivation-date>
                            </xsl:if>
                            <device>
                                <directory-no>
                                    <number><xsl:value-of select="ROOT/CO_DN_NUM/text()" /></number>
                                    <status><xsl:value-of select="ROOT/CO_DN_STATUS/text()" /></status>
                                    <plan-code><xsl:value-of select="ROOT/CO_DN_PLAN-CODE/text()" /></plan-code>
                                </directory-no>
                                <storage-medium>
                                    <serial-no><xsl:value-of select="ROOT/CO_SM_SERIALNUM/text()" /></serial-no>
                                </storage-medium>
                                <port>
                                    <number><xsl:value-of select="ROOT/CO_PORT_NUM/text()" /></number>
                                </port>
                                <hlr>
                                    <code><xsl:value-of select="ROOT/CO_HLCODE/text()" /></code>
                                </hlr>
                            </device>
                            <network>
                                <code><xsl:value-of select="ROOT/CO_NETWORK-CODE/text()" /></code>
                            </network>
                        </contract>
                    </customer>

					<customer-svc-size><xsl:value-of select="count(//ROOT/CURSOR_DEMO) - count(//ROOT/CURSOR_DEMO[(preceding::DEMO_SPCODE = DEMO_SPCODE) and (preceding::DEMO_SNCODE = DEMO_SNCODE)])"/></customer-svc-size>
                   
                    <xsl:for-each select="ROOT/CURSOR_DEMO">
                       
                        <!-- Define variaveis para realizar busca -->
                        <xsl:variable name="DEMO_SPCODE" select="./DEMO_SPCODE"/>
                        <xsl:variable name="DEMO_SNCODE" select="./DEMO_SNCODE"/>
                        <xsl:variable name="position" select="position()"></xsl:variable>
                       
                        <!-- Busca por ocorrencias anteriores de DEMO_SPCODE e DEMO_SNCODE -->
                        <xsl:variable name="contador">
                            <xsl:value-of select="count(//ROOT/CURSOR_DEMO[position() = $position and preceding::DEMO_SPCODE = $DEMO_SPCODE and preceding::DEMO_SNCODE = $DEMO_SNCODE])"/>
                        </xsl:variable>
                       
                        <!-- Exibe apenas se nao existir ocorrencia anterior -->
                        <xsl:if test="$contador = 0">
                            <customer-svc>

                                <contract>
                                    <id><xsl:value-of select="./DEMO_CO_ID/text()"/></id>
                                    <svc>
                                        <activation-date><xsl:value-of select="./DEMO_ACTIVATION_DATE/text()"/></activation-date>
                                    </svc>
                                </contract>
                                <rate-plan>
                                    <code><xsl:value-of select="./DEMO_TMCODE/text()"/></code>
                                    <service>
                                        <service-pkg>
                                            <code><xsl:value-of select="./DEMO_SPCODE/text()" /></code>
                                        </service-pkg>
                                    </service>
                                </rate-plan>
                                <change-event>
                                    <shdesc><xsl:value-of select="./DEMO_TMSHDES/text()"/></shdesc>
                                </change-event>
                                <pos-paid>
                                    <customer>
                                        <contract>
                                            <rate-plan>
                                                <desc><xsl:value-of select="./DEMO_TMDESC/text()"/></desc>
                                            </rate-plan>
                                        </contract>
                                    </customer>
                                </pos-paid>
                                <code><xsl:value-of select="./DEMO_SNCODE/text()" /></code>
                                <short-desc><xsl:value-of select="./DEMO_SHDES/text()"/></short-desc>
                                <desc><xsl:value-of select="./DEMO_DESC/text()"/></desc>
                                <customer>
                                    <contract>
                                        <svc>
                                            <seq-no><xsl:value-of select="./DEMO_SEQNO/text()"/></seq-no>
                                        </svc>
                                    </contract>
                                </customer>
                                <status>
                                    <svc><xsl:value-of select="./DEMO_STATUS/text()"/></svc>
                                </status>
                                <date>
                                    <status>
                                        <svc><xsl:value-of select="./DEMO_CURRENT_STATUS_DATE/text()"/></svc>
                                    </status>
                                </date>
                                <xsl:if test="./DEMO_DESVIO_ADESAO_TIPO/text() != '' or ./DEMO_DESVIO_ADESAO_VALOR/text() != '' or ./DEMO_DESVIO_ASSINAT_TIPO/text() != '' or ./DEMO_DESVIO_ASSINAT_VALOR/text() != ''">
                                    <deviation>
                                        <xsl:if test="./DEMO_DESVIO_ADESAO_TIPO/text() != '' or ./DEMO_DESVIO_ADESAO_VALOR/text() != ''">
                                            <accession>
                                                <xsl:if test="./DEMO_DESVIO_ADESAO_TIPO/text() != ''">
                                                    <type><xsl:value-of select="./DEMO_DESVIO_ADESAO_TIPO/text()"/></type>
                                                </xsl:if>
                                                <xsl:if test="./DEMO_DESVIO_ADESAO_VALOR/text() != ''">
                                                    <value><xsl:value-of select="./DEMO_DESVIO_ADESAO_VALOR/text()"/></value>
                                                </xsl:if>
                                            </accession>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_DESVIO_ASSINAT_TIPO/text() != '' or ./DEMO_DESVIO_ASSINAT_VALOR/text() != ''">
                                            <subscription>
                                                <xsl:if test="./DEMO_DESVIO_ASSINAT_TIPO/text() != ''">
                                                    <type><xsl:value-of select="./DEMO_DESVIO_ASSINAT_TIPO/text()"/></type>
                                                </xsl:if>
                                                <xsl:if test="./DEMO_DESVIO_ASSINAT_VALOR/text() != ''">
                                                    <value><xsl:value-of select="./DEMO_DESVIO_ASSINAT_VALOR/text()"/></value>
                                                </xsl:if>
                                            </subscription>
                                        </xsl:if>
                                    </deviation>
                                </xsl:if>
                                <xsl:if test="./DEMO_DESVIO_ASSINAT_PERIOD/text() != ''">
                                    <application-period>
                                        <deviation>
                                            <subscription><xsl:value-of select="./DEMO_DESVIO_ASSINAT_PERIOD/text()"/></subscription>
                                        </deviation>
                                    </application-period>
                                </xsl:if>
                               
                                <!-- Busca por todos as ocorrencias de DEMO_SPCODE e DEMO_SNCODE e agrupa dentro de 'parameter' -->
                                <xsl:for-each select="//ROOT/CURSOR_DEMO[DEMO_SPCODE = $DEMO_SPCODE and DEMO_SNCODE = $DEMO_SNCODE]">
                                    <parameter>
                                        <xsl:if test="./DEMO_PRM_VALUE_ID/text() != ''">
                                            <value-id><xsl:value-of select="./DEMO_PRM_VALUE_ID/text()" /></value-id>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_PRM_PARAMETER_ID/text() != ''">
                                            <id><xsl:value-of select="./DEMO_PRM_PARAMETER_ID/text()" /></id>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_PRM_VALUE_STRING/text() != ''">
                                            <value-string><xsl:value-of select="./DEMO_PRM_VALUE_STRING/text()" /></value-string>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_PRM_VALUE_NUMBER/text() != ''">
                                            <value-number><xsl:value-of select="./DEMO_PRM_VALUE_NUMBER/text()" /></value-number>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_PRM_DESCRIPTION/text() != ''">
                                            <desc><xsl:value-of select="./DEMO_PRM_DESCRIPTION/text()" /></desc>
                                        </xsl:if>
                                        <xsl:if test="./DEMO_PRM_VALID_FROM/text() != ''">
                                            <valid-from><xsl:value-of select="./DEMO_PRM_VALID_FROM/text()" /></valid-from>
                                        </xsl:if>
                                    </parameter>
                                </xsl:for-each>
                               
                            </customer-svc>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </data>
        </ib-msg>
    </xsl:template>
</xsl:stylesheet>
