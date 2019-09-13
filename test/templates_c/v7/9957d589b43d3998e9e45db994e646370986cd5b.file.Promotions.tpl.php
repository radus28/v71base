<?php /* Smarty version Smarty-3.1.7, created on 2018-03-14 07:45:47
         compiled from "C:\AppServ\www\crm\vtigercrm71\includes\runtime/../../layouts/v7\modules\ExtensionStore\Promotions.tpl" */ ?>
<?php /*%%SmartyHeaderCode:70665aa8d32b8e3c15-17985055%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9957d589b43d3998e9e45db994e646370986cd5b' => 
    array (
      0 => 'C:\\AppServ\\www\\crm\\vtigercrm71\\includes\\runtime/../../layouts/v7\\modules\\ExtensionStore\\Promotions.tpl',
      1 => 1520586669,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '70665aa8d32b8e3c15-17985055',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'HEADER_SCRIPTS' => 0,
    'SCRIPT' => 0,
    'PROMOTIONS' => 0,
    'PROMOTION' => 0,
    'SUMMARY' => 0,
    'EXTENSION_NAME' => 0,
    'LOCATION_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5aa8d32ba8ccd',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5aa8d32ba8ccd')) {function content_5aa8d32ba8ccd($_smarty_tpl) {?>

<?php  $_smarty_tpl->tpl_vars['SCRIPT'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['SCRIPT']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['HEADER_SCRIPTS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['SCRIPT']->key => $_smarty_tpl->tpl_vars['SCRIPT']->value){
$_smarty_tpl->tpl_vars['SCRIPT']->_loop = true;
?><script type="<?php echo $_smarty_tpl->tpl_vars['SCRIPT']->value->getType();?>
" src="<?php echo $_smarty_tpl->tpl_vars['SCRIPT']->value->getSrc();?>
" /><?php } ?><div class="banner-container" style="margin: 0px 10px;"><div class="row"></div><div class="banner"><ul class="bxslider"><?php  $_smarty_tpl->tpl_vars['PROMOTION'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['PROMOTION']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['PROMOTIONS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['PROMOTION']->key => $_smarty_tpl->tpl_vars['PROMOTION']->value){
$_smarty_tpl->tpl_vars['PROMOTION']->_loop = true;
?><?php if (is_object($_smarty_tpl->tpl_vars['PROMOTION']->value)){?><li><?php $_smarty_tpl->tpl_vars['SUMMARY'] = new Smarty_variable($_smarty_tpl->tpl_vars['PROMOTION']->value->get('summary'), null, 0);?><?php $_smarty_tpl->tpl_vars['EXTENSION_NAME'] = new Smarty_variable($_smarty_tpl->tpl_vars['PROMOTION']->value->get('label'), null, 0);?><?php if (is_numeric($_smarty_tpl->tpl_vars['SUMMARY']->value)){?><?php $_smarty_tpl->tpl_vars['LOCATION_URL'] = new Smarty_variable($_smarty_tpl->tpl_vars['PROMOTION']->value->getLocationUrl($_smarty_tpl->tpl_vars['SUMMARY']->value,$_smarty_tpl->tpl_vars['EXTENSION_NAME']->value), null, 0);?><?php }else{ ?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['SUMMARY']->value;?>
<?php $_tmp1=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['LOCATION_URL'] = new Smarty_variable($_tmp1, null, 0);?><?php }?><a onclick="window.open('<?php echo $_smarty_tpl->tpl_vars['LOCATION_URL']->value;?>
')"><img src="<?php if ($_smarty_tpl->tpl_vars['PROMOTION']->value->get('bannerURL')){?><?php echo $_smarty_tpl->tpl_vars['PROMOTION']->value->get('bannerURL');?>
<?php }?>" title="<?php echo $_smarty_tpl->tpl_vars['PROMOTION']->value->get('label');?>
" /></a></li><?php }?><?php } ?></ul></div></div>
<?php }} ?>