<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2"
    xmlns="http://www.w3.org/1999/xhtml">
    <sch:ns uri="http://www.oxygenxml.com/ai/function" prefix="ai"/>
    <sch:pattern>
        <sch:rule context="topic">
            <sch:report test="not(shortdesc)" sqf:fix="generate_shortdesc" role="warn">Each topic should have a short description.</sch:report>
            <sqf:fix id="generate_shortdesc">
                <sqf:description>
                    <sqf:title>Generate short description</sqf:title>
                </sqf:description>
                <sqf:add match="body" position="before" node-type="element" target="shortdesc" 
                    select="ai:transform-content(
                        'You will act as a technical writer. 
                        Summarize the main points of the given text and generate a short description in 2 sentences,
                        without any other explanation:',
                        .)"/>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <!-- Title - styling elements are not allowed in title. -->
        <sch:rule context="title/b">
            <sch:report test="true()" role="info" id="boldID">The bold DITA element is not allowed in title. Remove it.</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>
