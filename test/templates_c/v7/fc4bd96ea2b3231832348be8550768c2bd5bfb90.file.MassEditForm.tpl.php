<?php /* Smarty version Smarty-3.1.7, created on 2018-03-15 06:33:51
         compiled from "C:\AppServ\www\crm\vtigercrm71\includes\runtime/../../layouts/v7\modules\Vtiger\MassEditForm.tpl" */ ?>
<?php /*%%SmartyHeaderCode:143865aaa13cfbf6400-77388268%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fc4bd96ea2b3231832348be8550768c2bd5bfb90' => 
    array (
      0 => 'C:\\AppServ\\www\\crm\\vtigercrm71\\includes\\runtime/../../layouts/v7\\modules\\Vtiger\\MassEditForm.tpl',
      1 => 1520586669,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '143865aaa13cfbf6400-77388268',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE' => 0,
    'CVID' => 0,
    'SELECTED_IDS' => 0,
    'EXCLUDED_IDS' => 0,
    'SEARCH_PARAMS' => 0,
    'TITLE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5aaa13cfd6d2d',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5aaa13cfd6d2d')) {function content_5aaa13cfd6d2d($_smarty_tpl) {?>
<div id="massEditContainer" class='fc-overlay-modal modal-content'><form class="form-horizontal" id="massEdit" name="MassEdit" method="post" action="index.php"><input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
" /><input type="hidden" name="action" value="MassSave" /><input type="hidden" name="viewname" value="<?php echo $_smarty_tpl->tpl_vars['CVID']->value;?>
" /><input type="hidden" name="selected_ids" value=<?php echo ZEND_JSON::encode($_smarty_tpl->tpl_vars['SELECTED_IDS']->value);?>
><input type="hidden" name="excluded_ids" value=<?php echo ZEND_JSON::encode($_smarty_tpl->tpl_vars['EXCLUDED_IDS']->value);?>
><input type="hidden" name="search_params" value='<?php echo ZEND_JSON::encode($_smarty_tpl->tpl_vars['SEARCH_PARAMS']->value);?>
' /><div><header class="overlayHeader" style='flex:0 0 auto;'><?php ob_start();?><?php echo vtranslate('LBL_MASS_EDITING',$_smarty_tpl->tpl_vars['MODULE']->value);?>
<?php $_tmp1=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['TITLE'] = new Smarty_variable($_tmp1, null, 0);?><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("ModalHeader.tpl",$_smarty_tpl->tpl_vars['MODULE']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('TITLE'=>$_smarty_tpl->tpl_vars['TITLE']->value), 0);?>
</header><div class='modal-body' style="margin-bottom:60px"><div class='datacontent editViewContents'><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("partials/EditViewContents.tpl",$_smarty_tpl->tpl_vars['MODULE']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div></div><footer class='modal-footer overlayFooter'><center><button type='submit' class='btn btn-success saveButton'><?php echo vtranslate('LBL_SAVE',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</button>&nbsp;&nbsp;<a class='cancelLink' data-dismiss="modal" href="#"><?php echo vtranslate('LBL_CANCEL',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a></center></footer></div></form></div><?php }} ?>