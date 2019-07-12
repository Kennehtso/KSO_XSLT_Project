<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="op[@name='add']">
    <xsl:value-of select="operand[1]"/>
    <xsl:value-of select="operand[2]"/>
 (from str.xsl)
  </xsl:template>
  <xsl:template match="op[@name='mul']">
    <xsl:value-of select="operand[2]"/>
    <xsl:value-of select="operand[1]"/>
 (from str.xsl)
  </xsl:template>
</xsl:stylesheet>