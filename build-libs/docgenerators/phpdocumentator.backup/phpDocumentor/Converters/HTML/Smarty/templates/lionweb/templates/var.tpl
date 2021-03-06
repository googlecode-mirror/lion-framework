{section name=vars loop=$vars}
<a name="var{$vars[vars].var_name}" id="{$vars[vars].var_name}"><!-- --></A>

    <div class="var-header">
        <span class="var-title">
            <span class="var-type">{$vars[vars].var_type}</span>&nbsp;&nbsp;
            <span class="var-name">{$vars[vars].var_name}</span>
            {if $vars[vars].var_default} = <span class="var-default">{$vars[vars].var_default|replace:"\n":"<br />"}</span>{/if}
        </span>
    </div>

    {include file="docblock.tpl" hide_tags=true sdesc=$vars[vars].sdesc desc=$vars[vars].desc}
    {include file="tags.tpl" api_tags=$vars[vars].api_tags info_tags=$vars[vars].info_tags}

    {if $vars[vars].var_overrides}
        <hr class="separator" />
        <div class="notes">Redefinition of:</div>
        <dl>
            <dt>{$vars[vars].var_overrides.link}</dt>
            {if $vars[vars].var_overrides.sdesc}
            <dd>{$vars[vars].var_overrides.sdesc}</dd>
            {/if}
        </dl>
    {/if}

    {if $vars[vars].descvar}
        <hr class="separator" />
        <div class="notes">Redefined in descendants as:</div>
        <ul class="redefinitions">
        {section name=vm loop=$vars[vars].descvar}
            <li>
                {$vars[vars].descvar[vm].link}
                {if $vars[vars].descvar[vm].sdesc}
                : {$vars[vars].descvar[vm].sdesc}
                {/if}
            </li>
        {/section}
        </ul>
    {/if}
    <br />
{/section}
