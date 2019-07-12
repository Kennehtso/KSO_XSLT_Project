<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
			
		<article class="inner-page-content wow fadeInUp">
			<div class="page-title-wrapper">
				<h2 class="mainTtl"><xsl:value-of select="/data/DCR/FET/mainSection/title" /></h2>
			</div>
		</article>
		
		<article class="annual-content wow fadeInUp">
			<div id="newObject"></div>

			<div id="newArray"></div>
		</article>
		
		<script>
			var itemsArray = [
				<xsl:for-each select="/data/DCR/FET/mainSection/itemsSection">
					<xsl:variable name='itemCategory'>
						<xsl:value-of select="title"/>
					</xsl:variable>
					<xsl:for-each select="items">
						<xsl:variable name="replace_symbol_one"><xsl:text>"</xsl:text></xsl:variable>
						<xsl:variable name="replace_symbol_one_ok"><xsl:text>\"</xsl:text></xsl:variable>
						<xsl:variable name="replace_symbol_two"><xsl:text>&#xa;</xsl:text></xsl:variable>
						<xsl:variable name="replace_symbol_two_ok"><xsl:text></xsl:text></xsl:variable>
						
						<xsl:variable name="descriptionR">
							<xsl:call-template name="string-replace-all">
								<xsl:with-param name="text" select="description" />
								<xsl:with-param name="replace" select="$replace_symbol_one" /> 
								<xsl:with-param name="by" select="$replace_symbol_one_ok" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="descriptionR2">
							<xsl:call-template name="string-replace-all">
								<xsl:with-param name="text" select="$descriptionR" />
								<xsl:with-param name="replace" select="$replace_symbol_two" /> 
								<xsl:with-param name="by" select="$replace_symbol_two_ok" />
							</xsl:call-template>
						</xsl:variable>
						{
							category: "<xsl:value-of select="$itemCategory" />",
							title: "<xsl:value-of select="title" />",
							description: "<xsl:value-of select="$descriptionR2" />",
							image: "<xsl:value-of select="image" />",
							altTest: "<xsl:value-of select="altTest" />",
							<xsl:for-each select="button">
								buttonTitle: "<xsl:value-of select="title" />",
								buttonIcon: "<xsl:value-of select="icon" />",
								buttonAttachment: "<xsl:value-of select="attachment" />",
								buttonTarget: "<xsl:value-of select="target" />",
							</xsl:for-each>
							shownInIndex: "<xsl:value-of select="shownInIndex" />",
						},
					</xsl:for-each>
				</xsl:for-each>	
			];
			var newObject = {};
			var newArray = [];

			<xsl:text disable-output-escaping="yes"><![CDATA[
			itemsArray.forEach(function(item, index){
				if(JSON.stringify(newObject) === '{}' && item.shownInIndex == "yes")
					newObject = item;
				else
					newArray.push(item);
			});
			]]></xsl:text>
		</script>


	</xsl:template>
	
	<xsl:template name="string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$by" />
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>