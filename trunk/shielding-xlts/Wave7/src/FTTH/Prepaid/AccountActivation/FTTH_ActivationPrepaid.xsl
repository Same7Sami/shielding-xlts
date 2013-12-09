<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" />
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
					<xsl:value-of select="//SR_HEADER/OrderCreationDate" />
					</xsl:otherwise>
					</xsl:choose>
				</requestID>
				<DWLControl>
					<requesterName>FTTHActivationPre</requesterName>
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
									<xsl:choose>
										<xsl:when test="//Order-Info/LineActivationDate and //Order-Info/LineActivationDate !=''">
											<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//Order-Info/LineActivationDate" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//SR_HEADER/OrderCreationDate" />
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									</CreatedDate>
									<BirthDate>
									<xsl:call-template name="formatSlashedDate">
											<xsl:with-param name="str"
												select="//Contact/BirthDate" />
									</xsl:call-template>
									</BirthDate>
									<GenderType>
										<xsl:value-of select="//Contact/Gender" />
									</GenderType>
									<CitizenshipType>
										<xsl:value-of select="//Contact/Nationality" />
									</CitizenshipType>
									<TCRMExtension>
										<ExtendedObject>XPersonBObjExt</ExtendedObject>
										<XPersonBObjExt>
											<BirthDateHijri>
											<xsl:call-template name="recurse-over-string">
												<xsl:with-param name="str"
													select="//Contact/HijriDate" />
											</xsl:call-template>
											</BirthDateHijri>
											<JobTitle>
												<xsl:value-of select="//Contact/JobTitle" />
											</JobTitle>
											<OccupationType>
												<xsl:value-of select="//Contact/Occupation" />
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
										<xsl:value-of select="//Contact/DocIdType" />
										</IdentificationType>
										<IdentificationNumber>
										<xsl:value-of select="//Contact/DocIdNumber" />
										</IdentificationNumber>
										<IdentificationExpiryDate>
									<xsl:call-template name="formatSlashedDate">
											<xsl:with-param name="str"
												select="//Contact/DocIdExpDate" />
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
										<xsl:value-of select="//Contact/CustomerAccountNumber"/>
										</AdminPartyId>
										<AdminSystemType>1</AdminSystemType>
									</TCRMAdminContEquivBObj>
									<TCRMPersonNameBObj>
										<NameUsageType>1</NameUsageType>
										<PrefixType>
										<xsl:value-of select="//Contact/Title" />
										</PrefixType>
										<GivenNameOne>
										<xsl:value-of select="//Contact/FirstName" />
										</GivenNameOne>
										<GivenNameTwo>
										<xsl:value-of select="//Contact/MiddleName" />
										</GivenNameTwo>
										<LastName>
										<xsl:value-of select="//Contact/LastName" />
										</LastName>
										<TCRMExtension>
											<ExtendedObject>XPersonNameBObjExt</ExtendedObject>
											<XPersonNameBObjExt>
												<FullName>
													<xsl:value-of select="//Contact/FullName" />		
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
										<xsl:choose>
										<xsl:when test="//Order-Info/LineActivationDate and //Order-Info/LineActivationDate !=''">
											<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//Order-Info/LineActivationDate" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="formatDate">
											<xsl:with-param name="str"
												select="//SR_HEADER/OrderCreationDate" />
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
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
											<xsl:value-of select="//DepartmentAccountNumber" />
										</AdminContractId>
										<AdminFieldNameType>9</AdminFieldNameType>
									</TCRMAdminNativeKeyBObj>
								</TCRMContractBObj>
								<TCRMAdminContEquivBObj>
									<AdminPartyId>
									<xsl:value-of select="//Contact/CustomerAccountNumber"/>
									</AdminPartyId>
									<AdminSystemType>1</AdminSystemType>
								</TCRMAdminContEquivBObj>
							</ContractCompositeMBObj>

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
													<xsl:choose>
													<xsl:when test="//Order-Info/LineActivationDate and //Order-Info/LineActivationDate !=''">
														<xsl:call-template name="formatDate">
														<xsl:with-param name="str"
															select="//Order-Info/LineActivationDate" />
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
															<xsl:call-template name="formatDate">
															<xsl:with-param name="str"
															select="//SR_HEADER/OrderCreationDate" />
														</xsl:call-template>
													</xsl:otherwise>
													</xsl:choose>
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
														<DeviceSerialNumber>
															<xsl:value-of select="//CPESerialNumber" />
														</DeviceSerialNumber>
														<CPEDCN>
															<xsl:value-of select="//CPECertificateNumber" />
														</CPEDCN>
														<xsl:choose>
															<xsl:when test="//PlanType = 'Postpaid'">
																<PayType>2</PayType>
															</xsl:when>
															<xsl:otherwise>
																<PayType>1</PayType>
															</xsl:otherwise>
														</xsl:choose>
														<NetworkStatusType>1</NetworkStatusType>
														<CPEMacAddress>
															<xsl:value-of select="//CPEMACAddress" />
														</CPEMacAddress>
														<ExpiryDate>
															<xsl:call-template name="formatDate">
																<xsl:with-param name="str" select="//ExpiryDate"/>
															</xsl:call-template>
														</ExpiryDate>
													</XContractBObjExt>
												</TCRMExtension>
												<TCRMContractComponentBObj>
													<ContractStatusType>7</ContractStatusType>
												</TCRMContractComponentBObj>
												<TCRMAdminNativeKeyBObj>
													<AdminContractId>
														<xsl:value-of select="//AccountNumber" />
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
																select="//DepartmentAccountNumber" />
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
													<xsl:if test="//PackageName = 'FTTH Package'">
													<ProductAdminSysKeyPartOne>6000</ProductAdminSysKeyPartOne>
													</xsl:if>
												</ProductAdminSysKeyBObj>
											</ProductContractRelationshipCompositeBObj>
