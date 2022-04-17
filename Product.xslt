<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        {
        "Company":[
        <xsl:for-each select="keyboards/company">
            <xsl:sort select="make"/>
            {
                "brand": "<xsl:value-of select="make"/>",
                "model": "<xsl:value-of select="model"/>"
            } <xsl:if test="position() !=last()">,</xsl:if>
        </xsl:for-each>
        ],
        "Prices":[
        <xsl:for-each select="keyboards/company/detail/prices/price">
            <xsl:if test="position() mod 2 = 1">
                {
                    "Normal Price": "<xsl:value-of select="value"/> <xsl:value-of select="currency"/>"
                } <xsl:if test="position() !=last()">,</xsl:if>
            </xsl:if>
            <xsl:if test="position() mod 2 = 0">
                {
                    "Discounter Price": "<xsl:value-of select="discounted_value"/> <xsl:value-of select="currency"/>",
                    "Discount": "<xsl:value-of select="discount"/>%"
                } <xsl:if test="position() !=last()">,</xsl:if>
            </xsl:if>
        </xsl:for-each>
        ],
        "Discount Type": [
        <xsl:for-each select="keyboards/company/detail/prices/price">
            <xsl:sort select="discount" order="ascending"/>
            <xsl:choose>
                <xsl:when test="discount>10">
                    <xsl:if test="@type = 'discounted'">
                        {
                            "Student Discount": "<xsl:value-of select="discount"/>",
                            "Discounted Value": "<xsl:value-of select="discounted_value"/>"
                        } <xsl:if test="position() !=last()">,</xsl:if>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="@type = 'discounted'">
                        {
                            "Normal Discount": "<xsl:value-of select="discount"/>",
                            "Discount Value": "<xsl:value-of select="discounted_value"/>"
                        } <xsl:if test="position() !=last()">,</xsl:if>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>