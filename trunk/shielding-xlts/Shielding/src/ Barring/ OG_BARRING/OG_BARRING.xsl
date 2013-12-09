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
										<BarringStatusType>3</BarringStatusType>
										<xsl:choose>
											<xsl:when test="//ReasonId = '0' ">
												<BarringReasonType>1</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '1' ">
												<BarringReasonType>2</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '2' ">
												<BarringReasonType>3</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '3' ">
												<BarringReasonType>4</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '4' ">
												<BarringReasonType>5</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '5' ">
												<BarringReasonType>6</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '6' ">
												<BarringReasonType>7</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '7' ">
												<BarringReasonType>8</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '8' ">
												<BarringReasonType>9</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '9' ">
												<BarringReasonType>10</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '11' ">
												<BarringReasonType>11</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '12' ">
												<BarringReasonType>12</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '13' ">
												<BarringReasonType>13</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '14' ">
												<BarringReasonType>14</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '53' ">
												<BarringReasonType>15</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '55' ">
												<BarringReasonType>16</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '121' ">
												<BarringReasonType>17</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '20' ">
												<BarringReasonType>18</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '54' ">
												<BarringReasonType>19</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '57' ">
												<BarringReasonType>20</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '22' ">
												<BarringReasonType>21</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '15' ">
												<BarringReasonType>22</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '17' ">
												<BarringReasonType>23</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '18' ">
												<BarringReasonType>24</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '51' ">
												<BarringReasonType>25</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '52' ">
												<BarringReasonType>26</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '56' ">
												<BarringReasonType>27</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '61' ">
												<BarringReasonType>28</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '62' ">
												<BarringReasonType>29</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '63' ">
												<BarringReasonType>30</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '111' ">
												<BarringReasonType>31</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '10' ">
												<BarringReasonType>32</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '19' ">
												<BarringReasonType>33</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '100' ">
												<BarringReasonType>34</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '110' ">
												<BarringReasonType>35</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '98' ">
												<BarringReasonType>36</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '99' ">
												<BarringReasonType>37</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '60' ">
												<BarringReasonType>38</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '50' ">
												<BarringReasonType>39</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '16' ">
												<BarringReasonType>40</BarringReasonType>
											</xsl:when>
											<xsl:when test="//ReasonId = '120' ">
												<BarringReasonType>41</BarringReasonType>
											</xsl:when>

											<xsl:otherwise>
												<BarringReasonType>0</BarringReasonType>
											</xsl:otherwise>
										</xsl:choose>

										<BarringStatusChangeDate>
											<xsl:call-template name="formatDate">
												<xsl:with-param name="str" select="//SR_HEADER/SrDate"/>
											</xsl:call-template>
										</BarringStatusChangeDate>
									</XContractBObjExt>
								</TCRMExtension>

							</TCRMContractBObj>

							<ContractSearchParamsBObj>
								<MSISDN>
									<xsl:value-of select="//LineNumber"/>
								</MSISDN>
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
</xsl:stylesheet>
