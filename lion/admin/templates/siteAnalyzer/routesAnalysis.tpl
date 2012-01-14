<h2>Routes Analysis</h2>
<br>

{foreach key=route from=$routes item=pages}
<h3>{$route}</h3>
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
    From <a href="{$refererPage->getUri()}" target="blank">{$refererPage->getUri()}</a> (PR: {$refererPage->getRank()|string_format:"%.4f"})
    </li>
    {/foreach}
    </ul>
    <strong>Outgoing links:</strong>
    <ul>
    {assign var=links value=$page->getLinks()}
    {foreach from=$links item=link}
    <li>
    <a href="{$link->getHref()}" target="blank">{$link->getAnchorText()}</a>
    </li>
    {/foreach}
    </ul>
    </div>
    </li>
    {/foreach}
</ol>
{/foreach}

<h3>External pages linked from your site</h3>
<ol>
    {foreach from=$external_links item=link}
    <li><a href="{$link->getHref()}" target="blank">{$link->getHref()}</a>  <a href="javascript:void(0);" onclick="showOrHideLinkDetails('{$link->getHref()}');">...</a>
    <div style="display: none;" id="{$link->getHref()}">
    {assign var=page value=$link->getPage()}
    <strong>From page:</strong> <a href="{$page->getUri()}" target="blank">{$page->getUri()}</a>
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