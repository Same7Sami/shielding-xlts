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
					<requesterName>
						<xsl:choose>
							<xsl:when
								test="not(//SR_HEADER/RequestorUserId) or //SR_HEADER/RequestorUserId = ''">
								<xsl:choose>
									<xsl:when
										test="not(//SR_HEADER/AgentId) or //SR_HEADER/AgentId = ''">

										<xsl:choose>
											<xsl:when test="not(//AGENTID) or //AGENTID = ''">
												<xsl:value-of select="//FuncId"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="//AGENTID"/>
											</xsl:otherwise>
										</xsl:choose>

									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="//SR_HEADER/AgentId"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//SR_HEADER/RequestorUserId"/>
							</xsl:otherwise>
						</xsl:choose>
					</requesterName>
					<xsl:choose>
						<xsl:when
							test="//SR_HEADER/RequestorLanguage = 'A' ">
							<requesterLanguage>1100</requesterLanguage>
						</xsl:when>
						<xsl:otherwise>
							<requesterLanguage>100</requesterLanguage>
						</xsl:otherwise>
					</xsl:choose>
					<requestTime>
						<xsl:call-template name="formatDate">
						<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
						</xsl:call-template>
					</requestTime>

					<xsl:choose>
						<xsl:when test="not(//SR_HEADER/RequestorChannelId)">
							<clientSystemName>Mediator</clientSystemName>
						</xsl:when>

						<xsl:otherwise>
							<clientSystemName>
								<xsl:value-of select="//SR_HEADER/RequestorChannelId"/>
							</clientSystemName>
						</xsl:otherwise>

					</xsl:choose>

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
											<xsl:value-of select="//SR_HEADER/DealerId"/>
										</CreatedDealerId>
										<CreatedShopId>
											<xsl:value-of select="//SR_HEADER/ShopId"/>
										</CreatedShopId>
										<PayType>2</PayType>
									</XContractBObjExt>
								</TCRMExtension>
								
							</TCRMContractBObj>
							

							<ProductContractRelationshipCompositeBObj>
								<TCRMProductContractRelationshipBObj>
									<EndDate>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
										</xsl:call-template>
									</EndDate>
									<ProductContractRelationshipType>1</ProductContractRelationshipType>
									<TCRMExtension>
										<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
										<XProductContractRelationshipBObjExt>	
										</XProductContractRelationshipBObjExt>
									</TCRMExtension>
								</TCRMProductContractRelationshipBObj>
								<ProductAdminSysKeyBObj>
									<AdminSystemType>21</AdminSystemType>
									<ProductAdminSysKeyPartOne>
										<xsl:value-of select="//Old_PackageID"/>
									</ProductAdminSysKeyPartOne>
								</ProductAdminSysKeyBObj>
							</ProductContractRelationshipCompositeBObj>


							<ProductContractRelationshipCompositeBObj>
								<TCRMProductContractRelationshipBObj>
									<StartDate>
									<xsl:call-template name="formatDate">
											<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
									</xsl:call-template>
									</StartDate>
									<ProductContractRelationshipType>1</ProductContractRelationshipType>
									<TCRMExtension>
										<ExtendedObject>XProductContractRelationshipBObjExt
										</ExtendedObject>
										<XProductContractRelationshipBObjExt>	
										</XProductContractRelationshipBObjExt>
									</TCRMExtension>
								</TCRMProductContractRelationshipBObj>
								<ProductAdminSysKeyBObj>
									<AdminSystemType>21</AdminSystemType>
									<ProductAdminSysKeyPartOne>
										<xsl:value-of select="//New_PackageID"/>
									</ProductAdminSysKeyPartOne>
								</ProductAdminSysKeyBObj>
							</ProductContractRelationshipCompositeBObj>
							
							<ContractValueCompositeBObj>				
						<TCRMContractValueBObj>             			
							<ContractValueType>28</ContractValueType>
							<ValueString/>		
							<StartDate>
							<xsl:call-template name="formatDate">
									<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
							</xsl:call-template>
							</StartDate>
							<EndDate/>		
							<Attribute0Type>52</Attribute0Type>
							<Attribute0String>
							<xsl:call-template name="extractDate">
									<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
							</xsl:call-template>
							</Attribute0String>
						</TCRMContractValueBObj>											
					</ContractValueCompositeBObj>
					
							<ContractSearchParamsBObj>
                    			<MSISDN><xsl:value-of select="//MSISDN"/></MSISDN>
                 			</ContractSearchParamsBObj>
                 			
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
<xsl:template name="extractDate">
		<xsl:param name="str"/>
<xsl:if test="$str">
			<xsl:variable name="year" select="substring($str,1,4)"/>
			<xsl:variable name="month" select="substring($str,5,2)"/>
			<xsl:variable name="day" select="substring($str,7,2)"/>
			<xsl:value-of select="$year"/>-<xsl:value-of select="$month"/>-<xsl:value-of select="$day"/></xsl:if>
</xsl:template>
	
</xsl:stylesheet>
