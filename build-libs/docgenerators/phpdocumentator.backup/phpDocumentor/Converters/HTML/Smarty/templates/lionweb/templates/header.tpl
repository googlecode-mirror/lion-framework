<table cellpadding="10" cellspacing="0" width="100%" border="0"><tr><td valign="top">
{if !$hasel}{assign var="hasel" value=false}{/if}
{if $hasel}
<h1>{$eltype|capitalize}: {$class_name}</h1>
<br />
{/if}