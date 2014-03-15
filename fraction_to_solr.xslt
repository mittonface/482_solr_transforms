<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:fraction="http://www.upeikerrlab.ca">
    <xsl:template match="/">
        <xsl:param name="prefix">FRACTION_</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        
        <!-- type field -->
        <xsl:variable name="TYPE" select="fraction:assay/fraction:type" />
        <xsl:if test="$TYPE!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'type', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$TYPE"/>
            </field>
        </xsl:if>
        
        <!-- id field-->
        <xsl:variable name="ID" select="fraction:assay/fraction:id" />
        <xsl:if test="$ID!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'id', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$ID"/>
            </field>
        </xsl:if>
        
        <!-- labid -->
        <xsl:variable name="LABID" select="fraction:assay/fraction:labid" />
        <xsl:if test="$LABID!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'labid', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$LABID"/>
            </field>
        </xsl:if>

        <!-- weight -->
        <xsl:variable name="WEIGHT" select="fraction:assay/fraction:weight" />
        <xsl:if test="$WEIGHT!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'weight', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$WEIGHT"/>
            </field>
        </xsl:if>
        
        <!-- plate -->
        <xsl:variable name="PLATE" select="fraction:assay/fraction:plate" />
        <xsl:if test="$PLATE!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'plate', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$PLATE"/>
            </field>
        </xsl:if>
        
        <!-- location -->
        <xsl:variable name="LOCATION" select="fraction:assay/fraction:location" />
        <xsl:if test="$LOCATION!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'location', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$LOCATION"/>
            </field>
        </xsl:if>

        <!-- notes, does it make sense to index this? -->
        <xsl:variable name="NOTES" select="fraction:assay/fraction:notes" />
        <xsl:if test="$NOTES!= ''">
            <field>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat($prefix, 'notes', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="$NOTES"/>
            </field>
        </xsl:if>
        
        <!-- inhibitors, it probably makes sense to use the inhibitor name
             as the title and the result as value -->
        <xsl:for-each select="fraction:assay/fraction:inhibitor">
            <xsl:variable name="INHIB_NAME" select="./fraction:name" />
            <xsl:variable name="INHIB_RESULT" select="./fraction:result" />
            
            <xsl:if test="$INHIB_NAME!= ''">
                <field>
                    <xsl:attribute name="title">
                        <xsl:value-of select="concat($prefix, $INHIB_NAME, $suffix)"/>
                    </xsl:attribute>
                    <xsl:value-of select="$INHIB_RESULT"/>
                </field>
            </xsl:if>
        </xsl:for-each> 
    </xsl:template>
</xsl:stylesheet>
