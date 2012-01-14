<h2>Rank Analysis</h2>
<br>
<comp:commandbutton name="updateRanks" caption="Update ranks"/>
<ol>
{foreach from=$pages item=page}
<li><a href="{$page->getUri()}" target="blank">{$page->getUri()}</a> (PR: {$page->getRank()|string_format:"%.4f"}) <a href="javascript:void(0);" onclick="showOrHideLinkDetails('{$page->getUri()}');">...</a>
<div style="display: none;" id="{$page->getUri()}">
{assign var=backlinks value=$page->getBackLinks()}
<strong>Incoming links:</strong>
<ul>
{foreach from=$backlinks item=backlink}
{assign var=refererPage value=$backlink->getPage()}
<li>
From <a href="{$refererPage->getUri()}" target="blank">{$refererPage->getUri()}</a> (PR: {$refererPage->getRank()|string_format:"%.4f"}, anchor: {$backlink->getAnchorText()})
</li>
{/foreach}
</ul>
<strong>Outgoing links:</strong>
<ul>
{assign var=links value=$page->getLinks()}
{foreach from=$links item=link}
{assign var=targetPage value=$link->getLinkedPage()}
{if $targetPage}
<li>
<a href="{$link->getHref()}" target="blank">{$link->getAnchorText()}</a> (PR: {$targetPage->getRank()|string_format:"%.4f"})
</li>
{/if}
{/foreach}
</ul>
</div>
</li>
{/foreach}
</ol>

<comp:javascript>
{literal}

if(typeof(showOrHideLinkDetails) == 'undefined') {
    showOrHideLinkDetails = function(elementId) {
        var element = document.getElementById(elementId);
        if(element.style.display == "none") {
            element.style.display = "";
        }
        else {
            element.style.display = "none";
        }
    };
}

{/literal}
</comp:javascript>