<!--												<xsl:if test="//Order-Info/Promotion and //Order-Info/Promotion !=''">-->
<!--											<ProductContractRelationshipCompositeBObj>-->
<!--												<TCRMProductContractRelationshipBObj>-->
<!--													<ProductContractRelationshipType>3</ProductContractRelationshipType>-->
<!--													<TCRMExtension>-->
<!--														<ExtendedObject>XProductContractRelationshipBObjExt-->
<!--														</ExtendedObject>-->
<!--														<XProductContractRelationshipBObjExt />-->
<!--													</TCRMExtension>-->
<!--												</TCRMProductContractRelationshipBObj>-->
<!--												<ProductAdminSysKeyBObj>-->
<!--													<AdminSystemType>1</AdminSystemType>-->
<!--													<ProductAdminSysKeyPartOne>-->
<!--														<xsl:value-of select="//Order-Info/Promotion" />-->
<!--													</ProductAdminSysKeyPartOne>-->
<!--												</ProductAdminSysKeyBObj>-->
<!--											</ProductContractRelationshipCompositeBObj>-->
<!--												</xsl:if>-->
											<TCRMAdminContEquivBObj>
												<AdminPartyId>
												<xsl:value-of select="//Contact/CustomerAccountNumber"/>
												</AdminPartyId>
												<AdminSystemType>1</AdminSystemType>
											</TCRMAdminContEquivBObj>
											<ContractValueCompositeBObj>
													<TCRMContractValueBObj>
														<ContractValueType>31</ContractValueType>
												<xsl:for-each select="//Attributes/Attribute">
															<xsl:choose>
															<xsl:when test="Name = 'Bandwidth'">
																<Attribute1Type>96</Attribute1Type>
																<Attribute1String>
																	<xsl:value-of select="Value" />
																</Attribute1String>
															</xsl:when>
															<xsl:when test="Name = 'Duration'">
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