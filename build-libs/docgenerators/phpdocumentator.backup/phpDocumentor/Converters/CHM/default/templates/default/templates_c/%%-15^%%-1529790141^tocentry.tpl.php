<?php /* Smarty version 2.6.0, created on 2003-12-18 01:55:32
         compiled from tocentry.tpl */ ?>
<UL>
<?php if (isset($this->_sections['entry'])) unset($this->_sections['entry']);
$this->_sections['entry']['name'] = 'entry';
$this->_sections['entry']['loop'] = is_array($_loop=$this->_tpl_vars['entry']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['entry']['show'] = true;
$this->_sections['entry']['max'] = $this->_sections['entry']['loop'];
$this->_sections['entry']['step'] = 1;
$this->_sections['entry']['start'] = $this->_sections['entry']['step'] > 0 ? 0 : $this->_sections['entry']['loop']-1;
if ($this->_sections['entry']['show']) {
    $this->_sections['entry']['total'] = $this->_sections['entry']['loop'];
    if ($this->_sections['entry']['total'] == 0)
        $this->_sections['entry']['show'] = false;
} else
    $this->_sections['entry']['total'] = 0;
if ($this->_sections['entry']['show']):

            for ($this->_sections['entry']['index'] = $this->_sections['entry']['start'], $this->_sections['entry']['iteration'] = 1;
                 $this->_sections['entry']['iteration'] <= $this->_sections['entry']['total'];
                 $this->_sections['entry']['index'] += $this->_sections['entry']['step'], $this->_sections['entry']['iteration']++):
$this->_sections['entry']['rownum'] = $this->_sections['entry']['iteration'];
$this->_sections['entry']['index_prev'] = $this->_sections['entry']['index'] - $this->_sections['entry']['step'];
$this->_sections['entry']['index_next'] = $this->_sections['entry']['index'] + $this->_sections['entry']['step'];
$this->_sections['entry']['first']      = ($this->_sections['entry']['iteration'] == 1);
$this->_sections['entry']['last']       = ($this->_sections['entry']['iteration'] == $this->_sections['entry']['total']);
?>
	<LI> <OBJECT type="text/sitemap">
		<param name="Name" value="<?php echo $this->_tpl_vars['entry'][$this->_sections['entry']['index']]['paramname']; ?>
">
<?php if ($this->_tpl_vars['entry'][$this->_sections['entry']['index']]['isclass']): ?>		<param name="ImageNumber" value="1">
<?php endif;  if ($this->_tpl_vars['entry'][$this->_sections['entry']['index']]['outputfile']): ?>		<param name="Local" value="<?php echo $this->_tpl_vars['entry'][$this->_sections['entry']['index']]['outputfile']; ?>
">
<?php endif; ?>		</OBJECT>
	<?php if ($this->_tpl_vars['entry'][$this->_sections['entry']['index']]['tocsubentries']):  echo $this->_tpl_vars['entry'][$this->_sections['entry']['index']]['tocsubentries'];  endif; ?>
<?php endfor; endif; ?>
	<?php echo $this->_tpl_vars['tocsubentries']; ?>

</UL>