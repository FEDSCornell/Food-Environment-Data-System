--56 to 121 lines
SELECT CONCAT(RIGHT('00'+CAST([STATE_FIPS_CODE] AS VARCHAR),2), RIGHT('000'+CAST([COUNTY_CODE] AS VARCHAR),3)) AS [FIPS]
								  ,[SECTOR_DESC]
								  ,[GROUP_DESC]
								  ,[COMMODITY_DESC]
								  ,[NAICS8_COMMODITY] = CASE WHEN [COMMODITY_DESC] = 'BEANS'				THEN CONCAT([CLASS_DESC],		 ' '    ,	[COMMODITY_DESC]	)
															 WHEN [COMMODITY_DESC] = 'CORN'					THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'COTTON'				THEN CONCAT([COMMODITY_DESC],	 ' ',		[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'DILL'					THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'FOOD CROP TOTALS'		THEN CONCAT([COMMODITY_DESC],	 ' '    ,	[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'GRASSES'				THEN CONCAT([COMMODITY_DESC],	 ' ',		[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'HAY'					THEN CONCAT([COMMODITY_DESC],	 ' ',		[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'HAYLAGE'				THEN CONCAT([COMMODITY_DESC],	 ' ',		[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'HERBS'				THEN CONCAT([COMMODITY_DESC],	 ' '    ,	[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'HORTICULTURE TOTALS'  THEN CONCAT([COMMODITY_DESC],	 ' '    ,	[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'LEGUMES'				THEN CONCAT([COMMODITY_DESC],	 ' ',		[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'MINT'					THEN CONCAT([COMMODITY_DESC],	 ' ',	    [CLASS_DESC]        )
															 WHEN [COMMODITY_DESC] = 'PEAS'					THEN CONCAT([CLASS_DESC],		 ' '    ,	[COMMODITY_DESC]	)
															 WHEN [COMMODITY_DESC] = 'SORGHUM'				THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'SUGARCANE'			THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'SUGARBEETS'			THEN CONCAT([COMMODITY_DESC],  	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'SUNFLOWER'			THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'SWEET CORN'			THEN CONCAT([COMMODITY_DESC],	 ' FOR ',	[UTIL_PRACTICE_DESC])
															 WHEN [COMMODITY_DESC] = 'WHEAT'				THEN CONCAT([COMMODITY_DESC],	 ' '    ,	[CLASS_DESC]		)
															 WHEN [COMMODITY_DESC] = 'PINEAPPLES'			THEN CONCAT([COMMODITY_DESC],	 ' ',	    [STATISTICCAT_DESC] )
															 WHEN [COMMODITY_DESC] = 'AG LAND'				THEN [SHORT_DESC]
															 WHEN [COMMODITY_DESC] = 'JOJOBA'				THEN [SHORT_DESC]													 												
															 ELSE [COMMODITY_DESC]
															 END
								  ,[CLASS_DESC]
								  ,[PRODN_PRACTICE_DESC]
								  ,[UTIL_PRACTICE_DESC]
								  ,[STATISTICCAT_DESC]
								  ,[UNIT_DESC]
								  ,[SHORT_DESC]
								  ,[DOMAIN_DESC]
								  ,[DOMAINCAT_DESC]
								  ,[AGG_LEVEL_DESC]
								  ,[STATE_ALPHA]
								  ,[VALUE]
								  ,[CV_PCT]
								  ,[Value_Numeric]
								  ,[CVPCT_Numeric]
								  ,[YEAR]
								  ,[SOURCE_DESC]
						  
      
							FROM [COA17].[IrrigationData]
				
							WHERE [AGG_LEVEL_DESC] IN ('COUNTY', 'STATE', 'NATIONAL')
							AND [UNIT_DESC] = 'ACRES'
							AND YEAR IN ('2017') 
							 AND NOT [DOMAINCAT_DESC] LIKE '%ECONOMIC CLASS:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%FARM SALES:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%IRRIGATION STATUS:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%NAICS CLASSIFICATION:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%OPERATORS PRINCIPAL%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%OPERATORS:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%ORGANIZATION:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%TENURE:%'
							 AND NOT [DOMAINCAT_DESC] LIKE '%TYPOLOGY:%'
							 AND [PRODN_PRACTICE_DESC] in ('IRRIGATED', 'IN THE OPEN IRRIGATED')