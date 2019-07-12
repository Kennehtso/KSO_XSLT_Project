<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <body>
        <h2>My CD Collection</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Title</th>
            <th>Artist</th>
            <th>Price</th>
          </tr>
          <xsl:apply-templates/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cd">
  <xsl:if test="price &gt; 7.9">
    <tr>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="artist"/>
      <xsl:value-of select="price"/>
    </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="title">
    <td>
      <span style="color:#ff0000">
        <xsl:value-of select="."/>
      </span>
    </td>
  </xsl:template>

  <xsl:template match="artist">
    <xsl:choose>
      <xsl:when test="../price &gt; 10">
        <td bgcolor="#ff00ff">
          <xsl:value-of select="."/>
        </td>
      </xsl:when>
      <!--小於等於10, 大於9-->
      <xsl:when test="../price &gt; 9">
        <td bgcolor="#cccccc">
          <xsl:value-of select="."/>
        </td>
      </xsl:when>
      <xsl:otherwise>
        <td>
          <xsl:value-of select="."/>
        </td>
      </xsl:otherwise>
      <!--多重判斷-結束-->
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>