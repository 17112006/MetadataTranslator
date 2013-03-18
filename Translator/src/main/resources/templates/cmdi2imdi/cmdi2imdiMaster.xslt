<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.mpi.nl/IMDI/Schema/IMDI" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0" xpath-default-namespace="http://www.clarin.eu/cmd/">
    
    <xsl:include href="iprosla2imdi.xslt"/>
    <xsl:include href="collection2corpus.xslt"/>
    <xsl:include href="../util/identity.xslt"/>
    <xsl:include href="../util/handle.xslt"/>
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    
    <xsl:param name="datum" select="//MdCreationDate" />
    
    <xsl:param name="service-base-uri" select="'http://lux16.mpi.nl/ds/TranslationService/translate'"/>
    <xsl:param name="source-location"/>
    
    
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="'clarin.eu:cr1:p_1331113992512' = CMD/Header/MdProfile">
                <xsl:call-template name="IPROSLA2IMDI"/>
            </xsl:when>
            <xsl:when test="'clarin.eu:cr1:p_1345561703620' = CMD/Header/MdProfile">
                <xsl:call-template name="COLLECTION2CORPUS" />
            </xsl:when>
            <!-- Add new profile templates here -->
			<!--        
			<xsl:when test="exists(//Components/WHAT-EVER)">
                <xsl:call-template name="WHATEVER2IMDI"/>
            </xsl:when>
            -->
            <!-- Not a known profile! Apply identity -->
            <xsl:otherwise>
                <xsl:call-template name="identity-transform"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>