<table cellpadding="10" cellspacing="0" border="0" width="100%">
<tr><td>
<h1>Site Analyzer</h1>
(Sitemap last update: 
<comp:label name="lastUpdate"><comp-property name="text">{if $last_update}{$last_update}{else}<font color="red">never</font>{/if}</comp-property></comp:label>&nbsp;
<comp:commandbutton name="updateSitemap" caption="Crawl now!"/>
<font color="blue"><comp:label name="updateStatus" text=""/></font>)
<br><br>
<comp:commandlink name="showGeneralInfo" caption="General"/>&nbsp;|&nbsp;
<comp:commandlink name="showRoutesInfo" caption="Routes"/>&nbsp;|&nbsp;
<comp:commandlink name="showRankInfo" caption="Rank"/>

<comp:actionbox autoRefresh="true" name="analyzerSection" route="lion" controller="siteAnalyzerResults" action="generalAnalysis"/>

</td></tr>
</table>