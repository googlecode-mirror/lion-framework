<a name='method_detail'></a>
{section name=methods loop=$methods}
<a name="method{$methods[methods].function_name}" id="{$methods[methods].function_name}"><!-- --></a>

<div class="method-header">
    <h3 class="method-title">{if $methods[methods].ifunction_call.constructor}Constructor {elseif $methods[methods].ifunction_call.destructor}Destructor {/if}{$methods[methods].function_name}</h3>
</div>
<br />

    <div class="function">
    <!--  <strong>Prototype:</strong> -->
    <table width="90%" border="0" cellspacing="0" cellpadding="1"><tr><td class="code_border">
    <table width="100%" border="0" cellspacing="0" cellpadding="2"><tr><td class="code">&nbsp;
        <code>{$methods[methods].function_return} {if $methods[methods].ifunction_call.returnsref}&amp;{/if}{$methods[methods].function_name}(
{if count($methods[methods].ifunction_call.params)}
{section name=params loop=$methods[methods].ifunction_call.params}
{if $smarty.section.params.iteration != 1}, {/if}
{if $methods[methods].ifunction_call.params[params].default != ''}[{/if}{$methods[methods].ifunction_call.params[params].type}
{$methods[methods].ifunction_call.params[params].name}{if $methods[methods].ifunction_call.params[params].default != ''} = {$methods[methods].ifunction_call.params[params].default}]{/if}
{/section}
&nbsp;
{/if})</code>
    </td></tr></table>
    </td></tr></table><br />
        {if $methods[methods].sdesc != '' || $methods[methods].desc != ''}
        <!--  <strong>Description:</strong><br /> -->
        {include file="docblock.tpl" hide_tags=true sdesc=$methods[methods].sdesc desc=$methods[methods].desc}
        {/if}
    {if $methods[methods].ifunction_call.params}
                <br />
        <strong>Parameters:</strong><br />
            <table width="90%" class="defaultTable">
                        <thead class="defaultThead">
            <tr><td class="defaultTd"><strong>Type</strong></td><td class="defaultTd"><strong>Name</strong></td><td class="defaultTd"><strong>Description</strong></td></tr>
                        </thead>
                        <tbody>
        {section name=params loop=$methods[methods].ifunction_call.params}
            <tr><td class="defaultTd">
                {$methods[methods].ifunction_call.params[params].type}</td>
                <td class="defaultTd">
                {$methods[methods].ifunction_call.params[params].name}</td>
                <td class="defaultTd">
                {if $methods[methods].ifunction_call.params[params].description}{$methods[methods].ifunction_call.params[params].description}{/if}
            </td></tr>
        {/section}
                         </tbody>
        </table>
                <br />
    {/if}
    {include file="tags.tpl" api_tags=$methods[methods].api_tags info_tags=$methods[methods].info_tags}
    {if $methods[methods].method_overrides}
        <hr class="separator" />
        <div class="notes">Redefinition of:</div>
        <dl>
            <dt>{$methods[methods].method_overrides.link}</dt>
            {if $methods[methods].method_overrides.sdesc}
            <dd>{$methods[methods].method_overrides.sdesc}</dd>
            {/if}
        </dl>
    {/if}

    {if $methods[methods].descmethod}
        <hr class="separator" />
        <div class="notes">Redefined in descendants as:</div>
        <ul class="redefinitions">
        {section name=dm loop=$methods[methods].descmethod}
            <li>
                {$methods[methods].descmethod[dm].link}
                {if $methods[methods].descmethod[dm].sdesc}
                : {$methods[methods].descmethod[dm].sdesc}
                {/if}
            </li>
        {/section}
        </ul>
    {/if}
        </div>
    <br />
    <br>

{/section}