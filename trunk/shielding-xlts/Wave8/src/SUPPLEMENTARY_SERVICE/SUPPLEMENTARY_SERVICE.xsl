<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/">
		<TCRMService xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="mobilyRequest.xsd">
			<RequestControl>
				<requestID>
					<xsl:call-template name="recurse-over-string">
						<xsl:with-param name="str" select="//SrDate" />
					</xsl:call-template>
				</requestID>
				<DWLControl>
					<requesterName>ShieldingSupService</requesterName>
					<requesterLanguage>100</requesterLanguage>
					<clientSystemName>
						<xsl:value-of select="//SR_HEADER/RequestorChannelId"></xsl:value-of>
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
									</XContractBObjExt>
								</TCRMExtension>
							</TCRMContractBObj>
							<xsl:choose>
								<xsl:when
									test="//Operation ='CREATE_RBT' or //Operation ='MOBILY_TV_SUB' or //Operation ='TWININGS_SUBSCRIBE' or //Operation ='LBS_SUB' or //Operation ='Hawwel Subscribe' or //Operation ='VIDEO_MAIL_SUBSCRIBE' or //Operation ='ICS2_SUBSCRIBE' or //Operation ='EVMS_SUBSCRIBE' or //Operation ='MMS_BUNDLE_SUBSCRIBE' or //Operation ='TEJWALI_SUBSCRIBE' or //Operation ='RAQI_PLUS_SUBSCRIBE' or //Operation ='VMS_SUBSCRIBE' or //Operation ='MOBILY_PREMIUM_TV_SUBSCRIBE' or //Operation ='RDB_SUBSCRIBE' or //Operation ='VRBT_SUBSCRIBE' or //Operation ='CORP_VOIP_SUBSCRIBE' or //Operation ='SIP_SUBSCRIBE' or //Operation ='WIFI_ROAMING_SUBSCRIBE' or //Operation ='TWININGS_NATIONAL_SUBSCRIBE' or //Operation ='FLAGS_SUBSCRIBE' or //Operation ='OVI_SUBSCRIBE' or //Operation ='CON_VOIP_SUBSCRIBE' or //Operation ='BIS_COMPENSATION_SERVICE_SUBSCRIBE' or //Operation ='BILL_VIA_MMS_SUBSCRIBE' or //Operation ='IDD_WORLD_SUBSCRIBE' or //Operation ='OVI_PLUS_SUBSCRIBE' or //Operation ='VCM_SUBSCRIBE' or //Operation ='VBM_SUBSCRIBE' or //Operation ='MOBILY_TV_AR_SUB' or //Operation ='MOBILY_TV_EN_SUB' or //Operation ='BARCA_STYLE_SUB' or //Operation ='PAY_PER_SOCIAL_SITE_SUBSCRIBE' or //Operation ='PAY_PER_SPORTS_SITE_SUBSCRIBE' or //Operation ='PAY_PER_NEWS_SITE_SUBSCRIBE' or //Operation ='PAY_PER_STOCKS_SITE_SUBSCRIBE' or //Operation ='PAY_PER_FEMALE_SITE_SUBSCRIBE' or //Operation ='PAY_PER_SPECIAL_SITE_SUBSCRIBE' or //Operation ='CHECKED_CHARITY_SUBSCRIBE' or //Operation ='TREATMENT_CHARITY_SUBSCRIBE' or //Operation ='HYBRID_ROAMING_SUB' or //Operation ='FLAGS_SUBSCRIBE_IUC_CONTORL' or //Operation ='DISCOUNTED_RATES_ADDON_SUBSCRIBE' or //Operation ='COMBO_ADDON_SUBSCRIBE' or //Operation ='GOVERNMENT_FEATURE_SUBSCRIBE' or //Operation ='CONNECT_TOPUP_VOICE_SUBSCRIBE' or //Operation ='CONNECT_TOPUP_SKY_SUBSCRIBE' or //Operation ='CONNECT_TOPUP_LTE_SUBSCRIBE' or //Operation ='IDD_SUBSCRIBE' or //Operation ='MIDNIGHT_SMS_SUB' or //Operation ='SAFE_ARRIVAL_SUB' or //Operation ='TEACHER_OFFER_SUBSCRIBE' or //Operation ='MEDICAL_OFFER_SUBSCRIBE' or //Operation ='FALLAH_IDD_SUB' or //Operation ='NAJMA_WAJID_SUB' or //Operation ='FALLAH_WAJID_SUB' or //Operation ='FALLAH_GPRS_SUB' or //Operation ='WHATSAPP_MONTHLY_SUBSCRIBE' or //Operation ='KIBOT_SUBSCRIBE' or //Operation ='MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE'                                                 or //Operation ='raqi_rbt_subscribe' or //Operation ='OTT_DATA_BUNDLE_subscribe' or //Operation ='VOICE_OFFNET_UL_ONNET_SUBSCRIBE' or //Operation ='FIN_CALLING_DATA_SUBSCRIBE' or //Operation ='VOICE_CALLING_SUBSCRIBE' or //Operation ='NATIONAL_CALLING_SUBSCRIBE' or //Operation ='SOCIAL_APP_PKG_subscribe' or //Operation ='BC_LOCALDATA_R_subscribe' or //Operation ='PKG_CUG_MNT_R_subscribe' or //Operation ='BC_LOCALDATA_T_subscribe' or //Operation ='BC_CROSSNET_SMS_T_subscribe' or //Operation ='BC_ONNET_SMS_T_subscribe' or //Operation ='BC_CROSSNET_MNT_T_subscribe' or //Operation ='BC_ONNET_MNT_T_subscribe' or //Operation ='FALLAH1_ADDON_subscribe' or //Operation ='NATIONAL_PREPAID_OFFER_SUBSCRIBE' or //Operation ='BC_NATIONAL_SMS_R_subscribe' or //Operation ='BC_CROSSNET_SMS_R_subscribe' or //Operation ='BC_ONNET_SMS_R_subscribe' or //Operation ='BC_NATIONAL_MNT_R_subscribe' or //Operation ='BC_CROSSNET_MNT_R_subscribe' or //Operation ='BC_ONNET_MNT_R_subscribe' or //Operation ='ROAMING_AND_LOCAL_DATA_SUBSCRIBE' or //Operation ='ROAMING_DATA_SUBSCRIBE' or //Operation ='FACEBOOK_MONTHLY_SUBSCRIBE' or //Operation ='TWITTER_MONTHLY_SUBSCRIBE' or //Operation ='STUDENT_TEJWALI_SUB' or //Operation ='BC_INTL_SMS_R_SUBSCRIBE' or //Operation ='BC_INTL_SMS_T_SUBSCRIBE' or //Operation ='BC_UNLTD_GPRS_R_SUBSCRIBE' or //Operation ='BC_GE_DAWLI_T_subscribe'">
									<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
											<StartDate>
												<xsl:call-template name="formatDate">
													<xsl:with-param name="str" select="//SubscriptionDate" />
												</xsl:call-template>
											</StartDate>
											<ProductContractRelationshipType>2</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt>
												<AgreementStatusType>5</AgreementStatusType>
												<xsl:if test="//PackageType and //PackageType!=''">
													<ServiceType>
													<xsl:value-of select="//PackageType" />
													</ServiceType>
												</xsl:if>
												</XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<ProductAdminSysKeyBObj>
											<AdminSystemType>15</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="//SupplementaryService" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
									</ProductContractRelationshipCompositeBObj>
								</xsl:when>
								<xsl:when test="//Operation ='DELETE_RBT' or //Operation ='MOBILY_TV_UNSUB' or //Operation ='TWININGS_UNSUBSCRIBE' or //Operation ='LBS_UNSUB' or //Operation ='Hawwel Unsubscribe' or //Operation ='GAMING_UNSUB' or //Operation ='VIDEO_MAIL_UNSUBSCRIBE' or //Operation ='ICS2_UNSUBSCRIBE' or //Operation ='EVMS_UNSUBSCRIBE' or //Operation ='MMS_BUNDLE_UNSUBSCRIBE' or //Operation ='TEJWALI_UNSUBSCRIBE' or //Operation ='RAQI_PLUS_UNSUBSCRIBE' or //Operation ='VMS_UNSUBSCRIBE' or //Operation ='MOBILY_PREMIUM_TV_UNSUBSCRIBE' or //Operation ='RDB_UNSUBSCRIBE' or //Operation ='VRBT_UNSUBSCRIBE' or //Operation ='CORP_VOIP_UNSUBSCRIBE' or //Operation ='SIP_UNSUBSCRIBE' or //Operation ='WIFI_ROAMING_UNSUBSCRIBE' or //Operation ='TWININGS_NATIONAL_UNSUBSCRIBE' or //Operation ='FLAGS_UNSUBSCRIBE' or //Operation ='OVI_UNSUBSCRIBE' or //Operation ='CON_VOIP_UNSUBSCRIBE' or //Operation ='BIS_COMPENSATION_SERVICE_UNSUBSCRIBE' or //Operation ='BILL_VIA_MMS_UNSUBSCRIBE' or //Operation ='IDD_WORLD_UNSUBSCRIBE' or //Operation ='OVI_PLUS_UNSUBSCRIBE' or //Operation ='VCM_UNSUBSCRIBE' or //Operation ='VBM_UNSUBSCRIBE' or //Operation ='MOBILY_TV_AR_UNSUB' or //Operation ='MOBILY_TV_EN_UNSUB' or //Operation ='BARCA_STYLE_UNSUB' or //Operation ='PAY_PER_SOCIAL_SITE_UNSUBSCRIBE' or //Operation ='PAY_PER_SPORTS_SITE_UNSUBSCRIBE' or //Operation ='PAY_PER_NEWS_SITE_UNSUBSCRIBE' or //Operation ='PAY_PER_STOCKS_SITE_UNSUBSCRIBE' or //Operation ='PAY_PER_FEMALE_SITE_UNSUBSCRIBE' or //Operation ='PAY_PER_SPECIAL_SITE_UNSUBSCRIBE' or //Operation ='CHECKED_CHARITY_UNSUBSCRIBE' or //Operation ='TREATMENT_CHARITY_UNSUBSCRIBE' or //Operation ='HYBRID_ROAMING_UNSUB' or //Operation ='DISCOUNTED_RATES_ADDON_UNSUBSCRIBE' or //Operation ='COMBO_ADDON_UNSUBSCRIBE' or //Operation ='GOVERNMENT_FEATURE_UNSUBSCRIBE' or //Operation ='CONNECT_TOPUP_VOICE_UNSUBSCRIBE' or //Operation ='CONNECT_TOPUP_SKY_UNSUBSCRIBE' or //Operation ='CONNECT_TOPUP_LTE_UNSUBSCRIBE' or //Operation ='IDD_UNSUBSCRIBE' or //Operation ='MIDNIGHT_SMS_UNSUB' or //Operation ='SAFE_ARRIVAL_UNSUB' or //Operation ='TEACHER_OFFER_UNSUBSCRIBE' or //Operation ='MEDICAL_OFFER_UNSUBSCRIBE' or //Operation ='FALLAH_IDD_UNSUB' or //Operation ='NAJMA_WAJID_UNSUB' or //Operation ='FALLAH_WAJID_UNSUB' or //Operation ='FALLAH_GPRS_UNSUB' or //Operation ='WHATSAPP_MONTHLY_UNSUBSCRIBE'                                                                  or //Operation ='raqi_rbt_unsubscribe' or //Operation ='OTT_DATA_BUNDLE_unsubscribe' or //Operation ='VOICE_OFFNET_UL_ONNET_UNSUBSCRIBE' or //Operation ='FIN_CALLING_DATA_UNSUBSCRIBE' or //Operation ='VOICE_CALLING_UNSUBSCRIBE' or //Operation ='NATIONAL_CALLING_UNSUBSCRIBE' or //Operation ='SOCIAL_APP_PKG_unsubscribe' or //Operation ='BC_LOCALDATA_R_unsubscribe' or //Operation ='PKG_CUG_MNT_R_unsubscribe' or //Operation ='BC_LOCALDATA_T_unsubscribe' or //Operation ='BC_CROSSNET_SMS_T_unsubscribe' or //Operation ='BC_ONNET_SMS_T_unsubscribe' or //Operation ='BC_CROSSNET_MNT_T_unsubscribe' or //Operation ='BC_ONNET_MNT_T_unsubscribe' or //Operation ='FALLAH1_ADDON_unsubscribe' or //Operation ='NATIONAL_PREPAID_OFFER_UNSUBSCRIBE' or //Operation ='ROAMING_AND_LOCAL_DATA_UNSUBSCRIBE' or //Operation ='ROAMING_DATA_UNSUBSCRIBE' or //Operation ='BC_NATIONAL_SMS_R_unsubscribe' or //Operation ='BC_CROSSNET_SMS_R_unsubscribe' or //Operation ='BC_ONNET_SMS_R_unsubscribe' or //Operation ='BC_NATIONAL_MNT_R_unsubscribe' or //Operation ='BC_CROSSNET_MNT_R_unsubscribe' or //Operation ='BC_ONNET_MNT_R_unsubscribe' or //Operation ='FACEBOOK_MONTHLY_UNSUBSCRIBE' or //Operation ='TWITTER_MONTHLY_UNSUBSCRIBE' or //Operation ='STUDENT_TEJWALI_UNSUB' or //Operation ='BC_INTL_SMS_R_UNSUBSCRIBE' or //Operation ='BC_INTL_SMS_T_UNSUBSCRIBE' or //Operation ='BC_UNLTD_GPRS_R_UNSUBSCRIBE' or //Operation ='BC_GE_DAWLI_T_unsubscribe'">
									<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
											<EndDate>
												<xsl:call-template name="formatDate">
													<xsl:with-param name="str" select="//UnSubscriptionDate" />
												</xsl:call-template>
											</EndDate>
											<ProductContractRelationshipType>2</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt
												</ExtendedObject>
												<XProductContractRelationshipBObjExt>
												<AgreementStatusType>4</AgreementStatusType>
												<xsl:if test="//PackageType and //PackageType!=''">
												<ServiceType>
												<xsl:value-of select="//PackageType" />
												</ServiceType>
												</xsl:if>
												</XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<ProductAdminSysKeyBObj>
											<AdminSystemType>15</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="//SupplementaryService" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
									</ProductContractRelationshipCompositeBObj>
								</xsl:when>
								<xsl:when test="//Operation ='TWININGS_REPLACE' or //Operation ='TWININGS_NATIONAL_REPLACE' or //Operation ='RBT_REPLACE' or //Operation ='IDD_REPLACE' or //Operation ='SAFE_ARRIVAL Repalce' or //Operation ='WHATSAPP_MONTHLY_REPLACE'                                                                                     or //Operation ='raqi_rbt_replace' or //Operation ='VOICE_OFFNET_UL_ONNET_REPLACE' or //Operation ='FIN_CALLING_DATA_REPLACE' or //Operation ='VOICE_CALLING_REPLACE' or //Operation ='NATIONAL_CALLING_REPLACE'">
								<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
											<ProductContractRelationshipType>2</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt>
												<xsl:if test="//PackageType and //PackageType!=''">
													<ServiceType>
														<xsl:value-of select="//PackageType"></xsl:value-of>
													</ServiceType>
												</xsl:if>
												</XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<ProductAdminSysKeyBObj>
											<AdminSystemType>15</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="//SupplementaryService" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
									</ProductContractRelationshipCompositeBObj>
								</xsl:when>
								<xsl:when test="//Operation ='graceperiod'">
								<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
											<xsl:if test="//MDMId and //MDMId!=''">
											<ProductId>
													<xsl:value-of select="//MDMId"></xsl:value-of>
											</ProductId>
											</xsl:if>
											<ProductContractRelationshipType>2</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt>
												<AgreementStatusType>3</AgreementStatusType>
												<xsl:if test="//ServiceCode and //ServiceCode!=''">
													<ServiceType>
														<xsl:value-of select="//ServiceCode"></xsl:value-of>
													</ServiceType>
												</xsl:if>
												</XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<xsl:if test="not(//MDMId) or //MDMId=''">
										<ProductAdminSysKeyBObj>
											<AdminSystemType>15</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="//ServiceParentCode" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
										</xsl:if>
									</ProductContractRelationshipCompositeBObj>
								</xsl:when>
								<xsl:when test="//Operation ='renewal'">
								<ProductContractRelationshipCompositeBObj>
										<TCRMProductContractRelationshipBObj>
											<xsl:if test="//MDMId and //MDMId!=''">
											<ProductId>
													<xsl:value-of select="//MDMId"></xsl:value-of>
											</ProductId>
											</xsl:if>
											<ProductContractRelationshipType>2</ProductContractRelationshipType>
											<TCRMExtension>
												<ExtendedObject>XProductContractRelationshipBObjExt</ExtendedObject>
												<XProductContractRelationshipBObjExt>
												<AgreementStatusType>5</AgreementStatusType>
												<xsl:if test="//ServiceCode and //ServiceCode!=''">
													<ServiceType>
														<xsl:value-of select="//ServiceCode"></xsl:value-of>
													</ServiceType>
												</xsl:if>
												</XProductContractRelationshipBObjExt>
											</TCRMExtension>
										</TCRMProductContractRelationshipBObj>
										<xsl:if test="not(//MDMId) or //MDMId=''">
										<ProductAdminSysKeyBObj>
											<AdminSystemType>15</AdminSystemType>
											<ProductAdminSysKeyPartOne>
												<xsl:value-of select="//ServiceParentCode" />
											</ProductAdminSysKeyPartOne>
										</ProductAdminSysKeyBObj>
										</xsl:if>
									</ProductContractRelationshipCompositeBObj>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//Operation ='MULTI_SIM_SUBSCRIBE' or //Operation ='MULTI_SIM_UNSUBSCRIBE' or //Operation ='MULTI_SIM_UPDATE_SS_GROUP' or //Operation ='MULTI_SIM_SWAP' or //Operation ='MULTI_SIM_GPRS_SET' or //Operation ='MULTI_SIM_GPRS_UNSET' or //Operation ='MULTI_SIM_SUBSCRIBE_ALJ' or //Operation ='MULTI_SIM_SWAP_ALJ'">
								<ContractValueCompositeBObj>				
									<TCRMContractValueBObj>
										<xsl:for-each select="//Params/Param">  
											<xsl:if test="Key = 'SIM_ID'">
												<ContractValueType>4<xsl:value-of select="Value"></xsl:value-of></ContractValueType>
											</xsl:if>
										</xsl:for-each>
											<xsl:if test="//Operation = 'MULTI_SIM_UNSUBSCRIBE'">
											<EndDate>
												<xsl:call-template name="formatDate">
													<xsl:with-param name="str" select="//UnSubscriptionDate" />
												</xsl:call-template>
											</EndDate>
											</xsl:if>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and Key = 'DUMMY_MSISDN' and (//Operation = 'MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE')">
												<Attribute0Type>113</Attribute0Type>
												<Attribute0String>
												<xsl:value-of select="Value"/>
												</Attribute0String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and (Key = 'IMSI' or Key = 'NEW_IMSI') and (//Operation = 'MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE' or //Operation = 'MULTI_SIM_SWAP_ALJ' or //Operation = 'MULTI_SIM_SWAP')">
												<Attribute1Type>106</Attribute1Type>
												<Attribute1String>
												<xsl:value-of select="Value"/>
												</Attribute1String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and (Key = 'SIM' or Key = 'NEW_SIM') and (//Operation = 'MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE' or //Operation = 'MULTI_SIM_SWAP_ALJ' or //Operation = 'MULTI_SIM_SWAP')">
												<Attribute2Type>107</Attribute2Type>
												<Attribute2String>
												<xsl:value-of select="Value"/>
												</Attribute2String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and (Key = 'PUK1' or Key = 'NEW_PUK1') and (//Operation = 'MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE' or //Operation = 'MULTI_SIM_SWAP_ALJ' or //Operation = 'MULTI_SIM_SWAP')">
												<Attribute3Type>108</Attribute3Type>
												<Attribute3String>
												<xsl:value-of select="Value"/>
												</Attribute3String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and (Key = 'PUK2' or Key = 'NEW_PUK2') and (//Operation = 'MULTI_SIM_SUBSCRIBE_ALJ' or //Operation = 'MULTI_SIM_SUBSCRIBE' or //Operation = 'MULTI_SIM_SWAP_ALJ' or //Operation = 'MULTI_SIM_SWAP')">
												<Attribute4Type>109</Attribute4Type>
												<Attribute4String>
												<xsl:value-of select="Value"/>
												</Attribute4String>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="//Operation = 'MULTI_SIM_GPRS_SET'">
											<Attribute5Type>110</Attribute5Type>
											<Attribute5String>Y</Attribute5String>
										</xsl:if>
										<xsl:if test="//Operation = 'MULTI_SIM_GPRS_UNSET'">
											<Attribute5Type>110</Attribute5Type>
											<Attribute5String>N</Attribute5String>
										</xsl:if>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Value and Value!='' and (Key = 'BLACKBERRY') and (//Operation = 'MULTI_SIM_SWAP')">
												<Attribute6Type>111</Attribute6Type>
												<Attribute6String>
												<xsl:value-of select="Value"/>
												</Attribute6String>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//Params/Param">
											<xsl:if test="Key = 'SERVICE_GROUP'">
													<xsl:if test="Value = 'BLACKBERRY'">
														<Attribute6Type>111</Attribute6Type>
														<Attribute6String>Y</Attribute6String>
													</xsl:if>
													<xsl:if test="Value = 'VOICE'">
														<Attribute7Type>112</Attribute7Type>
														<Attribute7String>Y</Attribute7String>
													</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</TCRMContractValueBObj>											
								</ContractValueCompositeBObj>
								</xsl:when>
								</xsl:choose>
								<xsl:choose>
								<xsl:when test="//Operation = 'MULTI_SIM_UPDATE_SS_GROUP'">
									<ContractValueCompositeBObj>				
									<TCRMContractValueBObj>
											<xsl:for-each select="//Params/Param"> 
											<xsl:if test="Key = 'SSGROUPSIMID'">
												<ContractValueType>4<xsl:value-of select="Value"></xsl:value-of></ContractValueType>
											</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//Params/Param"> 
											<xsl:if test="Key = 'SERVICE_GROUP'">
													<xsl:if test="Value = 'BLACKBERRY'">
														<Attribute6Type>111</Attribute6Type>
														<Attribute6String>N</Attribute6String>
													</xsl:if>
													<xsl:if test="Value = 'VOICE'">
														<Attribute7Type>112</Attribute7Type>
														<Attribute7String>N</Attribute7String>
													</xsl:if>
											</xsl:if>
											</xsl:for-each>
									</TCRMContractValueBObj>											
								</ContractValueCompositeBObj>
								</xsl:when>
							</xsl:choose>
							<ContractSearchParamsBObj>
								<MSISDN>
									<xsl:value-of select="//MSISDN" />
								</MSISDN>
							</ContractSearchParamsBObj>
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

</xsl:stylesheet>
