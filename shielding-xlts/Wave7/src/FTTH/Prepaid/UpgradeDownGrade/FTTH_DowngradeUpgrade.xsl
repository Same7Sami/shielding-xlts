<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:choose>
					<xsl:when test="//Order-Info/LineActivationDate and //Order-Info/LineActivationDate !=''">
					<xsl:value-of select="//Order-Info/LineActivationDate" />
					</xsl:when>
					<xsl:otherwise>
					<xsl:value-of select="//SR_HEADER/OrderSubmitDate" />
					</xsl:otherwise>
					</xsl:choose>
				</requestID>
				<DWLControl>
					<requesterName>FTTHDownUpgradePre</requesterName>
					<requesterLanguage>100</requesterLanguage>
					<clientSystemName>
					<xsl:value-of select="//SR_HEADER/RequestorChannelId"/>
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
														<xsl:if test="//CPESerialNumber and //CPESerialNumber!=''">
														<DeviceSerialNumber>
															<xsl:value-of select="//CPESerialNumber" />
														</DeviceSerialNumber>
														</xsl:if>
														<xsl:if test="//CPECertificateNumber and //CPECertificateNumber!=''">
														<CPEDCN>
															<xsl:value-of select="//CPECertificateNumber" />
														</CPEDCN>
														</xsl:if>
														<xsl:if test="//CPEMACAddress and //CPEMACAddress!=''">
														<CPEMacAddress>
															<xsl:value-of select="//CPEMACAddress" />
														</CPEMacAddress>
														</xsl:if>
													</XContractBObjExt>
												</TCRMExtension>
												<TCRMAdminNativeKeyBObj>
													<AdminContractId>
														<xsl:value-of select="//AccountNumber" />
													</AdminContractId>
													<AdminFieldNameType>8</AdminFieldNameType>
												</TCRMAdminNativeKeyBObj>
							</TCRMContractBObj>
								<ContractValueCompositeBObj>
										<TCRMContractValueBObj>
											<ContractValueType>31</ContractValueType>
											<xsl:for-each select="//LineItems/LineService/Attributes/Attribute">
													<xsl:choose>
														<xsl:when test="Name = 'Bandwidth' and Value and Value!=''">
															<Attribute1Type>96</Attribute1Type>
															<Attribute1String>
															<xsl:value-of select="Value" />
															</Attribute1String>
														</xsl:when>
														<xsl:when test="Name = 'Duration' and Value and Value!=''">
															<Attribute2Type>97</Attribute2Type>
															<Attribute2String>
															<xsl:value-of select="Value" />
															</Attribute2String>
														</xsl:when>
													</xsl:choose>
											</xsl:for-each>
											<xsl:if test="//DomainName and //DomainName !=''">
											<Attribute5Type>105</Attribute5Type>
											<Attribute5String>
												<xsl:value-of select="//DomainName" />
											</Attribute5String>
											</xsl:if>
										</TCRMContractValueBObj>
								</ContractValueCompositeBObj>
				</ContractCompositeMBObj>
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
