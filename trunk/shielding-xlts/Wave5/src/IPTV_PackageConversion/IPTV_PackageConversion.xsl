<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:value-of select="//SR_HEADER/OrderCreationDate" />
				</requestID>
				<DWLControl>
					<requesterName>IPTVPackageConversion</requesterName>
					<requesterLanguage>100</requesterLanguage>
					<clientSystemName>
					<xsl:value-of select="//SR_HEADER/RequestorChannelId"/>
					</clientSystemName>
				</DWLControl>
			</RequestControl>
			<TCRMTx>
				<TCRMTxType>addContractComposite</TCRMTxType>
				<TCRMTxObject>ContractCompositeBObj</TCRMTxObject>
				<TCRMObject>
						<ContractCompositeBObj>

							<xsl:for-each select="//orderLineItem">
								<xsl:choose>
									<xsl:when test="productName = 'FTTH'">
										<ContractCompositeMBObj>
											<TCRMContractBObj>
												<TCRMExtension>
													<ExtendedObject>XContractBObjExt</ExtendedObject>
													<XContractBObjExt>
														<xsl:for-each select="orderLineItem/currentAttributes/attribute">
																<xsl:if test="name = 'SN' and value and value!=''">
																	<DeviceSerialNumber>
																		<xsl:value-of select="value" />
																	</DeviceSerialNumber>
																</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="orderLineItem/currentAttributes/attribute">
																<xsl:if test="name = 'DCN' and value and value!=''">
																	<CPEDCN>
																		<xsl:value-of select="value" />
																	</CPEDCN>
																</xsl:if>
														</xsl:for-each>	
														<xsl:choose>
															<xsl:when test="//orderServiceAccount/PayType and //orderServiceAccount/PayType = 'Postpaid'">
																<PayType>2</PayType>
															</xsl:when>
															<xsl:when test="//orderServiceAccount/PayType and //orderServiceAccount/PayType != 'Postpaid'">
																<PayType>1</PayType>
															</xsl:when>
														</xsl:choose>
														<xsl:for-each select="orderLineItem/currentAttributes/attribute">	
																<xsl:if test="name = 'MAC' and value and value!=''">
																	<CPEMacAddress>
																		<xsl:value-of select="value" />
																	</CPEMacAddress>
																</xsl:if>
														</xsl:for-each>
													</XContractBObjExt>
												</TCRMExtension>
												<TCRMAdminNativeKeyBObj>
													<AdminContractId>
														<xsl:value-of select="//orderServiceAccount/ServiceAccountNumber" />
													</AdminContractId>
													<AdminFieldNameType>8</AdminFieldNameType>
												</TCRMAdminNativeKeyBObj>
											</TCRMContractBObj>
											<xsl:if test="//orderServiceAccount/PackageID and //orderServiceAccount/PackageID !=''">
											<ProductContractRelationshipCompositeBObj>
												<TCRMProductContractRelationshipBObj>
													<ProductContractRelationshipType>1</ProductContractRelationshipType>
													<TCRMExtension>
														<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
														<XProductContractRelationshipBObjExt />
													</TCRMExtension>
												</TCRMProductContractRelationshipBObj>
												<ProductAdminSysKeyBObj>
													<AdminSystemType>21</AdminSystemType>
													<ProductAdminSysKeyPartOne>
														<xsl:value-of select="//orderServiceAccount/PackageID" />
													</ProductAdminSysKeyPartOne>
												</ProductAdminSysKeyBObj>
											</ProductContractRelationshipCompositeBObj>
											</xsl:if>
											<ContractValueCompositeBObj>
													<TCRMContractValueBObj>
														<ContractValueType>31</ContractValueType>
											<xsl:for-each select="currentAttributes/attribute">
														<xsl:choose>
															<xsl:when test="name = 'bandwidth' and value and value!=''">
																<Attribute1Type>96</Attribute1Type>
																<Attribute1String>
																	<xsl:value-of select="value" />
																</Attribute1String>
															</xsl:when>
															<xsl:when test="name = 'LoginId' and value and value!=''">
																<Attribute4Type>104</Attribute4Type>
																<Attribute4String>
																	<xsl:value-of select="value" />
																</Attribute4String>
															</xsl:when>
															<xsl:when test="name = 'Domain' and value and value!=''">
																<Attribute5Type>105</Attribute5Type>
																<Attribute5String>
																	<xsl:value-of select="value" />
																</Attribute5String>
															</xsl:when>
														</xsl:choose>
											</xsl:for-each>
											</TCRMContractValueBObj>
										</ContractValueCompositeBObj>

										</ContractCompositeMBObj>
									</xsl:when>
									<xsl:when test="productName = 'IPTV' and actionCode = 'ADD'">
										<ContractCompositeMBObj>
											<TCRMContractBObj>
												<xsl:choose>
													<xsl:when test="//LanguagePreference = 'Arabic'">
														<ContractLangType>1100</ContractLangType> 	
													</xsl:when>
													<xsl:otherwise>
														<ContractLangType>100</ContractLangType>
													</xsl:otherwise>
												</xsl:choose> 
												<CurrencyType>14</CurrencyType>
												<SignedDate>
													<xsl:call-template name="formatDate">
														<xsl:with-param name="str"
															select="//SR_HEADER/OrderCreationDate" />
													</xsl:call-template>
												</SignedDate>
												<AgreementStatusType>5</AgreementStatusType>
												<AgreementType>6</AgreementType>
												<TCRMExtension>
													<ExtendedObject>XContractBObjExt</ExtendedObject>
													<XContractBObjExt>
														<UserCreatedRecord>
															<xsl:value-of select="//SR_HEADER/AgentId" />
														</UserCreatedRecord>
														<CreatedDealerId>
															<xsl:value-of select="//SR_HEADER/DealerId" />
														</CreatedDealerId>
														<CreatedShopId>
															<xsl:value-of select="//SR_HEADER/ShopId" />
														</CreatedShopId>
														<SrviceBillingIndicator>S</SrviceBillingIndicator>

														<xsl:for-each select="orderLineItem/currentAttributes/attribute">
																		<xsl:if test="name = 'SN'">
																			<DeviceSerialNumber>
																				<xsl:value-of select="value" />
																			</DeviceSerialNumber>
																		</xsl:if>
														</xsl:for-each>
														<xsl:choose>
															<xsl:when test="//PayType = 'Postpaid'">
																<PayType>2</PayType>
															</xsl:when>
															<xsl:when test="//PayType != 'Postpaid'">
																<PayType>1</PayType>
															</xsl:when>
														</xsl:choose>
														<NetworkStatusType>1</NetworkStatusType>
														<xsl:for-each select="orderLineItem/currentAttributes/attribute">
																		<xsl:if test="name = 'MAC'">
																			<CPEMacAddress>
																				<xsl:value-of select="value" />
																			</CPEMacAddress>
																		</xsl:if>
														</xsl:for-each>
													</XContractBObjExt>
												</TCRMExtension>
												<TCRMContractComponentBObj>
													<ContractStatusType>7</ContractStatusType>
												</TCRMContractComponentBObj>
												<TCRMAdminNativeKeyBObj>
												<xsl:for-each select="currentAttributes/attribute">
																	<xsl:choose>
																		<xsl:when test="name = 'ServiceNumber'">
																			<AdminContractId>
																				<xsl:value-of select="value" />
																			</AdminContractId>
																		</xsl:when>
																	</xsl:choose>
														</xsl:for-each>
													<AdminFieldNameType>10</AdminFieldNameType>
												</TCRMAdminNativeKeyBObj>
											</TCRMContractBObj>
											<ContractRelationshipCompositeBObj>
												<TCRMContractRelationshipBObj>
													<RelationshipType>15</RelationshipType>
													<RelationshipValue>Reference Account</RelationshipValue>
													<RelationshipStatusType>1</RelationshipStatusType>
													<TCRMExtension>
														<ExtendedObject>XContractRelationshipBObjExt
														</ExtendedObject>
														<XContractRelationshipBObjExt />
													</TCRMExtension>
													<TCRMAdminNativeKeyBObj>
														<AdminContractId>
														<xsl:value-of select="//orderServiceAccount/ServiceAccountNumber" />
														</AdminContractId>
														<AdminFieldNameType>8</AdminFieldNameType>
													</TCRMAdminNativeKeyBObj>
												</TCRMContractRelationshipBObj>
											</ContractRelationshipCompositeBObj>
											<ProductContractRelationshipCompositeBObj>
												<TCRMProductContractRelationshipBObj>
													<ProductContractRelationshipType>1</ProductContractRelationshipType>
													<TCRMExtension>
														<ExtendedObject>XProductContractRelationshipBObjExt
														</ExtendedObject>
														<XProductContractRelationshipBObjExt />
													</TCRMExtension>
												</TCRMProductContractRelationshipBObj>
												<ProductAdminSysKeyBObj>
													<AdminSystemType>1</AdminSystemType>
													<xsl:for-each select="currentAttributes/attribute">
																	<xsl:choose>
																		<xsl:when test="name = 'PackageId'">
																			<ProductAdminSysKeyPartOne>
																				<xsl:value-of select="value" />
																			</ProductAdminSysKeyPartOne>
																		</xsl:when>
																	</xsl:choose>
														</xsl:for-each>
												</ProductAdminSysKeyBObj>
											</ProductContractRelationshipCompositeBObj>
											<xsl:for-each select="orderLineItem">
											<xsl:if test="productName = 'Channels'">
											<ProductContractRelationshipCompositeBObj>
												<TCRMProductContractRelationshipBObj>
													<ProductContractRelationshipType>2</ProductContractRelationshipType>
													<TCRMExtension>
														<ExtendedObject>XProductContractRelationshipBObjExt
														</ExtendedObject>
														<XProductContractRelationshipBObjExt />
													</TCRMExtension>
												</TCRMProductContractRelationshipBObj>
												<ProductAdminSysKeyBObj>
													<AdminSystemType>1</AdminSystemType>
													<xsl:for-each select="currentAttributes/attribute">
																	<xsl:choose>
																		<xsl:when test="name = 'PackageId'">
																			<ProductAdminSysKeyPartOne>
																				<xsl:value-of select="value" />
																			</ProductAdminSysKeyPartOne>
																		</xsl:when>
																	</xsl:choose>
														</xsl:for-each>
												</ProductAdminSysKeyBObj>
											</ProductContractRelationshipCompositeBObj>
											</xsl:if>
											</xsl:for-each>
											<TCRMAdminContEquivBObj>
												<AdminPartyId>
												<xsl:value-of select="//CustomerAccountNumber"/>
												</AdminPartyId>
												<AdminSystemType>1</AdminSystemType>
											</TCRMAdminContEquivBObj>
										</ContractCompositeMBObj>
									</xsl:when>
									<xsl:when test="productName = 'IPTV' and actionCode = 'DELETE'">
									
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
														<xsl:for-each select="currentAttributes/attribute">
														<xsl:if test="name = 'ServiceNumber'">
														<AdminContractId>
														<xsl:value-of select="value" />
														</AdminContractId>
														</xsl:if>
														</xsl:for-each>
													<AdminFieldNameType>10</AdminFieldNameType>
												</TCRMAdminNativeKeyBObj>
											</TCRMContractBObj>
										</ContractCompositeMBObj>
				
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
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

	<xsl:template name="formatDate">
		<xsl:param name="str" />
		<xsl:if test="$str">
			<xsl:variable name="year" select="substring($str,1,4)" />
			<xsl:variable name="month" select="substring($str,5,2)" />
			<xsl:variable name="day" select="substring($str,7,2)" />
			<xsl:variable name="hour" select="substring($str,9,2)" />
			<xsl:variable name="min" select="substring($str,11,2)" />
			<xsl:variable name="sec" select="substring($str,13,2)" />
			<xsl:value-of select="$year" />-<xsl:value-of select="$month" />-<xsl:value-of select="$day" /><xsl:text> </xsl:text><xsl:value-of select="$hour" />:<xsl:value-of select="$min" />:<xsl:value-of select="$sec" />.000000</xsl:if>
	</xsl:template>

	<xsl:template name="formatSlashedDate">
		<xsl:param name="str" />
		<xsl:if test="$str">
			<xsl:variable name="year" select="substring($str,7,4)" />
			<xsl:variable name="month" select="substring($str,1,2)" />
			<xsl:variable name="day" select="substring($str,4,2)" />
			<xsl:variable name="hour" select="substring($str,12,2)" />
			<xsl:variable name="min" select="substring($str,15,2)" />
			<xsl:variable name="sec" select="substring($str,18,2)" />
			<xsl:value-of select="$year" />-<xsl:value-of select="$month" />-<xsl:value-of select="$day" /><xsl:text> </xsl:text><xsl:choose><xsl:when test="($hour)"><xsl:value-of select="$hour" /></xsl:when><xsl:otherwise>00</xsl:otherwise></xsl:choose>:<xsl:choose><xsl:when test="($min)"><xsl:value-of select="$min" /></xsl:when><xsl:otherwise>00</xsl:otherwise></xsl:choose>:<xsl:choose><xsl:when test="($sec)"><xsl:value-of select="$sec" /></xsl:when><xsl:otherwise>00</xsl:otherwise></xsl:choose>.000000</xsl:if>
	</xsl:template>

</xsl:stylesheet>