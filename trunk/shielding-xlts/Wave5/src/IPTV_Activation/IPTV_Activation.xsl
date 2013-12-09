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
					<requesterName>IPTVActivation</requesterName>
					<requesterLanguage>100</requesterLanguage>
					<clientSystemName>
					<xsl:value-of select="//SR_HEADER/RequestorChannelId"/>
					</clientSystemName>
				</DWLControl>
			</RequestControl>
			<TCRMTx>
				<TCRMTxType>addPartyWithContractsComposite</TCRMTxType>
				<TCRMTxObject>PartyWithContractsCompositeBObj</TCRMTxObject>
				<TCRMObject>
					<PartyWithContractsCompositeBObj>
						<PartyCompositeBObj>
							<PartyCompositeMBObj>
								<TCRMPersonBObj>
									<PartyType>P</PartyType>
									<CreatedDate>
									<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//SR_HEADER/OrderCreationDate" />
									</xsl:call-template>
									</CreatedDate>
									<BirthDate>
									<xsl:call-template name="formatSlashedDate">
											<xsl:with-param name="str"
												select="//orderContact/BirthDate" />
									</xsl:call-template>
									</BirthDate>
									<GenderType>
										<xsl:value-of select="//orderContact/Gender" />
									</GenderType>
									<CitizenshipType>
										<xsl:value-of select="//orderContact/Nationality" />
									</CitizenshipType>
									<TCRMExtension>
										<ExtendedObject>XPersonBObjExt</ExtendedObject>
										<XPersonBObjExt>
											<BirthDateHijri>
											<xsl:call-template name="recurse-over-string">
												<xsl:with-param name="str"
													select="//orderContact/HijriDate" />
											</xsl:call-template>
											</BirthDateHijri>
											<JobTitle>
												<xsl:value-of select="//orderContact/JobTitle" />
											</JobTitle>
											<OccupationType>
												<xsl:value-of select="//orderContact/Occupation" />
											</OccupationType>
											<BirthDateFormatType>2</BirthDateFormatType>
											<ELMVerifiedFlag>N</ELMVerifiedFlag>
											<CreatedUser>
											<xsl:value-of select="//SR_HEADER/AgentId" />
											</CreatedUser>
											<CreatedDealerId>
											<xsl:value-of select="//SR_HEADER/DealerId" />
											</CreatedDealerId>
											<CreatedShopId>
											<xsl:value-of select="//SR_HEADER/ShopId" />
											</CreatedShopId>
										</XPersonBObjExt>
									</TCRMExtension>
									<TCRMPartyIdentificationBObj>
										<IdentificationType>
										<xsl:value-of select="//orderContact/DocIdType" />
										</IdentificationType>
										<IdentificationNumber>
										<xsl:value-of select="//orderContact/DocIdNumber" />
										</IdentificationNumber>
										<IdentificationExpiryDate>
									<xsl:call-template name="formatSlashedDate">
											<xsl:with-param name="str"
												select="//orderContact/DocIdExpDate" />
									</xsl:call-template>
										</IdentificationExpiryDate>
										<TCRMExtension>
											<ExtendedObject>XPartyIdentificationBObjExt</ExtendedObject>
											<XPartyIdentificationBObjExt>
											<DateFormatType>2</DateFormatType>
											</XPartyIdentificationBObjExt>
										</TCRMExtension>
									</TCRMPartyIdentificationBObj>
									<TCRMAdminContEquivBObj>
										<AdminPartyId>
										<xsl:value-of select="//orderContact/CustomerAccountNumber"/>
										</AdminPartyId>
										<AdminSystemType>1</AdminSystemType>
									</TCRMAdminContEquivBObj>
									<TCRMPersonNameBObj>
										<NameUsageType>1</NameUsageType>
										<PrefixType>
										<xsl:value-of select="//orderContact/Title" />
										</PrefixType>
										<GivenNameOne>
										<xsl:value-of select="//orderContact/FirstName" />
										</GivenNameOne>
										<GivenNameTwo>
										<xsl:value-of select="//orderContact/MiddleName" />
										</GivenNameTwo>
										<LastName>
										<xsl:value-of select="//orderContact/LastName" />
										</LastName>
										<TCRMExtension>
											<ExtendedObject>XPersonNameBObjExt</ExtendedObject>
											<XPersonNameBObjExt>
												<FullName>
													<xsl:value-of select="//orderContact/FullName" />		
												</FullName>
											</XPersonNameBObjExt>
										</TCRMExtension>
									</TCRMPersonNameBObj>
								</TCRMPersonBObj>
							</PartyCompositeMBObj>
						</PartyCompositeBObj>

						<ContractCompositeBObj>
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
									<xsl:choose>
									<xsl:when test="//BillFrequency = 'Annual' or //BillFrequency = 'Yearly'">
									<FrequencyModeType>1</FrequencyModeType>
									</xsl:when>
									<xsl:when test="//BillFrequency = 'Semi-Yearly' or //BillFrequency = 'Semiannually'">
									<FrequencyModeType>2</FrequencyModeType>
									</xsl:when>
									<xsl:when test="//BillFrequency = 'Quarterly'">
									<FrequencyModeType>3</FrequencyModeType>
									</xsl:when>
									<xsl:when test="//BillFrequency = 'Monthly'">
									<FrequencyModeType>5</FrequencyModeType>
									</xsl:when>
									<xsl:when test="//BillFrequency = 'Bimonthly'">
									<FrequencyModeType>9</FrequencyModeType>
									</xsl:when>
									</xsl:choose> 
									<SignedDate>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//SR_HEADER/OrderCreationDate" />
										</xsl:call-template>
									</SignedDate>
									<AgreementStatusType>5</AgreementStatusType>
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
											<BillCycleType>
												<xsl:value-of select="//BillCycle" />
											</BillCycleType>
											<SrviceBillingIndicator>B</SrviceBillingIndicator>
											<xsl:choose>
												<xsl:when test="//MediaType = 'Postal'">
												<BillPreferenceType>1</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Email'">
												<BillPreferenceType>2</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Fiche'">
												<BillPreferenceType>3</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Courier'">
												<BillPreferenceType>4</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Disk'">
												<BillPreferenceType>5</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Fax'">
												<BillPreferenceType>6</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'CD-Rom'">
												<BillPreferenceType>7</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Paper'">
												<BillPreferenceType>8</BillPreferenceType>
												</xsl:when>
												<xsl:when test="//MediaType = 'Delivery Method'">
												<BillPreferenceType>9</BillPreferenceType>
												</xsl:when>
												<xsl:otherwise>
												<BillPreferenceType>0</BillPreferenceType>
												</xsl:otherwise>
											</xsl:choose> 
											<xsl:choose>
												<xsl:when test="//InvoiceTemplate = 'Business'">
												<InvoiceTemplateType>1</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Young'">
												<InvoiceTemplateType>2</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Family'">
												<InvoiceTemplateType>3</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'VIP'">
												<InvoiceTemplateType>4</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Staff'">
												<InvoiceTemplateType>5</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Individual'">
												<InvoiceTemplateType>6</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Invoice Template A' or //InvoiceTemplate = 'Invoice Template A1'">
												<InvoiceTemplateType>7</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Invoice Template B'">
												<InvoiceTemplateType>8</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Invoice Template C'">
												<InvoiceTemplateType>9</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Expat'">
												<InvoiceTemplateType>10</InvoiceTemplateType>
												</xsl:when>
												<xsl:when test="//InvoiceTemplate = 'Female'">
												<InvoiceTemplateType>11</InvoiceTemplateType>
												</xsl:when>
												<xsl:otherwise>
												<InvoiceTemplateType>0</InvoiceTemplateType>
												</xsl:otherwise>
											</xsl:choose>
										</XContractBObjExt>
									</TCRMExtension>
									<TCRMContractComponentBObj>
										<ContractStatusType>7</ContractStatusType>
									</TCRMContractComponentBObj>
									<TCRMAdminNativeKeyBObj>
										<AdminContractId>
											<xsl:value-of select="//orderServiceAccount/BillingAccountNumber" />
										</AdminContractId>
										<AdminFieldNameType>9</AdminFieldNameType>
									</TCRMAdminNativeKeyBObj>
								</TCRMContractBObj>
								<TCRMAdminContEquivBObj>
									<AdminPartyId>
									<xsl:value-of select="//orderContact/CustomerAccountNumber"/>
									</AdminPartyId>
									<AdminSystemType>1</AdminSystemType>
								</TCRMAdminContEquivBObj>
							</ContractCompositeMBObj>

							<xsl:for-each select="//orderLineItem">
								<xsl:choose>
									<xsl:when test="productName = 'FTTH'">
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
														<xsl:for-each select="orderLineItem/currentAttributes/attribute">		
																<xsl:if test="name = 'DCN'">
																	<CPEDCN>
																		<xsl:value-of select="value" />
																	</CPEDCN>
																</xsl:if>
														</xsl:for-each>		
														<xsl:choose>
															<xsl:when test="//PayType = 'Postpaid'">
																<PayType>2</PayType>
															</xsl:when>
															<xsl:otherwise>
																<PayType>1</PayType>
															</xsl:otherwise>
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
													<AdminContractId>
														<xsl:value-of select="//orderServiceAccount/ServiceAccountNumber" />
													</AdminContractId>
													<AdminFieldNameType>8</AdminFieldNameType>
												</TCRMAdminNativeKeyBObj>
											</TCRMContractBObj>
											<ContractRelationshipCompositeBObj>
												<TCRMContractRelationshipBObj>
													<RelationshipType>1</RelationshipType>
													<RelationshipValue>Child</RelationshipValue>
													<RelationshipStatusType>1</RelationshipStatusType>
													<TCRMExtension>
														<ExtendedObject>XContractRelationshipBObjExt
														</ExtendedObject>
														<XContractRelationshipBObjExt />
													</TCRMExtension>
													<TCRMAdminNativeKeyBObj>
														<AdminContractId>
															<xsl:value-of
																select="//orderServiceAccount/BillingAccountNumber" />
														</AdminContractId>
														<AdminFieldNameType>9</AdminFieldNameType>
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
													<AdminSystemType>21</AdminSystemType>
													<ProductAdminSysKeyPartOne>
														<xsl:value-of select="//orderServiceAccount/PackageID" />
													</ProductAdminSysKeyPartOne>
												</ProductAdminSysKeyBObj>
											</ProductContractRelationshipCompositeBObj>
											<TCRMAdminContEquivBObj>
												<AdminPartyId>
												<xsl:value-of select="//orderContact/CustomerAccountNumber"/>
												</AdminPartyId>
												<AdminSystemType>1</AdminSystemType>
											</TCRMAdminContEquivBObj>
											<ContractValueCompositeBObj>
													<TCRMContractValueBObj>
														<ContractValueType>31</ContractValueType>
											<xsl:for-each select="currentAttributes/attribute">
														<xsl:choose>
															<xsl:when test="name = 'bandwidth'">
																<Attribute1Type>96</Attribute1Type>
																<Attribute1String>
																	<xsl:value-of select="value" />
																</Attribute1String>
															</xsl:when>
															<xsl:when test="name = 'LoginId'">
																<Attribute4Type>104</Attribute4Type>
																<Attribute4String>
																	<xsl:value-of select="value" />
																</Attribute4String>
															</xsl:when>
															<xsl:when test="name = 'Domain'">
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
									<xsl:when test="productName = 'IPTV'">

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
															<xsl:otherwise>
																<PayType>1</PayType>
															</xsl:otherwise>
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
												<xsl:value-of select="//orderContact/CustomerAccountNumber"/>
												</AdminPartyId>
												<AdminSystemType>1</AdminSystemType>
											</TCRMAdminContEquivBObj>
										</ContractCompositeMBObj>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</ContractCompositeBObj>
					</PartyWithContractsCompositeBObj>
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