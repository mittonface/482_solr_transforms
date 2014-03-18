<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:eml="eml://ecoinformatics.org/eml-2.1.0">
    <xsl:template match="/">
        <xsl:param name="prefix">EML_</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        <xsl:for-each select="eml:eml/eml:dataset/eml:coverage/eml:taxonomicCoverage/eml:taxonomicClassification">
            <xsl:variable name="RANKNAME" select="./eml:taxonRankName" />
            <xsl:variable name="RANKVALUE" select="./eml:taxonRankValue" />

            <xsl:if test="$RANKVALUE!= ''">
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat($prefix, $RANKNAME, $suffix)"/>
                    </xsl:attribute>
                    <xsl:value-of select="$RANKVALUE"/>
                </field>
            </xsl:if>
              
        </xsl:for-each> 
    </xsl:template>
</xsl:stylesheet>
