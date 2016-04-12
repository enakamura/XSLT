<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<ROOT>
			<dateTime_fuso_BR>
				<xsl:call-template name="millisecs-to-ISO">
					<xsl:with-param name="millisecs" select="(/ROOT/epoch)-(3*3600*1000)"/>
					<xsl:with-param name="format" select="'dateTime'"/>
				</xsl:call-template>
			</dateTime_fuso_BR>
			<dateTime>
				<xsl:call-template name="millisecs-to-ISO">
					<xsl:with-param name="millisecs" select="/ROOT/epoch"/>
					<xsl:with-param name="format" select="'dateTime'"/>
				</xsl:call-template>
			</dateTime>
			<date>
				<xsl:call-template name="millisecs-to-ISO">
					<xsl:with-param name="millisecs" select="/ROOT/epoch"/>
					<xsl:with-param name="format" select="'date'"/>
				</xsl:call-template>
			</date>
		</ROOT>
	</xsl:template>
	
	
	<!--
	Use http://www.epochconverter.com/ to create epoch time in miliseconds
	-->
	<!--
	from: http://stackoverflow.com/questions/27990478/convert-epoch-to-date-via-xsl-from-xml-attribute-and-display-in-html
	user: http://stackoverflow.com/users/3016153/michael-hor257k
	-->
	<xsl:template name="millisecs-to-ISO">
		<xsl:param name="format"/>
		<xsl:param name="millisecs"/>
		<xsl:if test="normalize-space($millisecs) != ''">
			<xsl:variable name="JDN" select="floor($millisecs div 86400000) + 2440588"/>
			<xsl:variable name="mSec" select="$millisecs mod 86400000"/>
			<xsl:variable name="f" select="$JDN + 1401 + floor((floor((4 * $JDN + 274277) div 146097) * 3) div 4) - 38"/>
			<xsl:variable name="e" select="4*$f + 3"/>
			<xsl:variable name="g" select="floor(($e mod 1461) div 4)"/>
			<xsl:variable name="h" select="5*$g + 2"/>
			<xsl:variable name="d" select="floor(($h mod 153) div 5 ) + 1"/>
			<xsl:variable name="m" select="(floor($h div 153) + 2) mod 12 + 1"/>
			<xsl:variable name="y" select="floor($e div 1461) - 4716 + floor((14 - $m) div 12)"/>
			<xsl:variable name="H" select="floor($mSec div 3600000)"/>
			<xsl:variable name="M" select="floor($mSec mod 3600000 div 60000)"/>
			<xsl:variable name="S" select="$mSec mod 60000 div 1000"/>
			<xsl:variable name="DateTime">
				<xsl:value-of select="concat($y, format-number($m, '-00'), format-number($d, '-00'))"/>
				<xsl:value-of select="concat(format-number($H, 'T00'), format-number($M, ':00'), format-number($S, ':00'))"/>
			</xsl:variable>
			<xsl:variable name="year">
				<xsl:value-of select="substring($DateTime,1,4)"/>
			</xsl:variable>
			<xsl:variable name="month">
				<xsl:value-of select="substring($DateTime,6,2)"/>
			</xsl:variable>
			<xsl:variable name="day">
				<xsl:value-of select="substring($DateTime,9,2)"/>
			</xsl:variable>
			<xsl:variable name="hour">
				<xsl:value-of select="substring($DateTime,12,2)"/>
			</xsl:variable>
			<xsl:variable name="minute">
				<xsl:value-of select="substring($DateTime,15,2)"/>
			</xsl:variable>
			<xsl:variable name="second">
				<xsl:value-of select="substring($DateTime,18,2)"/>
			</xsl:variable>
			<xsl:variable name="date-format">
				<xsl:choose>
					<xsl:when test="$format='dateTime'">
						<xsl:value-of select="concat($month, '/', $day, '/', $year, ' ', $hour, ':', $minute, ':', $second)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($month, '/', $day, '/', $year)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:value-of select="$date-format"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
