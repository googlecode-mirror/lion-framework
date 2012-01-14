<HTML><HEAD><TITLE>{$title}</TITLE>
<LINK href="{$subdir}media/styles.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width=10 height=10><IMG height=10 
      src="{$subdir}media/bg_corner_upper_left.gif" width=10 
    border=0></TD>
    <TD background="{$subdir}media/bg_upper_line.gif" height=10><IMG 
      height=10 src="{$subdir}media/bg_upper_line.gif" width=10 
      border=0></TD>
    <TD width=10 height=10><IMG height=10 
      src="{$subdir}media/bg_corner_upper_right.gif" width=10 
    border=0></TD></TR></TBODY></TABLE>
<DIV class=main align=right>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><IMG height=38 src="{$subdir}images/header_title.gif" width=145 border=0> </TD>
    <TD align=right>&nbsp;</TD>
  </TR>
</TBODY></TABLE>
<a href="{$subdir}classtrees_{$package}.html" class="menu">class tree: {$package}</a>
&nbsp;|&nbsp;
<a href="{$subdir}elementindex_{$package}.html" class="menu">index: {$package}</a>
&nbsp;|&nbsp;
<a href="{$subdir}elementindex.html" class="menu">all elements</a>
<BR><BR>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<tr><td>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <TR>
    <td class="header_top">{$package}</td>
  </TR> 
  <tr valign="top">
    <td width="200" class="menu">
{if count($ric) >= 1}
	<div id="ric">
		{section name=ric loop=$ric}
			<p><a href="{$subdir}{$ric[ric].file}">{$ric[ric].name}</a></p>
		{/section}
	</div>
{/if}
{if $hastodos}
	<div id="todolist">
			<p><a href="{$subdir}{$todolink}">Todo List</a></p>
	</div>
{/if}
      <b>Packages:</b><br />
{php}
if(!function_exists('msort')) {
    function msort($array, $id) {
        $temp_array = array();
        while(count($array)>0) {
            $lowest_id = 0;
            $index=0;
            foreach ($array as $item) {
                if ($item[$id]<$array[$lowest_id][$id]) {
                    $lowest_id = $index;
                }
                $index++;
            }
            $temp_array[] = $array[$lowest_id];
            $array = array_merge(array_slice($array, 0,$lowest_id), array_slice($array, $lowest_id+1));
        }
        return $temp_array;
    }
}

  // assign a variable to Smarty
  $packageindex = $this->get_template_vars('packageindex');
  $packageindex = msort($packageindex, 'title');
  $this->assign('packageindex', $packageindex);
{/php}

      {foreach from=$packageindex item=packageitem}
        <a href="{$subdir}{$packageitem.link}">{$packageitem.title}</a><br />
      {/foreach}
      <br /><br />
{if $tutorials}
		<b>Tutorials/Manuals:</b><br />
		{if $tutorials.pkg}
			<strong>Package-level:</strong>
			{section name=ext loop=$tutorials.pkg}
				{$tutorials.pkg[ext]}
			{/section}
		{/if}
		{if $tutorials.cls}
			<strong>Class-level:</strong>
			{section name=ext loop=$tutorials.cls}
				{$tutorials.cls[ext]}
			{/section}
		{/if}
		{if $tutorials.proc}
			<strong>Procedural-level:</strong>
			{section name=ext loop=$tutorials.proc}
				{$tutorials.proc[ext]}
			{/section}
		{/if}
      <br />
{/if}
      {if !$noleftindex}{assign var="noleftindex" value=false}{/if}
      {if !$noleftindex}
      {if $compiledclassindex}
      <b>Classes:</b><br />
      {eval var=$compiledclassindex}
      {/if}
      {if $compiledinterfaceindex}
      <br />
      <b>Interfaces:</b><br />
      {eval var=$compiledinterfaceindex}
      {/if}
      {/if}
    </td>
    <td>
      <table cellpadding="10" cellspacing="0" width="100%" border="0"><tr><td valign="top">

{if !$hasel}{assign var="hasel" value=false}{/if}
{if $hasel}
<h1>{$eltype|capitalize}: {$class_name}</h1>
Source Location: {$source_location}<br /><br />
{/if}