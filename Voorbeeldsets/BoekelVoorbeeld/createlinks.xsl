<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    xmlns:imro="http://www.geonovum.nl/imro/2012/1.1"    
    xmlns:imropt="http://www.geonovum.nl/imro/pt/2012/1.0" 
    xmlns:imod="http://www.geostandaarden.nl/imod"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:gml="http://www.opengis.net/gml/3.2"
    exclude-result-prefixes="xs imro"
    version="2.0" >
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <imod:FeatureCollectionIMOD gml:id="Collectie" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.geostandaarden.nl/imod imod_v05.xsd">
            <imod:featureMember>
                <imod:Omgevingsdocument gml:id="NL.IMRO.0755.Omgevingsplan2016-VO01">
                    <imod:identificatie></imod:identificatie>
                    <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                    <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                    <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                    <imod:naam codeSpace="">Buitengebied 2016</imod:naam>
                    <imod:naamOverheid>Gemeente Boekel</imod:naamOverheid>
                    <imod:typeOmgevingsdocument>omgevingsplan</imod:typeOmgevingsdocument>
                    <imod:beleidsmatigVerantwoordelijkeOverheid>gemeentelijke overheid</imod:beleidsmatigVerantwoordelijkeOverheid>
                </imod:Omgevingsdocument>	
            </imod:featureMember>
            <imod:featureMember>
                <imod:Besluit gml:id="B_NL.IMRO.0755.Omgevingsplan2016-VO01">
                    <imod:identificatie></imod:identificatie>
                    <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                    <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                    <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                    <imod:documentstatus>geconsolideerd</imod:documentstatus>
                    <imod:procedure></imod:procedure>
                    <imod:datumVaststelling>2000-01-01T00:00:00</imod:datumVaststelling>
                    <imod:datumBekendmaking>2000-01-01T00:00:00</imod:datumBekendmaking>
                    <imod:besluittekst></imod:besluittekst>
                    <imod:omgevingsdocument xlink:href="NL.IMRO.0755.Omgevingsplan2016-VO01"/>
                </imod:Besluit>
            </imod:featureMember>
            <imod:featureMember>
                <imod:Beheergebied gml:id="Beheergebied_NL.IMRO.0755.Omgevingsplan2016-VO01">
                    <imod:identificatie></imod:identificatie>
                    <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                    <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                    <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                    <imod:begrenzingIndicatief>false</imod:begrenzingIndicatief>
                    <imod:geometrie></imod:geometrie>
                    <imod:besluit xlink:href="B_NL.IMRO.0755.Omgevingsplan2016-VO01"/>
                    <imod:onderwerp></imod:onderwerp>
                    <imod:omgevingsdocument></imod:omgevingsdocument>
                    <imod:eigenschapWaarde></imod:eigenschapWaarde>
                </imod:Beheergebied>
            </imod:featureMember>
            <xsl:apply-templates/>
        <xsl:for-each select="document('pt_NL.IMRO.0755.Omgevingsplanregels2-VO01.xml')">
            <xsl:apply-templates select="imropt:FeatureCollectionIMROPT/imropt:onderwerp"/>
        </xsl:for-each>
        </imod:FeatureCollectionIMOD>
    </xsl:template>
    
    <xsl:template match="imro:Enkelbestemming|imro:Functieaanduiding">
        <imod:featureMember>
            <imod:Werkingsgebied>            
                <xsl:apply-templates select="@gml:id | imro:identificatie"/>
                <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                <imod:begrenzingIndicatief>false</imod:begrenzingIndicatief>
                <xsl:apply-templates select="imro:geometrie"/>
                <xsl:apply-templates select="imro:verwijzingNaarTekstInfo"/>
                <xsl:if test="not(imro:verwijzingNaarTekstInfo)">
                    <imod:onderwerp xlink:href="#OFA_{@gml:id}"/>
                </xsl:if>
                <imod:omgevingsdocument xlink:href="#NL.IMRO.0755.Omgevingsplan2016-VO01"/>
                <xsl:if test="self::imro:Functieaanduiding">
                    <imod:eigenschapWaarde xlink:href="#EW_{@gml:id}"/>
                </xsl:if>
            </imod:Werkingsgebied>
        </imod:featureMember>
        <xsl:if test="self::imro:Functieaanduiding">
            <imod:featureMember>
                <imod:Onderwerp gml:id="OFA_{@gml:id}">
                    <imod:identificatie>
                        <imod:NEN3610ID>
                            <imod:namespace>OFA_<xsl:value-of select="descendant::imro:namespace"/></imod:namespace>
                            <imod:lokaalID><xsl:value-of select="descendant::imro:lokaalID"/></imod:lokaalID>
                        </imod:NEN3610ID>
                    </imod:identificatie>
                    <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                    <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                    <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                    <imod:naam><xsl:value-of select="imro:naam"/></imod:naam>
                    <imod:typeActiviteit>other: onbekend</imod:typeActiviteit>
                </imod:Onderwerp>
            </imod:featureMember>
            <imod:featureMember>
                <imod:Functie gml:id="EW_{@gml:id}">
                    <imod:identificatie>
                        <imod:NEN3610ID>
                            <imod:namespace>EW_<xsl:value-of select="descendant::imro:namespace"/></imod:namespace>
                            <imod:lokaalID><xsl:value-of select="descendant::imro:lokaalID"/></imod:lokaalID>
                        </imod:NEN3610ID>
                    </imod:identificatie>
                    <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                    <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                    <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                    <imod:naam><xsl:value-of select="imro:naam"/></imod:naam>
                    <imod:waarde>
                        <imod:BeschrijvendeWaarde>
                            <imod:waarde><xsl:value-of select="imro:naam"/></imod:waarde>
                        </imod:BeschrijvendeWaarde>
                    </imod:waarde>
                </imod:Functie>
            </imod:featureMember>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="imro:Maatvoering">
        <imod:featureMember>
            <imod:Maatvoering gml:id="EW_{@gml:id}">
                <imod:identificatie>
                    <imod:NEN3610ID>
                        <imod:namespace>EW_<xsl:value-of select="descendant::imro:namespace"/></imod:namespace>
                        <imod:lokaalID><xsl:value-of select="descendant::imro:lokaalID"/></imod:lokaalID>
                    </imod:NEN3610ID>
                </imod:identificatie>
                <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                <imod:naam><xsl:value-of select="imro:naam"/></imod:naam>
                <imod:waarde>
                    <imod:NumeriekeWaarde>
                        <imod:waarde>
                            <xsl:attribute name="uom">
                                <xsl:choose>
                                    <xsl:when test="substring-before(substring-after(ancestor::imro:maatvoeringInfo/imro:WaardeEnType/imro:waardeType, '('), ')')">
                                        <xsl:value-of select="substring-before(substring-after(ancestor::imro:maatvoeringInfo/imro:WaardeEnType/imro:waardeType, '('), ')')"/>
                                    </xsl:when>
                                    <xsl:otherwise>onbekend</xsl:otherwise>
                                </xsl:choose>            
                            </xsl:attribute>
                            <xsl:value-of select="imro:maatvoeringInfo/imro:WaardeEnType/imro:waarde"/></imod:waarde>
                    </imod:NumeriekeWaarde>
                </imod:waarde>
                <imod:typeMaatvoering><xsl:value-of select="imro:maatvoeringInfo/imro:WaardeEnType/imro:waardeType"/></imod:typeMaatvoering>
            </imod:Maatvoering>
        </imod:featureMember>
        <imod:featureMember>
            <imod:Werkingsgebied gml:id="{@gml:id}">
                <imod:identificatie>
                    <imod:NEN3610ID>
                        <imod:namespace><xsl:value-of select="descendant::imro:namespace"/></imod:namespace>
                        <imod:lokaalID><xsl:value-of select="descendant::imro:lokaalID"/></imod:lokaalID>
                    </imod:NEN3610ID>
                </imod:identificatie>
                <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                <imod:begrenzingIndicatief>false</imod:begrenzingIndicatief>
                <xsl:apply-templates select="imro:geometrie"/>
                <xsl:apply-templates select="imro:verwijzingNaarTekstInfo"/>
                <xsl:if test="not(imro:verwijzingNaarTekstInfo)">
                    <imod:onderwerp xlink:href="#OFA_{@gml:id}"/>
                </xsl:if>
                <imod:omgevingsdocument xlink:href="#NL.IMRO.0755.Omgevingsplan2016-VO01"/>
                <imod:eigenschapWaarde xlink:href="#EW_{@gml:id}"/>
            </imod:Werkingsgebied>
        </imod:featureMember>
    </xsl:template>
    
    <xsl:template match="imropt:FeatureCollectionIMROPT/imropt:onderwerp">
        <imod:featureMember>
            <imod:Onderwerp gml:id="OW_{imropt:TekstObject/@identificatie}">
                <imod:identificatie>
                    <imod:NEN3610ID>
                        <imod:namespace><xsl:value-of select="descendant::imro:namespace"/></imod:namespace>
                        <imod:lokaalID><xsl:value-of select="descendant::imro:lokaalID"/></imod:lokaalID>
                    </imod:NEN3610ID>
                </imod:identificatie>
                <imod:beginGeldigheid>2000-01-01T00:00:00</imod:beginGeldigheid>
                <imod:tijdstipRegistratieROD>2000-01-01T00:00:00</imod:tijdstipRegistratieROD>
                <imod:tijdstipRegistratie>2000-01-01T00:00:00</imod:tijdstipRegistratie>
                <imod:naam><xsl:value-of select="imropt:TekstObject/imropt:titelInfo/imropt:TitelInfo/imropt:naam"/></imod:naam>
                <imod:geografischgebied>toegelaten gebruik</imod:geografischgebied>
                <xsl:if test="@typeActiviteit">
                    <imod:typeActiviteit><xsl:value-of select="@typeActiviteit"/></imod:typeActiviteit>
                </xsl:if>
                <xsl:if test="@thema">
                    <imod:thema><xsl:value-of select="@thema"/></imod:thema>
                </xsl:if>
                <imod:normadressaat>eenIeder</imod:normadressaat>
                <imod:wettelijkegrondslag><xsl:value-of select="@wettelijkegrondslag2"/></imod:wettelijkegrondslag>
                <imod:werking></imod:werking>            
            </imod:Onderwerp>
        </imod:featureMember>
    </xsl:template>
    
    <!-- identity transform 
    <xsl:template match="/ | @* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="imro:geometrie">
        <imod:geometrie>
            <xsl:apply-templates select="@gml:* | gml:*"/>        
        </imod:geometrie>
    </xsl:template>
    
    <xsl:template match="@gml:* | gml:*">
        <xsl:element name="{name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imro:verwijzingNaarTekstInfo">
        <imod:onderwerp xlink:href="#OW_{substring-after(descendant::imro:verwijzingNaarTekst, '#')}"></imod:onderwerp>
    </xsl:template>
    
    <xsl:template match="@gml:id">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="imro:identificatie">
        <imod:identificatie><xsl:apply-templates/></imod:identificatie>
    </xsl:template>
    
    <xsl:template match="imro:NEN3610ID">
        <imod:NEN3610ID><xsl:apply-templates/></imod:NEN3610ID>
    </xsl:template>
    
    <xsl:template match="imro:namespace">
        <imod:namespace><xsl:value-of select="."/></imod:namespace>
    </xsl:template>
    
    <xsl:template match="imro:lokaalID">
        <imod:lokaalID><xsl:value-of select="."/></imod:lokaalID>
    </xsl:template>
    

    
    <xsl:template match="imro:MetadataIMRObestand|imro:Bestemmingsplangebied|imro:Dubbelbestemming|imro:Figuur"/>
        
    
</xsl:stylesheet>