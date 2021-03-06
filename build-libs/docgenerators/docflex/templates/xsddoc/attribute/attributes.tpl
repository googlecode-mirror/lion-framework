<DOCFLEX_TEMPLATE VER='1.9'>
CREATED='2005-04-26 03:31:00'
LAST_UPDATE='2007-06-30 06:10:50'
DESIGNER_TOOL='DocFlex SDK 1.x'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xsddoc'
ROOT_ETS={'xs:%element';'xs:attributeGroup';'xs:complexType'}
<TEMPLATE_PARAMS>
	PARAM={
		param.name='contentMapKey';
		param.displayName='"content-attributes", "content-elements" map key';
		param.description='The key for "content-attributes" and "content-elements" maps to find items associated with this component';
		param.type='object';
		param.defaultExpr='contextElement.id';
		param.hidden='true';
	}
	PARAM={
		param.name='attributeCount';
		param.displayName='number of all attributes';
		param.description='total number of attributes declared for this component';
		param.type='int';
		param.defaultExpr='countElementsByKey (\n  "content-attributes", \n  getParam("contentMapKey"),\n  BooleanQuery (! instanceOf ("xs:anyAttribute"))\n)';
		param.hidden='true';
	}
	PARAM={
		param.name='ownAttributeCount';
		param.displayName='number of component\'s own attributes';
		param.description='number of attributes defined within this component';
		param.type='int';
		param.defaultExpr='countElementsByKey (\n  "content-attributes", \n  getParam("contentMapKey"),\n  BooleanQuery (\n    ! instanceOf ("xs:anyAttribute") &&\n    findPredecessorByType("xs:%element;xs:complexType;xs:attributeGroup").id \n    == rootElement.id\n  )\n)';
		param.hidden='true';
	}
	PARAM={
		param.name='page.refs';
		param.displayName='Generate page references';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='sec.attributes.ownOnly';
		param.displayName='Component\'s Only';
		param.type='boolean';
	}
	PARAM={
		param.name='sec.attributes.xmlSource';
		param.displayName='XML Source';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='sec.xmlSource.box.attributes';
		param.displayName='Enclose in box';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='sec.xmlSource.remove.ann.attributes';
		param.displayName='Remove <xs:annotation> elements';
		param.type='boolean';
		param.boolean.default='true';
	}
</TEMPLATE_PARAMS>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs6';
}
<STYLES>
	CHAR_STYLE={
		style.name='Annotation';
		style.id='cs1';
		text.font.name='Arial';
		text.font.size='9.5';
	}
	CHAR_STYLE={
		style.name='Code';
		style.id='cs2';
		text.font.name='Courier New';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Code Smaller';
		style.id='cs3';
		text.font.name='Courier New';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='Code Smallest';
		style.id='cs4';
		text.font.name='Courier New';
		text.font.size='7.5';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs5';
		style.default='true';
	}
	PAR_STYLE={
		style.name='Detail Heading 1';
		style.id='s1';
		text.font.style.bold='true';
		par.bkgr.opaque='true';
		par.bkgr.color='#CCCCFF';
		par.border.style='solid';
		par.border.color='#666666';
		par.margin.top='14';
		par.margin.bottom='10';
		par.padding.left='2';
		par.padding.right='2';
		par.padding.top='2';
		par.padding.bottom='2';
		par.page.keepWithNext='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs6';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s2';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Normal Smaller';
		style.id='cs7';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Normal Smallest';
		style.id='cs8';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='Note Font';
		style.id='cs9';
		text.font.name='Arial';
		text.font.size='8';
		text.font.style.bold='false';
		par.lineHeight='11';
		par.margin.right='7';
	}
	CHAR_STYLE={
		style.name='Page Number Small';
		style.id='cs10';
		text.font.name='Courier New';
		text.font.size='8';
	}
	PAR_STYLE={
		style.name='Properties Heading';
		style.id='s3';
		text.font.name='Arial';
		text.font.size='8';
		text.font.style.bold='true';
		text.font.style.italic='true';
		text.color.background='#CCCCFF';
		text.color.opaque='true';
		par.margin.top='6';
		par.margin.bottom='6';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Property Title';
		style.id='s4';
		text.font.size='8';
		text.font.style.bold='true';
		par.lineHeight='11';
		par.margin.right='7';
	}
	PAR_STYLE={
		style.name='Property Value';
		style.id='s5';
		text.font.name='Verdana';
		text.font.size='8';
		par.lineHeight='11';
	}
