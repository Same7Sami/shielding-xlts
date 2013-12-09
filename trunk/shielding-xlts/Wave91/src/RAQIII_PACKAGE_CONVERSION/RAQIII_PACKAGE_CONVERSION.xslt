<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:call-template name="recurse-over-string">
						<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
					</xsl:call-template>
				</requestID>
				<DWLControl>
					<requesterName>Raqi2PckgConv</requesterName>
					<requesterLanguage>100</requesterLanguage>
					<clientSystemName>
						<xsl:value-of select="//Mobily-Order/Order-Header/RequestorChannelId"></xsl:value-of>
					</clientSystemName>
				</DWLControl>
			</RequestControl>
			<TCRMTx>
				<TCRMTxType>updateContractComposite</TCRMTxType>
				<TCRMTxObject>ContractCompositeBObj</TCRMTxObject>
				<TCRMObject>
					<ContractCompositeBObj>
						<xsl:apply-templates/>
					</ContractCompositeBObj>
				</TCRMObject>
			</TCRMTx>
		</TCRMService>
	</xsl:template>
	
	<xsl:template match="text()"/>
	
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
	
	<xsl:template name="serviceAccount" match="ServiceAccount">
		
		<xsl:if test="Operation = 'PACKAGE_CONVERSION' and Type = 'OLD'">
						<ContractCompositeMBObj>
							<TCRMContractBObj>
								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
									</XContractBObjExt>
								</TCRMExtension>
								<TCRMAdminNativeKeyBObj>
										<AdminContractId>
											<xsl:value-of select="AccountNumber" />
										</AdminContractId>
										<AdminFieldNameType>8</AdminFieldNameType>
								</TCRMAdminNativeKeyBObj>
							</TCRMContractBObj>
									<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
												<EndDate>
													<xsl:call-template name="formatDate">
														<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
													</xsl:call-template>
												</EndDate>
											<ProductContractRelationshipType>1</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt></XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<ProductAdminSysKeyBObj>
											<AdminSystemType>21</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="GSMAccounts/GSMAccount/ProductInfo/Id" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
									</ProductContractRelationshipCompositeBObj>
						</ContractCompositeMBObj>
						</xsl:if> 
						
						<xsl:if test="Operation = 'PACKAGE_CONVERSION' and Type = 'NEW'">
						<ContractCompositeMBObj>
							<TCRMContractBObj>
								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
									</XContractBObjExt>
								</TCRMExtension>
								<TCRMAdminNativeKeyBObj>
										<AdminContractId>
											<xsl:value-of select="AccountNumber" />
										</AdminContractId>
										<AdminFieldNameType>8</AdminFieldNameType>
								</TCRMAdminNativeKeyBObj>
							</TCRMContractBObj>
									<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
												<StartDate>
													<xsl:call-template name="formatDate">
														<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
													</xsl:call-template>
												</StartDate>
											<ProductContractRelationshipType>1</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt></XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<ProductAdminSysKeyBObj>
											<AdminSystemType>21</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="GSMAccounts/GSMAccount/ProductInfo/Id" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
									</ProductContractRelationshipCompositeBObj>
									<xsl:if test="GSMAccounts/GSMAccount/ProductInfo/ProductFeatures and GSMAccounts/GSMAccount/ProductInfo/ProductFeatures!=''">
										<xsl:for-each select="GSMAccounts/GSMAccount/ProductInfo/ProductFeatures/Service[serviceId='3016']">
										<xsl:if test="position()=1">
										<ProductContractRelationshipCompositeBObj>
											<TCRMProductContractRelationshipBObj>
													<StartDate>
														<xsl:call-template name="formatDate">
															<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
														</xsl:call-template>
													</StartDate>
												<ProductContractRelationshipType>2</ProductContractRelationshipType>
												<TCRMExtension>
													<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
													<XProductContractRelationshipBObjExt></XProductContractRelationshipBObjExt>
												</TCRMExtension>
											</TCRMProductContractRelationshipBObj>
											<ProductAdminSysKeyBObj>
												<AdminSystemType>8</AdminSystemType>
												<ProductAdminSysKeyPartOne>
													<xsl:value-of select="serviceId" />
												</ProductAdminSysKeyPartOne>
											</ProductAdminSysKeyBObj>
										</ProductContractRelationshipCompositeBObj>
										</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="GSMAccounts/GSMAccount/ProductInfo/ProductFeatures/Service[serviceId='3041']">
										<xsl:if test="position()=1">
										<ProductContractRelationshipCompositeBObj>
											<TCRMProductContractRelationshipBObj>
													<StartDate>
														<xsl:call-template name="formatDate">
															<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
														</xsl:call-template>
													</StartDate>
												<ProductContractRelationshipType>2</ProductContractRelationshipType>
												<TCRMExtension>
													<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
													<XProductContractRelationshipBObjExt></XProductContractRelationshipBObjExt>
												</TCRMExtension>
											</TCRMProductContractRelationshipBObj>
											<ProductAdminSysKeyBObj>
												<AdminSystemType>8</AdminSystemType>
												<ProductAdminSysKeyPartOne>
													<xsl:value-of select="serviceId" />
												</ProductAdminSysKeyPartOne>
											</ProductAdminSysKeyBObj>
										</ProductContractRelationshipCompositeBObj>
										</xsl:if>
										</xsl:for-each>
									<xsl:for-each select="GSMAccounts/GSMAccount/ProductInfo/ProductFeatures/Service">
										<xsl:if test="serviceId and serviceId!='3041' and serviceId!='3016'">
										<ProductContractRelationshipCompositeBObj>
											<TCRMProductContractRelationshipBObj>
													<StartDate>
														<xsl:call-template name="formatDate">
															<xsl:with-param name="str" select="//Mobily-Order/Order-Header/OrderSubmitDate" />
														</xsl:call-template>
													</StartDate>
												<ProductContractRelationshipType>2</ProductContractRelationshipType>
												<TCRMExtension>
													<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
													<XProductContractRelationshipBObjExt></XProductContractRelationshipBObjExt>
												</TCRMExtension>
											</TCRMProductContractRelationshipBObj>
											<ProductAdminSysKeyBObj>
												<AdminSystemType>8</AdminSystemType>
												<ProductAdminSysKeyPartOne>
													<xsl:value-of select="serviceId" />
												</ProductAdminSysKeyPartOne>
											</ProductAdminSysKeyBObj>
										</ProductContractRelationshipCompositeBObj>
										</xsl:if>
										</xsl:for-each>
										
										<xsl:for-each select="GSMAccounts/GSMAccount/ProductInfo/ProductFeatures/Service[serviceId='3041']">
										<ContractValueCompositeBObj>				
										<TCRMContractValueBObj>
										<xsl:for-each select="Attribute">  
											<xsl:if test="Name = 'SIM_ID'">
												<ContractValueType>4<xsl:value-of select="Value"></xsl:value-of></ContractValueType>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'DUMMY_MSISDN' ">
												<Attribute0Type>113</Attribute0Type>
												<Attribute0String>
												<xsl:value-of select="Value"/>
												</Attribute0String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'IMSI'">
												<Attribute1Type>106</Attribute1Type>
												<Attribute1String>
												<xsl:value-of select="Value"/>
												</Attribute1String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'SIM' ">
												<Attribute2Type>107</Attribute2Type>
												<Attribute2String>
												<xsl:value-of select="Value"/>
												</Attribute2String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'Puk1'">
												<Attribute3Type>108</Attribute3Type>
												<Attribute3String>
												<xsl:value-of select="Value"/>
												</Attribute3String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'Puk2'">
												<Attribute4Type>109</Attribute4Type>
												<Attribute4String>
												<xsl:value-of select="Value"/>
												</Attribute4String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="Attribute">
											<xsl:if test="Value and Value!='' and Name = 'GPRS_Enabled'">
												<Attribute5Type>110</Attribute5Type>
												<Attribute5String>Y</Attribute5String>
											</xsl:if>
										</xsl:for-each>
									</TCRMContractValueBObj>											
								</ContractValueCompositeBObj>
								</xsl:for-each>
								</xsl:if>
						</ContractCompositeMBObj>
						</xsl:if>
						<xsl:if test="Operation = 'SIM_SWAP'">
						<ContractCompositeMBObj>
							<TCRMContractBObj>
								<TCRMExtension>
									<ExtendedObject>XContractBObjExt</ExtendedObject>
									<XContractBObjExt>
                 						<SIM>
                 							<xsl:value-of select="GSMAccounts/GSMAccount/SIM"/>
                 						</SIM>
                						<PUK1>
                							<xsl:value-of select="GSMAccounts/GSMAccount/PUK1"/>
                						</PUK1>
                						<PUK2>
                							<xsl:value-of select="GSMAccounts/GSMAccount/PUK2"/>
                						</PUK2>
                						<IMSI>
                							<xsl:value-of select="GSMAccounts/GSMAccount/IMSI"/>
                						</IMSI>
									</XContractBObjExt>
								</TCRMExtension>
								<TCRMAdminNativeKeyBObj>
										<AdminContractId>
											<xsl:value-of select="AccountNumber" />
										</AdminContractId>
										<AdminFieldNameType>8</AdminFieldNameType>
								</TCRMAdminNativeKeyBObj>
							</TCRMContractBObj>
						</ContractCompositeMBObj>
						</xsl:if>
	</xsl:template>

</xsl:stylesheet>
