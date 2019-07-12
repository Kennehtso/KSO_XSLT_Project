<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="arith.xsl"/>
  <xsl:import href="str.xsl"/>
  <xsl:template match="op">
    <xsl:value-of select="operand[1]"/>
    <xsl:value-of select="@symbol"/>
    <xsl:value-of select="operand[2]"/>
    =    <xsl:apply-imports/>
    <br/>
  </xsl:template>
</xsl:stylesheet>