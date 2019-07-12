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
          <xsl:for-each select="catalog/cd">
            <!--排序-->
            <xsl:sort select="price"/>
            <!--if判斷-開始-->
            <xsl:if test="price &gt; 7.9">
              <tr>
                <td>
                  <xsl:value-of select="title"/>
                </td>
                <!--多重判斷-開始-->
                <xsl:choose>
                  <xsl:when test="price &gt; 10">
                    <td bgcolor="#ff00ff">
                      <xsl:value-of select="artist"/>
                    </td>
                  </xsl:when>
                  <!--小於等於10, 大於9-->
                  <xsl:when test="price &gt; 9">
                    <td bgcolor="#cccccc">
                      <xsl:value-of select="artist"/>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>
                      <xsl:value-of select="artist"/>
                    </td>
                  </xsl:otherwise>
                  <!--多重判斷-結束-->
                </xsl:choose>
                <td>
                  <xsl:value-of select="price"/>
                </td>
              </tr>
              <!--if判斷-結束-->
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>