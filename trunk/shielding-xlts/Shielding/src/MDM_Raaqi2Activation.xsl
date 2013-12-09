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
											<xsl:value-of select="//Dealer_Id" />
										</CreatedDealerId>
										<CreatedShopId>
											<xsl:value-of select="//SHOP_ID" />
										</CreatedShopId>
										<MSISDN>
											<xsl:value-of select="//MSISDN" />
										</MSISDN>
										<xsl:choose>
											<xsl:when test="//Vanity = '0' ">
												<VanityType>1</VanityType>
											</xsl:when>
											<xsl:when test="//Vanity = '1' ">
												<VanityType>2</VanityType>
											</xsl:when>
											<xsl:when test="//Vanity = '2' ">
												<VanityType>3</VanityType>
											</xsl:when>
											<xsl:when test="//Vanity = '3' ">
												<VanityType>4</VanityType>
											</xsl:when>
											<xsl:when test="//Vanity = '4' ">
												<VanityType>5</VanityType>
											</xsl:when>
											<xsl:when test="//Vanity = '5' ">
												<VanityType>6</VanityType>
											</xsl:when>
											<xsl:otherwise>
												<VanityType>0</VanityType>
											</xsl:otherwise>
										</xsl:choose>
										<SIM>
											<xsl:value-of select="//SIM" />
										</SIM>
										<DeviceSerialNumber>
											<xsl:value-of select="//DEVICE/IMEI" />
										</DeviceSerialNumber>
										<PayType>
											<xsl:value-of select="//PricingPlan" />
										</PayType>
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
							
							<ProductContractRelationshipCompositeBObj>
								<TCRMProductContractRelationshipBObj>
									<StartDate />
									<EndDate />
									<ProductContractRelationshipType />
									<TCRMExtension>
										<ExtendedObject>XProductContractRelationshipBObjExt
										</ExtendedObject>
										<XProductContractRelationshipBObjExt>
											<AgreementStatusType />
											<PromotionId />
										</XProductContractRelationshipBObjExt>
									</TCRMExtension>
								</TCRMProductContractRelationshipBObj>
								<ProductAdminSysKeyBObj>
									<AdminSystemType>21</AdminSystemType>
									<ProductAdminSysKeyPartOne>
										<xsl:value-of select="//PackageID" />
									</ProductAdminSysKeyPartOne>
								</ProductAdminSysKeyBObj>
							</ProductContractRelationshipCompositeBObj>

							<ProductContractRelationshipCompositeBObj>
								<TCRMProductContractRelationshipBObj>
									<StartDate />
									<EndDate />
									<ProductContractRelationshipType />
									<TCRMExtension>
										<ExtendedObject>XProductContractRelationshipBObjExt
										</ExtendedObject>
										<XProductContractRelationshipBObjExt>
											<AgreementStatusType />
											<PromotionId />
										</XProductContractRelationshipBObjExt>
									</TCRMExtension>
								</TCRMProductContractRelationshipBObj>
								<ProductAdminSysKeyBObj>
									<AdminSystemType>21</AdminSystemType>
									<ProductAdminSysKeyPartOne>
										<xsl:value-of select="//PackageId" />
									</ProductAdminSysKeyPartOne>
								</ProductAdminSysKeyBObj>
							</ProductContractRelationshipCompositeBObj>
							
							<xsl:for-each select="//Service">
								<xsl:choose>
									<xsl:when test="SupplementaryService = 'ICS2' ">
										<xsl:choose>
											<!-- but relation with sysdate if unsubscribe -->
											<xsl:when test="Operation = 'ICS2_UNSUBSRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate>sysdate</EndDate>
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>ICS2</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
											<xsl:when test="Operation = 'ICS2_SUBSRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate />
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>ICS2</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="SupplementaryService = 'TEJWALY' ">
										<xsl:choose>
											<!-- but relation with sysdate if unsubscribe -->
											<xsl:when test="Operation = 'TEJWALY_UNSUBSCRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate>sysdate</EndDate>
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>TEJWALI</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
											<xsl:when test="Operation = 'TEJWALY_SUBSCRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate />
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>TEJWALI</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="SupplementaryService = 'BIS' ">
										<xsl:choose>
											<xsl:when test="Operation = 'BIS_UNSUBSCRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate>sysdate</EndDate>
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>1001</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
											<xsl:when test="Operation = 'BIS_SUBSCRIBE' ">
												<ProductContractRelationshipCompositeBObj>
													<TCRMProductContractRelationshipBObj>
														<StartDate />
														<EndDate />
														<ProductContractRelationshipType />
														<TCRMExtension>
															<ExtendedObject>XProductContractRelationshipBObjExt
															</ExtendedObject>
															<XProductContractRelationshipBObjExt>
																<AgreementStatusType />
																<PromotionId />
															</XProductContractRelationshipBObjExt>
														</TCRMExtension>
													</TCRMProductContractRelationshipBObj>
													<ProductAdminSysKeyBObj>
														<AdminSystemType>15</AdminSystemType>
														<ProductAdminSysKeyPartOne>1001</ProductAdminSysKeyPartOne>
													</ProductAdminSysKeyBObj>
												</ProductContractRelationshipCompositeBObj>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</ContractCompositeMBObj>
					</ContractCompositeBObj>
				</TCRMObject>
			</TCRMTx>
		</TCRMService>
	</xsl:template>
</xsl:stylesheet>