</STYLES>
<ROOT>
	<ELEMENT_ITER>
		FMT={
			table.sizing='Relative';
		}
		<HTARGET>
			COND='! getBooleanParam("sec.attributes.ownOnly") ||\ngetIntParam("attributeCount") == getIntParam("ownAttributeCount")'
			HKEYS={
				'contextElement.id';
				'"attribute-detail"';
			}
		</HTARGET>
		<HTARGET>
			HKEYS={
				'contextElement.id';
				'"attribute-defs"';
			}
		</HTARGET>
		TARGET_ET='xs:%attribute'
		SCOPE='custom'
		ELEMENT_ENUM_EXPR='filter = getBooleanParam("sec.attributes.ownOnly") ?\n  BooleanQuery (\n    findPredecessorByType("xs:%element;xs:complexType;xs:attributeGroup").id \n    == rootElement.id\n  ) : null;\n\nfindElementsByKey ("content-attributes", getParam("contentMapKey"), filter)'
		SORTING='by-expr'
		SORTING_KEY={expr='hasAttr("name") ? callStockSection("Attribute QName") : getAttrStringValue("ref")',ascending,case_sensitive}
		STEP_EXPR='// schema component where the attribute was defined\n\nsetVar (\n  "definitionLocation",\n  findPredecessorByType("xs:%element;xs:complexType;xs:attributeGroup")\n)'
		<BODY>
			<FOLDER>
				DESCR='when the attribute is defined locally'
				COND='getAttrValue("name") != ""'
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"local"';
						'rootElement.id';
					}
				</HTARGET>
				<HTARGET>
					COND='getElementVar ("definitionLocation").id == rootElement.id'
					HKEYS={
						'contextElement.id';
						'"def"';
					}
				</HTARGET>
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
									text.style='cs2';
									par.margin.bottom='6';
									par.page.keepWithNext='true';
								}
								<CTRLS>
									<IMAGE_CTRL>
										IMAGE_TYPE='file-image'
										FILE='../images/attribute.gif'
									</IMAGE_CTRL>
									<DELIMITER>
										FMT={
											text.font.size='7';
										}
									</DELIMITER>
									<SS_CALL_CTRL>
										SS_NAME='Attribute QName'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<SS_CALL>
						FMT={
							sec.indent.block='true';
						}
						SS_NAME='Attribute (local)'
						PARAMS_EXPR='Array (getVar ("definitionLocation"))'
					</SS_CALL>
				</BODY>
			</FOLDER>
			<FOLDER>
				DESCR='when this is a reference to a global attribute'
				COND='getAttrValue("ref") != ""'
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"local"';
						'rootElement.id';
					}
				</HTARGET>
				<HTARGET>
					COND='getElementVar ("definitionLocation").id == rootElement.id'
					HKEYS={
						'contextElement.id';
						'"def"';
					}
				</HTARGET>
				<BODY>
					<AREA_SEC>
						DESCR='when the reference is resolved into a documented global attribute'
						CONTEXT_ELEMENT_EXPR='findElementByKey ("global-attributes", getAttrQNameValue("ref"))'
						MATCHING_ET='xs:%attribute'
						<AREA>
							<CTRL_GROUP>
								FMT={
									text.style='cs2';
									par.margin.bottom='6';
									par.page.keepWithNext='true';
								}
								<CTRLS>
									<IMAGE_CTRL>
										IMAGE_TYPE='file-image'
										FILE='../images/attribute.gif'
									</IMAGE_CTRL>
									<DELIMITER>
										FMT={
											text.style='cs2';
											text.font.size='7';
										}
									</DELIMITER>
									<SS_CALL_CTRL>
										SS_NAME='QName'
									</SS_CALL_CTRL>
									<PANEL>
										COND='output.format.supportsPagination &&\ngetBooleanParam("page.refs") &&\nhyperTargetExists (Array (contextElement.id,  "detail"))'
										FMT={
											ctrl.size.width='168';
											text.style='cs10';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<DATA_CTRL>
														FMT={
															ctrl.option.noHLinkFmt='true';
															text.hlink.fmt='none';
														}
														<DOC_HLINK>
															HKEYS={
																'contextElement.id';
																'"detail"';
															}
														</DOC_HLINK>
														DOCFIELD='page-htarget'
													</DATA_CTRL>
													<LABEL>
														TEXT=']'
													</LABEL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						DESCR='otherwise, the referenced global attribute is not within documentation scope'
						COND='sectionBlock.execSecNone'
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
									text.style='cs2';
									par.margin.bottom='6';
									par.page.keepWithNext='true';
								}
								<CTRLS>
									<IMAGE_CTRL>
										IMAGE_TYPE='file-image'
										FILE='../images/attribute.gif'
									</IMAGE_CTRL>
									<DELIMITER>
										FMT={
											text.font.size='7';
										}
									</DELIMITER>
									<DATA_CTRL>
										FMT={
											par.margin.left='1';
											par.margin.right='1';
										}
										ATTR='ref'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<SS_CALL>
						FMT={
							sec.indent.block='true';
						}
						SS_NAME='Attribute (reference)'
						PARAMS_EXPR='Array (getVar ("definitionLocation"))'
					</SS_CALL>
				</BODY>
			</FOLDER>
			<AREA_SEC>
				COND='! iterator.isLastItem'
				<AREA>
					<HR>
						FMT={
							rule.style='dashed';
							rule.color='#B2B2B2';
							par.margin.top='12';
							par.margin.bottom='8';
						}
					</HR>
				</AREA>
			</AREA_SEC>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s1';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							trow.bkgr.color='#CCCCFF';
						}
						<CTRLS>
							<LABEL>
								TEXT='Attribute Detail'
							</LABEL>
							<PANEL>
								COND='getBooleanParam("sec.attributes.ownOnly") &&\ngetIntParam("ownAttributeCount") != getIntParam("attributeCount")'
								FMT={
									ctrl.size.width='134.3';
									ctrl.size.height='38.3';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DELIMITER>
												FMT={
													text.style='cs2';
												}
											</DELIMITER>
											<LABEL>
												FMT={
													text.style='cs9';
													text.font.style.bold='false';
												}
												TEXT='(defined in this component only)'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</ELEMENT_ITER>
</ROOT>
<STOCK_SECTIONS>
	<FOLDER>
		DESCR='parameter is the schema component where this attribute is defined'
		MATCHING_ET='xs:%attribute'
		SS_NAME='Attribute (local)'
		<BODY>
			<TEMPLATE_CALL>
				FMT={
					sec.spacing.after='6';
					text.style='cs1';
				}
				TEMPLATE_FILE='../ann/annotation.tpl'
			</TEMPLATE_CALL>
			<FOLDER>
				FMT={
					sec.outputStyle='table';
					table.cellpadding.both='0';
					table.border.style='none';
					table.option.borderStylesInHTML='true';
				}
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='43.5';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Type:'
									</LABEL>
									<SS_CALL_CTRL>
										FMT={
											ctrl.size.width='456';
											ctrl.size.height='17.3';
											par.style='s5';
										}
										SS_NAME='Type Info'
										PARAMS_EXPR='Array (stockSection.param.toElement().id != rootElement.id)'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='hasAttr("use")'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Use:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											par.style='s5';
										}
										ATTR='use'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='hasAttr("default")'
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Default:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											text.style='cs3';
											par.style='s5';
										}
										FORMULA='\'"\' + getAttrStringValue("default") +\'"\''
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='hasAttr("fixed")'
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Fixed:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											text.style='cs3';
											par.style='s5';
										}
										<DOC_HLINK>
											HKEYS={
												'findElementByKey ("types", getAttrQNameValue("type")).id';
												'"detail"';
											}
										</DOC_HLINK>
										FORMULA='\'"\' + getAttrStringValue("fixed") +\'"\''
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						FMT={
							table.sizing='Relative';
							table.autofit='false';
							table.cellpadding.both='5';
							table.bkgr.color='#F5F5F5';
							table.border.style='solid';
							table.border.color='#999999';
							table.option.borderStylesInHTML='true';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='44.3';
											ctrl.size.height='80.3';
											par.style='s4';
										}
										TEXT='Defined:'
									</LABEL>
									<PANEL>
										FMT={
											ctrl.size.width='455.3';
											ctrl.size.height='80.3';
											par.style='s5';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<LABEL>
														<DOC_HLINK>
															COND='stockSection.param.toElement().id != rootElement.id'
															HKEYS={
																'contextElement.id';
																'"def"';
															}
														</DOC_HLINK>
														TEXT='locally'
													</LABEL>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='none';
														}
													</DELIMITER>
													<LABEL>
														TEXT=', within'
													</LABEL>
													<PANEL>
														CONTEXT_ELEMENT_EXPR='stockSection.param.toElement()'
														MATCHING_ETS={'xs:%element';'xs:attributeGroup';'xs:complexType'}
														FMT={
															ctrl.size.width='336.8';
															ctrl.size.height='59.3';
														}
														<AREA>
															<CTRL_GROUP>
																<CTRLS>
																	<PANEL>
																		COND='rootElement.id == contextElement.id'
																		FMT={
																			ctrl.size.width='66.8';
																			txtfl.delimiter.type='none';
																		}
																		<AREA>
																			<CTRL_GROUP>
																				<CTRLS>
																					<LABEL>
																						TEXT='('
																					</LABEL>
																					<LABEL>
																						<DOC_HLINK>
																							HKEYS={
																								'contextElement.id';
																								'"detail"';
																							}
																						</DOC_HLINK>
																						TEXT='this'
																					</LABEL>
																					<LABEL>
																						TEXT=')'
																					</LABEL>
																				</CTRLS>
																			</CTRL_GROUP>
																		</AREA>
																	</PANEL>
																	<SS_CALL_CTRL>
																		FMT={
																			text.style='cs3';
																		}
																		SS_NAME='QName'
																	</SS_CALL_CTRL>
																	<LABEL>
																		MATCHING_ET='xs:%element'
																		TEXT='element'
																	</LABEL>
																	<LABEL>
																		MATCHING_ET='xs:complexType'
																		TEXT='complexType'
																	</LABEL>
																	<LABEL>
																		MATCHING_ET='xs:attributeGroup'
																		TEXT='attributeGroup'
																	</LABEL>
																</CTRLS>
															</CTRL_GROUP>
														</AREA>
													</PANEL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<FOLDER>
				DESCR='only in the case when the attribute is defined within this element / attributeGroup / complexType'
				COND='stockSection.param.toElement().id == rootElement.id'
				<BODY>
					<SS_CALL>
						COND='getBooleanParam("sec.attributes.xmlSource")'
						SS_NAME='XML Source'
					</SS_CALL>
					<FOLDER>
						DESCR='embedded type definition'
						CONTEXT_ELEMENT_EXPR='findChild("xs:simpleType")'
						MATCHING_ET='xs:%localSimpleType'
						<HTARGET>
							HKEYS={
								'contextElement.id';
								'"detail"';
							}
						</HTARGET>
						<BODY>
							<TEMPLATE_CALL>
								FMT={
									sec.spacing.before='6';
									sec.spacing.after='6';
									text.style='cs1';
								}
								TEMPLATE_FILE='../ann/annotation.tpl'
							</TEMPLATE_CALL>
							<TEMPLATE_CALL>
								TEMPLATE_FILE='../content/simpleContentDef.tpl'
							</TEMPLATE_CALL>
						</BODY>
						<HEADER>
							<AREA_SEC>
								FMT={
									par.style='s3';
								}
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<LABEL>
												TEXT='Embedded Type'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</HEADER>
					</FOLDER>
				</BODY>
			</FOLDER>
		</BODY>
	</FOLDER>
	<FOLDER>
		DESCR='parameter is the schema component where this attribute is defined'
		MATCHING_ET='xs:%attribute'
		SS_NAME='Attribute (reference)'
		<BODY>
			<TEMPLATE_CALL>
				DESCR='local annotation'
				FMT={
					sec.spacing.after='6';
					text.style='cs1';
				}
				TEMPLATE_FILE='../ann/annotation.tpl'
			</TEMPLATE_CALL>
			<FOLDER>
				DESCR='set context element to the referenced global attribute'
				CONTEXT_ELEMENT_EXPR='findElementByKey ("global-attributes", getAttrQNameValue("ref"))'
				MATCHING_ET='xs:attribute'
				FMT={
					sec.outputStyle='table';
					table.cellpadding.both='0';
					table.border.style='none';
				}
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='43.5';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Type:'
									</LABEL>
									<SS_CALL_CTRL>
										FMT={
											ctrl.size.width='456';
											ctrl.size.height='17.3';
											par.style='s5';
										}
										SS_NAME='Type Info'
										PARAMS_EXPR='Array (false)'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='stockSection.contextElement.hasAttr("use")'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Use:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											par.style='s5';
										}
										FORMULA='stockSection.contextElement.getAttrValue("use")'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='stockSection.contextElement.hasAttr("default") || hasAttr("default")'
						CONTEXT_ELEMENT_EXPR='stockSection.contextElement.hasAttr("default") ?\n  stockSection.contextElement : contextElement'
						MATCHING_ET='xs:%attribute'
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Default:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											text.style='cs3';
											par.style='s5';
										}
										FORMULA='\'"\' + getAttrStringValue("default") +\'"\''
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='stockSection.contextElement.hasAttr("fixed") || hasAttr("fixed")'
						CONTEXT_ELEMENT_EXPR='stockSection.contextElement.hasAttr("fixed") ?\n  stockSection.contextElement : contextElement'
						MATCHING_ET='xs:%attribute'
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='45';
											ctrl.size.height='17.3';
											par.style='s4';
										}
										TEXT='Fixed:'
									</LABEL>
									<DATA_CTRL>
										FMT={
											ctrl.size.width='454.5';
											ctrl.size.height='17.3';
											text.style='cs3';
											par.style='s5';
										}
										FORMULA='\'"\' + getAttrStringValue("fixed") +\'"\''
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						FMT={
							table.sizing='Relative';
							table.autofit='false';
							table.cellpadding.both='5';
							table.bkgr.color='#F5F5F5';
							table.border.style='solid';
							table.border.color='#999999';
							table.option.borderStylesInHTML='true';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.align.vert='Top';
								}
								<CTRLS>
									<LABEL>
										FMT={
											ctrl.size.width='44.3';
											ctrl.size.height='80.3';
											par.style='s4';
										}
										TEXT='Defined:'
									</LABEL>
									<PANEL>
										FMT={
											ctrl.size.width='455.3';
											ctrl.size.height='80.3';
											par.style='s5';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<LABEL>
														<DOC_HLINK>
															COND='stockSection.param.toElement().id != rootElement.id'
															HKEYS={
																'stockSection.contextElement.id';
																'"def"';
															}
														</DOC_HLINK>
														TEXT='by reference'
													</LABEL>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='none';
														}
													</DELIMITER>
													<LABEL>
														TEXT=', within'
													</LABEL>
													<PANEL>
														CONTEXT_ELEMENT_EXPR='stockSection.param.toElement()'
														MATCHING_ETS={'xs:%element';'xs:attributeGroup';'xs:complexType'}
														FMT={
															ctrl.size.width='318.8';
														}
														<AREA>
															<CTRL_GROUP>
																<CTRLS>
																	<PANEL>
																		COND='rootElement.id == contextElement.id'
																		FMT={
																			ctrl.size.width='66.8';
																			txtfl.delimiter.type='none';
																		}
																		<AREA>
																			<CTRL_GROUP>
																				<CTRLS>
																					<LABEL>
																						TEXT='('
																					</LABEL>
																					<LABEL>
																						<DOC_HLINK>
																							HKEYS={
																								'contextElement.id';
																								'"detail"';
																							}
																						</DOC_HLINK>
																						TEXT='this'
																					</LABEL>
																					<LABEL>
																						TEXT=')'
																					</LABEL>
																				</CTRLS>
																			</CTRL_GROUP>
																		</AREA>
																	</PANEL>
																	<SS_CALL_CTRL>
																		FMT={
																			ctrl.size.width='91.5';
																			ctrl.size.height='17.3';
																			text.style='cs3';
																		}
																		SS_NAME='QName'
																	</SS_CALL_CTRL>
																	<LABEL>
																		MATCHING_ET='xs:%element'
																		TEXT='element'
																	</LABEL>
																	<LABEL>
																		MATCHING_ET='xs:complexType'
																		TEXT='complexType'
																	</LABEL>
																	<LABEL>
																		MATCHING_ET='xs:attributeGroup'
																		TEXT='attributeGroup'
																	</LABEL>
																</CTRLS>
															</CTRL_GROUP>
														</AREA>
													</PANEL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<SS_CALL>
				COND='getBooleanParam("sec.attributes.xmlSource")\n&& \nstockSection.param.toElement().id == rootElement.id'
				SS_NAME='XML Source'
			</SS_CALL>
		</BODY>
	</FOLDER>
	<AREA_SEC>
		FMT={
			par.option.nowrap='true';
		}
		SS_NAME='Attribute QName'
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						FORMULA='schema = getXMLDocument().findChild ("xs:schema");\n\n((form = getAttrStringValue("form")) == "") ? {\n  form = schema.getAttrStringValue ("attributeFormDefault");\n};\n\nname = getAttrStringValue("name");\n\n(form != "qualified") ? name :\n   QName (schema.getAttrStringValue("targetNamespace"), name)'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<AREA_SEC>
		FMT={
			par.option.nowrap='true';
		}
		SS_NAME='QName'
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						<DOC_HLINK>
							HKEYS={
								'contextElement.id';
								'"detail"';
							}
						</DOC_HLINK>
						FORMULA='name = getAttrStringValue("name");\n\nschema = getXMLDocument().findChild ("xs:schema");\nnsURI = schema.getAttrStringValue("targetNamespace");\n\ninstanceOf ("xs:%localElement") ? \n{\n  ((form = getAttrStringValue("form")) == "") ? {\n    form = schema.getAttrStringValue ("elementFormDefault");\n  };\n\n  (form != "qualified") ? name : QName (nsURI, name)\n} \n: QName (nsURI, name, Enum (rootElement, contextElement))'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<FOLDER>
		DESCR='param indicates if the embedded type derivation summary should be printed'
		MATCHING_ET='xs:%attribute'
		SS_NAME='Type Info'
		<BODY>
			<AREA_SEC>
				COND='getAttrStringValue("type") == ""'
				CONTEXT_ELEMENT_EXPR='findChild("xs:simpleType")'
				MATCHING_ET='xs:%simpleType'
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								<DOC_HLINK>
									HKEYS={
										'contextElement.id';
										'"detail"';
									}
								</DOC_HLINK>
								TEXT='embedded'
							</LABEL>
							<TEMPLATE_CALL_CTRL>
								COND='stockSection.param.toBoolean()'
								TEMPLATE_FILE='../type/derivationSummary.tpl'
							</TEMPLATE_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<FOLDER>
				DESCR='when there\'s a reference to a global type'
				COND='getAttrStringValue("type") != ""'
				<BODY>
					<AREA_SEC>
						DESCR='when the reference is resolved into a documented element'
						CONTEXT_ELEMENT_EXPR='findElementByKey ("types", getAttrQNameValue("type"))'
						MATCHING_ETS={'xs:complexType';'xs:simpleType'}
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<SS_CALL_CTRL>
										COND='rootElement.id != contextElement.id'
										FMT={
											text.style='cs3';
										}
										SS_NAME='QName'
									</SS_CALL_CTRL>
									<PANEL>
										COND='output.format.supportsPagination &&\ngetBooleanParam("page.refs") &&\nhyperTargetExists (Array (contextElement.id,  "detail"))'
										FMT={
											ctrl.size.width='154.5';
											text.style='cs10';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<LABEL>
														TEXT='['
													</LABEL>
													<DATA_CTRL>
														FMT={
															ctrl.option.noHLinkFmt='true';
															text.hlink.fmt='none';
														}
														<DOC_HLINK>
															HKEYS={
																'contextElement.id';
																'"detail"';
															}
														</DOC_HLINK>
														DOCFIELD='page-htarget'
													</DATA_CTRL>
													<LABEL>
														TEXT=']'
													</LABEL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						DESCR='otherwise, the referenced global type is not within documentation scope'
						COND='sectionBlock.execSecNone'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										FMT={
											text.style='cs3';
										}
										ATTR='type'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<AREA_SEC>
				DESCR='if no type information at all assume \'anySimpleType\''
				COND='sectionBlock.execSecNone'
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								FMT={
									text.style='cs3';
								}
								TEXT='anySimpleType'
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</BODY>
	</FOLDER>
	<FOLDER>
		SS_NAME='XML Source'
		<BODY>
			<AREA_SEC>
				COND='getBooleanParam("sec.xmlSource.box.attributes")'
				FMT={
					sec.outputStyle='table';
					sec.spacing.before='8';
					sec.spacing.after='10';
					table.autofit='false';
					table.cellpadding.both='5';
					table.bkgr.color='#F5F5F5';
					table.border.style='solid';
					table.border.color='#999999';
					table.option.borderStylesInHTML='true';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<TEMPLATE_CALL_CTRL>
								FMT={
									ctrl.size.width='499.5';
									ctrl.size.height='17.3';
								}
								TEMPLATE_FILE='../xml/nodeSource.tpl'
								PASSED_PARAMS={
									'remove.annotations','getBooleanParam("sec.xmlSource.remove.ann.attributes")';
								}
							</TEMPLATE_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				COND='! getBooleanParam("sec.xmlSource.box.attributes")'
				FMT={
					sec.spacing.before='6';
					sec.spacing.after='10';
				}
				TEMPLATE_FILE='../xml/nodeSource.tpl'
				PASSED_PARAMS={
					'remove.annotations','getBooleanParam("sec.xmlSource.remove.ann.attributes")';
				}
			</TEMPLATE_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s3';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='none';
						}
						<CTRLS>
							<LABEL>
								TEXT='XML Source'
							</LABEL>
							<DELIMITER>
								FMT={
									text.style='cs3';
									text.color.opaque='false';
								}
							</DELIMITER>
							<TEMPLATE_CALL_CTRL>
								FMT={
									text.style='cs9';
									text.color.opaque='false';
								}
								TEMPLATE_FILE='../xml/sourceNote.tpl'
								PASSED_PARAMS={
									'remove.annotations','getBooleanParam("sec.xmlSource.remove.ann.attributes")';
								}
							</TEMPLATE_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
</STOCK_SECTIONS>
CHECKSUM='bZW4gsOTVtqR2x0Sayedfw'
</DOCFLEX_TEMPLATE>