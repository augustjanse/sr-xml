<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:template match="sr">
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:googleplay="http://www.google.com/schemas/play-podcasts/1.0" xmlns:sr="http://www.sverigesradio.se/podrss" version="2.0">
  <channel>
    <!-- Replace this comment with metadata from official RSS feed -->
    <xsl:for-each select="episodes/episode">
    <item>
	    <title>
		     <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
		     <xsl:apply-templates select="title"/>
		     <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text> 
	     </title>
	     <description>
		     <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
		     <xsl:apply-templates select="description"/>
		     <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text> 
	     </description>
	     <link>
		     <xsl:apply-templates select="url"/>
	     </link>
	     <guid isPermaLink="false">
		     <xsl:apply-templates select="downloadpodfile/url"/>
	     </guid>
	     <pubDate>
		     <xsl:apply-templates select="publishdateutc"/>
	     </pubDate>
      <sr:programid>3718</sr:programid>
      <sr:poddid>9946</sr:poddid>
      <itunes:summary></itunes:summary>
      <itunes:author>Sveriges Radio</itunes:author>
      <itunes:keywords></itunes:keywords>
      <itunes:image href="https://static-cdn.sr.se/sida/images/3718/cdc177e4-3142-4693-8f75-82a93b8f95bf.jpg?preset=api-itunes-presentation-image" />
      <itunes:duration>
	      <xsl:apply-templates select="downloadpodfile/duration"/>
      </itunes:duration>
      <itunes:subtitle></itunes:subtitle>
      <enclosure url="{downloadpodfile/url}" length="43972836" type="audio/mpeg" />
    </item>
    </xsl:for-each>
  </channel>
</rss>
	</xsl:template>
</xsl:stylesheet>
