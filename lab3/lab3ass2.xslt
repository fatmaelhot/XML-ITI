<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 
  <xsl:key name="cd-by-country" match="cd" use="country" />

  
  <xsl:template match="/">
    <html>
      <head>
        <title>CD Catalog</title>
        <style>
          .high-price { color: red; }
          .medium-price { color: blue; }
          .low-price { color: green; }
        </style>
      </head>
      <body>
        <h1>CD Catalog</h1>
        
        <xsl:apply-templates select="catalog/cd[year &gt; 1990]">
          <xsl:sort select="country" />
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  
  <xsl:template match="cd">
    
    <xsl:for-each select="key('cd-by-country', country)">
      <xsl:sort select="price" />
      
      <div>
        <p><strong>Title:</strong> <xsl:value-of select="title"/></p>
        <p><strong>Artist:</strong> <xsl:value-of select="artist"/></p>
        <p><strong>Price:</strong> 
          <xsl:choose>
            <xsl:when test="price &gt;= 10">
              <span class="high-price"><xsl:value-of select="price"/></span>
            </xsl:when>
            <xsl:when test="price &gt;= 8">
              <span class="medium-price"><xsl:value-of select="price"/></span>
            </xsl:when>
            <xsl:otherwise>
              <span class="low-price"><xsl:value-of select="price"/></span>
            </xsl:otherwise>
          </xsl:choose>
        </p>
      </div>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
