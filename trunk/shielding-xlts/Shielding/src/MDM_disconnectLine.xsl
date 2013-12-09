<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:value-of select="//SR_HEADER/ServiceRequestId" />
				</requestID>
				<DWLControl>
					<requesterName>
						<xsl:value-of select="//Agent_Id" />
					</requesterName>
					<xsl:choose>
						<xsl:when test="//SR_HEADER/RequestorLanguage = '' ">
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
					<clientSystemName>
						<xsl:value-of select="//SR_HEADER/RequestorChannelId" />
					</clientSystemName>
				</DWLControl>
			</RequestControl>

			<TCRMTx>
				<TCRMTxType>updateContractComposite</TCRMTxType>
				<TCRMTxObject>ContractCompositeBObj</TCRMTxObject>
				<TCRMObject>
					<ContractCompositeBObj>
						<ContractCompositeMBObj>
							<TCRMContractBObj>
								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
										<CreatedDealerId>
											<xsl:value-of select="//Dealer_Id" />
										</CreatedDealerId>
										<CreatedShopId>
											<xsl:value-of select="//SHOP_ID" />
										</CreatedShopId>
										<MSISDN>
											<xsl:value-of select="//MSISDN" />
										</MSISDN>
										<SIM>
											<xsl:value-of select="//SIM" />
										</SIM>
										<PUK1>
											<xsl:value-of select="//PUK1" />
										</PUK1>
										<PUK2>
											<xsl:value-of select="//PUK2" />
										</PUK2>
										<IMSI>
											<xsl:value-of select="//IMSI" />
										</IMSI>
									</XContractBObjExt>
								</TCRMExtension>
								<TCRMAdminNativeKeyBObj>
									<AdminContractId>
										<xsl:value-of select="//BillingNumber" />
									</AdminContractId>
									<AdminFieldNameType>8</AdminFieldNameType>
								</TCRMAdminNativeKeyBObj>
							</TCRMContractBObj>
						</ContractCompositeMBObj>
					</ContractCompositeBObj>
				</TCRMObject>
			</TCRMTx>
		</TCRMService>
	</xsl:template>

</xsl:stylesheet>
