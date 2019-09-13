<?php /* Smarty version Smarty-3.1.7, created on 2018-03-15 06:45:56
         compiled from "C:\AppServ\www\crm\vtigercrm71\includes\runtime/../../layouts/v7\modules\Accounts\DetailViewSummaryContents.tpl" */ ?>
<?php /*%%SmartyHeaderCode:80725aaa16a49264f1-04917943%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '921138989bf6df4f3d0ebc86516f4f01b5e5dbe8' => 
    array (
      0 => 'C:\\AppServ\\www\\crm\\vtigercrm71\\includes\\runtime/../../layouts/v7\\modules\\Accounts\\DetailViewSummaryContents.tpl',
      1 => 1520586669,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '80725aaa16a49264f1-04917943',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE_NAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5aaa16a4945b6',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5aaa16a4945b6')) {function content_5aaa16a4945b6($_smarty_tpl) {?>

<form id="detailView" class="clearfix" method="POST" style="position: relative"><div class="col-lg-12 resizable-summary-view"><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('SummaryViewWidgets.tpl',$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div></form><?php }} ?>