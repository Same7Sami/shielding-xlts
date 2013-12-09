<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:choose>
						<xsl:when test="not(//ServiceRequestId)">

							<xsl:choose>
								<xsl:when test="not(//SrId)">

									<xsl:call-template name="recurse-over-string">
										<xsl:with-param name="str" select="//ChannelTransId"/>
									</xsl:call-template>

								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="recurse-over-string">
										<xsl:with-param name="str" select="//SrId"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>

						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="recurse-over-string">
								<xsl:with-param name="str"
									select="//ServiceRequestId"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>

				</requestID>
				<DWLControl>
					<requesterName>ShieldingDeactivateBulk</requesterName>
					<requesterLanguage>100</requesterLanguage>
				</DWLControl>
			</RequestControl>

			<TCRMTx>
				<TCRMTxType>updateContractComposite</TCRMTxType>
				<TCRMTxObject>ContractCompositeBObj</TCRMTxObject>
				<TCRMObject>
					<ContractCompositeBObj>
				<xsl:for-each select="//Line">
					<ContractCompositeMBObj>
							<TCRMContractBObj>
								
								<AgreementStatusType>4</AgreementStatusType>
								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
										<NetworkStatusType>6</NetworkStatusType>
									</XContractBObjExt>
								</TCRMExtension>
								<TCRMContractComponentBObj>
									<ContractStatusType>6</ContractStatusType>
								</TCRMContractComponentBObj>
								
								<TCRMAdminNativeKeyBObj>
									<AdminContractId>
										<xsl:value-of select="AccountNumber" />
									</AdminContractId>
									<AdminFieldNameType>8</AdminFieldNameType>
								</TCRMAdminNativeKeyBObj>
								
							</TCRMContractBObj>
						</ContractCompositeMBObj>
				</xsl:for-each>	
						
						
					</ContractCompositeBObj>
				</TCRMObject>
			</TCRMTx>
		</TCRMService>
		
	</xsl:template>
	<xsl:template name="recurse-over-string">
		<xsl:param name="str"/>
		<xsl:if test="$str">
			<xsl:variable name="first-char" select="substring($str,1,1)"/>
			<xsl:choose>
				<xsl:when
					test="$first-char = '0' or $first-char = '1'or $first-char = '2'or $first-char = '3'or $first-char = '4'or $first-char = '5'or $first-char = '6'or $first-char = '7'or $first-char = '8'or $first-char = '9'">
					<xsl:value-of select="$first-char"/>
				</xsl:when>
			</xsl:choose>
			<xsl:if test="string-length($str) > 1">
				<xsl:call-template name="recurse-over-string">
					<xsl:with-param name="str" select="substring($str,2)"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>

<xsl:template name="formatDate">
		<xsl:param name="str"/>
<xsl:if test="$str">
			<xsl:variable name="year" select="substring($str,1,4)"/>
			<xsl:variable name="month" select="substring($str,5,2)"/>
			<xsl:variable name="day" select="substring($str,7,2)"/>
			<xsl:variable name="hour" select="substring($str,9,2)"/>
			<xsl:variable name="min" select="substring($str,11,2)"/>
			<xsl:variable name="sec" select="substring($str,13,2)"/>
			<xsl:value-of select="$year"/>-<xsl:value-of select="$month"/>-<xsl:value-of select="$day"/><xsl:text> </xsl:text><xsl:value-of select="$hour"/>:<xsl:value-of select="$min"/>:<xsl:value-of select="$sec"/>.000000</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
