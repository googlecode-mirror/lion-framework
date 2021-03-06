<DOCFLEX_TEMPLATE VER='1.9'>
CREATED='2005-10-17 11:23:00'
LAST_UPDATE='2007-06-30 06:10:50'
DESIGNER_TOOL='DocFlex SDK 1.x'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xmldoc'
ROOT_ET='<ANY>'
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs2';
}
<STYLES>
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs1';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs2';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s1';
		style.default='true';
	}
</STYLES>
<ROOT>
	<AREA_SEC>
		FMT={
			text.font.name='Verdana';
			text.font.size='7';
			text.color.foreground='#808080';
			txtfl.delimiter.type='none';
		}
		<AREA>
			<CTRL_GROUP>
				FMT={
					par.border.top.style='solid';
					par.border.top.color='#808080';
					par.margin.top='24';
					par.margin.bottom='6';
					par.padding.top='2';
				}
				<CTRLS>
					<LABEL>
						TEXT='XML File documentation generated with '
					</LABEL>
					<DATA_CTRL>
						<URL_HLINK>
							COND='output.generator.name == "DocFlex/XSD"'
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xsd/"'
						</URL_HLINK>
						<URL_HLINK>
							COND='output.generator.name == "DocFlex/XML"'
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xml/"'
						</URL_HLINK>
						<URL_HLINK>
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xml/#freeware_edition"'
						</URL_HLINK>
						FORMULA='output.generator.name'
					</DATA_CTRL>
					<LABEL>
						TEXT=' v'
					</LABEL>
					<DATA_CTRL>
						FORMULA='output.generator.version'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						<URL_HLINK>
							COND='output.generator.name == "DocFlex/XSD"'
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xsd/"'
						</URL_HLINK>
						<URL_HLINK>
							COND='output.generator.name == "DocFlex/XML"'
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xml/"'
						</URL_HLINK>
						<URL_HLINK>
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com/products/docflex_xml/#freeware_edition"'
						</URL_HLINK>
						FORMULA='output.generator.name'
					</DATA_CTRL>
					<PANEL>
						COND='output.generator.name != "DocFlex/XML"'
						FMT={
							ctrl.size.width='214.5';
						}
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										TEXT=' is a '
									</LABEL>
									<LABEL>
										COND='output.generator.name == "DocFlex/XSD"'
										TEXT='reduced'
									</LABEL>
									<LABEL>
										COND='output.generator.name != "DocFlex/XSD"'
										TEXT='freeware'
									</LABEL>
									<LABEL>
										TEXT=' edition of '
									</LABEL>
									<LABEL>
										<URL_HLINK>
											TARGET_FRAME_EXPR='"_blank"'
											TARGET_FRAME_ALWAYS
											URL_EXPR='"http://www.filigris.com/products/docflex_xml/"'
										</URL_HLINK>
										TEXT='DocFlex/XML'
									</LABEL>
									<LABEL>
										TEXT=', which'
									</LABEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</PANEL>
					<LABEL>
						TEXT=' is a powerful template-driven documentation and report generator from any data stored in XML files. '
					</LABEL>
					<LABEL>
						TEXT='Based on an innovative technology developed by '
					</LABEL>
					<LABEL>
						<URL_HLINK>
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com"'
						</URL_HLINK>
						TEXT='FILIGRIS WORKS'
					</LABEL>
					<LABEL>
						TEXT=', this new tool offers capabilities not found in anything else! '
					</LABEL>
					<LABEL>
						TEXT='Find out more at '
					</LABEL>
					<LABEL>
						<URL_HLINK>
							TARGET_FRAME_EXPR='"_blank"'
							TARGET_FRAME_ALWAYS
							URL_EXPR='"http://www.filigris.com"'
						</URL_HLINK>
						TEXT='www.filigris.com'
					</LABEL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
</ROOT>
CHECKSUM='FXlsW?U+INR5Z6Xnm27w8w'
</DOCFLEX_TEMPLATE>