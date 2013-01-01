{include file="header.tpl" title=$title}
{php}
  $this->assign('imagesdir', $this->get_template_vars('subdir') . 'images');
{/php}
{$contents|replace:'imagesdir':$imagesdir}
{include file="footer.tpl"}