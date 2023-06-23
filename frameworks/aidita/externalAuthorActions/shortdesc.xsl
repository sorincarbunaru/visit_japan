<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs ai" version="2.0"
    xmlns:ai="http://www.oxygenxml.com/ai/function">

    <xsl:template match="/*">
        <shortdesc>
            <xsl:value-of select="
                    ai:transform-content(
                    'You are a technical writer specialized in writing short descriptions. You are going to get a text and you have to summarize the main points of the text and generate a summarization in 2 sentences. Answer without other explanations.',
                    body)"/>
        </shortdesc>
    </xsl:template>
    

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="shortdesc[count(tokenize(., '\s+')) > 10]">
        <shortdesc> </shortdesc>
    </xsl:template>
</xsl:stylesheet>

