<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.1"
    >
    <!-- $Id: front_matter.xsl 6882 2011-02-17 15:42:54Z paultremblay $ -->

    <!--attribute set for dedication wrapper block (to be able to force a break after). Element is fo:block-->
    <xsl:attribute-set name="dedication-block">
    </xsl:attribute-set>

    <!--attribute set for abstract wrapper block (to be able to force a break after). Element is fo:block-->
    <xsl:attribute-set name="abstract-block">
    </xsl:attribute-set>

    <!--attribute set for dedication title. Element is fo:block-->
    <xsl:attribute-set name="dedication-title-block">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-after">12pt</xsl:attribute>
    </xsl:attribute-set>

    <!--attribute set for abstract title. Element is fo:block-->
    <xsl:attribute-set name="abstract-title-block">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <!--attribute set for dedication paragraph. Element is fo:block-->
    <xsl:attribute-set name="dedication-paragraph-block">
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="space-after">12pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="dedication-first-paragraph-block"
        use-attribute-sets = "dedication-paragraph-block">
        <xsl:attribute name="space-before">0pt</xsl:attribute>
    </xsl:attribute-set>

    <!--attribute set for abstract paragraph. Element is fo:block-->
    <xsl:attribute-set name="abstract-paragraph-block">
        <xsl:attribute name="space-before">12pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="abstract-first-paragraph-block"
        use-attribute-sets = "abstract-paragraph-block">
        <xsl:attribute name="space-before">0pt</xsl:attribute>
    </xsl:attribute-set>

    <!--END OF ATTRIBUTE SETS-->

    <!--ony process if not already processed in front matter-->
    <xsl:template match="topic[@classes='dedication']">
        <xsl:if test="$dedication-pagination = 'with-body'">
            <fo:block role="dedication" xsl:use-attribute-sets="dedication-block">
                <xsl:apply-templates/>
            </fo:block>
        </xsl:if> 
    </xsl:template>

    <xsl:template match="topic[@classes='dedication']" mode="front">
        <fo:block role="dedication" xsl:use-attribute-sets="dedication-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="topic[@classes='dedication']/title" priority="2">
        <fo:block role="dedication-title" xsl:use-attribute-sets="dedication-title-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="topic[@classes='dedication']/paragraph">
        <fo:block role="dedication-paragraph" xsl:use-attribute-sets="dedication-paragraph-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="topic[@classes='dedication']/paragraph[1]" priority = "2">
        <fo:block role="dedication-paragraph" xsl:use-attribute-sets="dedication-first-paragraph-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


    <xsl:template match="topic[@classes='abstract']">
        <xsl:if test="$abstract-pagination = 'with-body'">
            <fo:block role="abstract" xsl:use-attribute-sets="abstract-block">
                <xsl:apply-templates/>
            </fo:block>
        </xsl:if> 
    </xsl:template>

    <xsl:template match="topic[@classes='abstract']" mode="front">
        <fo:block role="abstract" xsl:use-attribute-sets="abstract-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


    <xsl:template match="topic[@classes='abstract']/title" priority="2">
        <fo:block role="abstract-title" xsl:use-attribute-sets="abstract-title-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="topic[@classes='abstract']/paragraph">
        <fo:block role="abstract-paragraph" xsl:use-attribute-sets = "abstract-paragraph-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="topic[@classes='abstract']/paragraph[1]" priority="2">
        <fo:block role="abstract-paragraph" xsl:use-attribute-sets = "abstract-first-paragraph-block">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
</xsl:stylesheet> 

