<?php /* Smarty version Smarty-3.1.7, created on 2019-09-13 13:40:01
         compiled from "D:\htdocs\v71base\includes\runtime/../../layouts/v7\modules\Vtiger\Footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:83925d7b9c312eddf1-90470278%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3f736624a20ac51e7f4aeaa8b7efdfa4e8532c46' => 
    array (
      0 => 'D:\\htdocs\\v71base\\includes\\runtime/../../layouts/v7\\modules\\Vtiger\\Footer.tpl',
      1 => 1521099564,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '83925d7b9c312eddf1-90470278',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'LANGUAGE_STRINGS' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5d7b9c312fc8d',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d7b9c312fc8d')) {function content_5d7b9c312fc8d($_smarty_tpl) {?>

<footer class="app-footer">
	<p>
		© 2015 - <?php echo date('Y');?>
&nbsp;&nbsp;
		&nbsp;|&nbsp;<a href="http://radus28.com/wpradus/" target="_blank">RADUS28 Software Solutions</a>&nbsp;|&nbsp;
		
	</p>
</footer>
</div>
<div id='overlayPage'>
	<!-- arrow is added to point arrow to the clicked element (Ex:- TaskManagement), 
	any one can use this by adding "show" class to it -->
	<div class='arrow'></div>
	<div class='data'>
	</div>
</div>
<div id='helpPageOverlay'></div>
<div id="js_strings" class="hide noprint"><?php echo Zend_Json::encode($_smarty_tpl->tpl_vars['LANGUAGE_STRINGS']->value);?>
</div>
<div class="modal myModal fade"></div>
<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('JSResources.tpl'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</body>

</html><?php }} ?>