{if $sdesc != ''}{$sdesc|default:''}<br /><br />{/if}
{if $desc != ''}{$desc|default:''}<br />{/if}
{if count($tags) > 0 and $hide_tags != true}
<table border="0" cellspacing="0" cellpadding="0">
{section name=tag loop=$tags}
{if $tags[tag].data != ''}
  <tr>
    <td><b>{$tags[tag].keyword|capitalize}:</b>&nbsp;&nbsp;</td><td>{$tags[tag].data}</td>
  </tr>
{/if}
{/section}
</table>
{/if}