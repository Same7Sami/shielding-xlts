<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:call-template name="recurse-over-string">
						<xsl:with-param name="str" select="//ServiceRequestId" />
					</xsl:call-template>
				</requestID>
				<DWLControl>
					<requesterName>
						<xsl:value-of select="//RequestorUserId" />
					</requesterName>
					<xsl:choose>
						<xsl:when test="//SR_HEADER/RequestorLanguage = 'E' ">
							<requesterLanguage>100</requesterLanguage>
						</xsl:when>
						<xsl:otherwise>
							<requesterLanguage>
								<xsl:value-of select="//SR_HEADER/RequestorLanguage" />
							</requesterLanguage>
						</xsl:otherwise>
					</xsl:choose>
					<requestTime>
						<xsl:value-of select="//SR_HEADER/SrDate" />
					</requestTime>
					<!-- <clientSystemName> -->
					<!-- <xsl:value-of select="//SR_HEADER/RequestorChannelId" /> -->
					<!-- </clientSystemName> -->
				</DWLControl>
			</RequestControl>

			<TCRMTx>
				<TCRMTxType>addContractComposite</TCRMTxType>
				<TCRMTxObject>ContractCompositeBObj</TCRMTxObject>
				<TCRMObject>
					<ContractCompositeBObj>
						<ContractCompositeMBObj>
							<TCRMContractBObj>

								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
									<CreatedDealerId>
											<xsl:value-of select="//ConsumptionDealerId" />
										</CreatedDealerId>
										<CreatedShopId>
											<xsl:value-of select="//ConsumptionShopId" />
										</CreatedShopId>
										<MSISDN>
											<xsl:value-of select="//MSISDN" />
										</MSISDN>
										<PayType>
											<xsl:value-of select="//PricingPlan" />
										</PayType>
									</XContractBObjExt>
								</TCRMExtension>

							</TCRMContractBObj>
						</ContractCompositeMBObj>
					</ContractCompositeBObj>
				</TCRMObject>
			</TCRMTx>
		</TCRMService>
	</xsl:template>
	<xsl:template name="recurse-over-string">
		<xsl:param name="str" />
		<xsl:if test="$str">
			<xsl:variable name="first-char" select="substring($str,1,1)" />
			<xsl:choose>
				<xsl:when
					test="$first-char = '0' or $first-char = '1'or $first-char = '2'or $first-char = '3'or $first-char = '4'or $first-char = '5'or $first-char = '6'or $first-char = '7'or $first-char = '8'or $first-char = '9'">
					<xsl:value-of select="$first-char" />
				</xsl:when>
			</xsl:choose>
			<xsl:if test="string-length($str) > 1">
				<xsl:call-template name="recurse-over-string">
					<xsl:with-param name="str" select="substring($str,2)" />
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
