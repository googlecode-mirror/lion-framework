{include file="header.tpl" title=$title}
{if $nav}
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="33%" align="left" valign="top">{if $prev}<a href="{$prev}">
Prev</a>{else}&nbsp;{/if}</td>
<td width="34%" align="center" valign="top">{if $up}<a href=
"{$up}">Up</a>{else}&nbsp;{/if}</td>
<td width="33%" align="right" valign="top">{if $next}<a href=
"{$next}">Next</a>{else}&nbsp;{/if}</td>
</tr>
<tr>
<td width="33%" align="left" valign="top">{if $prevtitle}{$prevtitle}{/if}</td>
<td width="34%" align="center" valign="top">{if $uptitle}{$uptitle}{/if}</td>
<td width="33%" align="right" valign="top">{if $nexttitle}{$nexttitle}{/if}</td>
</tr>
</table>
{/if}
{php}
  $this->assign('imagesdir', $this->get_template_vars('subdir') . 'images');
{/php}
{$contents|replace:'imagesdir':$imagesdir}
{if $nav}
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="33%" align="left" valign="top">{if $prev}<a href="{$prev}">
Prev</a>{else}&nbsp;{/if}</td>
<td width="34%" align="center" valign="top">{if $up}<a href=
"{$up}">Up</a>{else}&nbsp;{/if}</td>
<td width="33%" align="right" valign="top">{if $next}<a href=
"{$next}">Next</a>{else}&nbsp;{/if}</td>
</tr>
<tr>
<td width="33%" align="left" valign="top">{if $prevtitle}{$prevtitle}{/if}</td>
<td width="34%" align="center" valign="top">{if $uptitle}{$uptitle}{/if}</td>
<td width="33%" align="right" valign="top">{if $nexttitle}{$nexttitle}{/if}</td>
</tr>
</table>
{/if}
{include file="footer.tpl"}