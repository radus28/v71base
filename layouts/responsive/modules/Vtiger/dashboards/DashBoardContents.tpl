{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Vtiger/views/DashBoard.php *}
    
{strip}
<div class="dashBoardContainer clearfix">
        <div class="tabContainer">
		
		 <ul class="nav nav-tabs tabs sortable container-fluid visible-lg">
                {foreach key=index item=TAB_DATA from=$DASHBOARD_TABS}
                    <li class="{if $TAB_DATA["id"] eq $SELECTED_TAB}active{/if} dashboardTab" data-tabid="{$TAB_DATA["id"]}" data-tabname="{$TAB_DATA["tabname"]}">
                        <a data-toggle="tab" href="#tab_{$TAB_DATA["id"]}">
                            <div>
                                <span class="name textOverflowEllipsis" value="{$TAB_DATA["tabname"]}" style="width:10%">
                                    <strong>{$TAB_DATA["tabname"]}</strong>
                                </span>
                                <span class="editTabName hide">
                                    <input type="text" name="tabName"/>
                                </span>
                                {if $TAB_DATA["isdefault"] eq 0}
                                    <i class="ti-close deleteTab"></i>
                                {/if}
                                <i class="fa fa-bars moveTab hide"></i>
                            </div>
                        </a>
                    </li>
                {/foreach}
				
           <div class="moreSettings pull-right col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="dropdown dashBoardDropDown pull-right">
                        <button class="btn btn-primary reArrangeTabs dropdown-toggle" type="button" data-toggle="dropdown">{vtranslate('LBL_MORE',$MODULE)}
                            &nbsp;&nbsp;<span class="caret"></span></button>
                        <ul class="dropdown-menu dropdown-menu-right moreDashBoards">
                            <li id="newDashBoardLi"{if count($DASHBOARD_TABS) eq $DASHBOARD_TABS_LIMIT}class="disabled"{/if}><a class = "addNewDashBoard" href="#">{vtranslate('LBL_ADD_NEW_DASHBOARD',$MODULE)}</a></li>
                            <li><a class = "reArrangeTabs" href="#">{vtranslate('LBL_REARRANGE_DASHBOARD_TABS',$MODULE)}</a></li>
                        </ul>
                    </div>
                    <button class="btn-success updateSequence pull-right hide">{vtranslate('LBL_SAVE_ORDER',$MODULE)}</button>
                </div>

                
                
            </ul>

            <!-- Related mobile -->
<div class="sortable container-fluid visible-md visible-sm visible-xs" style="display:none!important" >
<div class="col-md-12 col-sm-12 col-xs-12 text-right padding0px">
<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle" style="width:200px!important;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <i class="fa fa-paperclip"></i> Tabs Dashboard <i class="fa fa-caret-down"></i>
  </button>
  <ul class="dropdown-menu">
 {foreach key=index item=TAB_DATA from=$DASHBOARD_TABS}
                    <li class="{if $TAB_DATA["id"] eq $SELECTED_TAB}active{/if} dashboardTab" data-tabid="{$TAB_DATA["id"]}" data-tabname="{$TAB_DATA["tabname"]}">
                        <a data-toggle="tab" href="#tab_{$TAB_DATA["id"]}">
                            <div>
                                <span class="name textOverflowEllipsis" value="{$TAB_DATA["tabname"]}" style="width:10%">
                                    <span>{$TAB_DATA["tabname"]}</span>
                                </span>
                                <span class="editTabName hide">
                                    <input type="text" name="tabName"/>
                                </span>
                                {if $TAB_DATA["isdefault"] eq 0}
                                    <i class="fa fa-close deleteTab"></i>
                                {/if}
                                <i class="fa fa-bars moveTab hide"></i>
                            </div>
                        </a>
                    </li>
                {/foreach}
            

  </ul>
</div></div></div>
    <!-- / Related mobile -->

            <div class="tab-content">
                {foreach key=index item=TAB_DATA from=$DASHBOARD_TABS}
                    <div id="tab_{$TAB_DATA["id"]}" data-tabid="{$TAB_DATA["id"]}" data-tabname="{$TAB_DATA["tabname"]}" class="tab-pane fade {if $TAB_DATA["id"] eq $SELECTED_TAB}in active{/if}">
                        {if $TAB_DATA["id"] eq $SELECTED_TAB}
                            {include file="modules/Vtiger/dashboards/DashBoardTabContents.tpl"}
                        {/if}
                    </div>
                {/foreach}
            </div>
        </div>
</div>
{/strip}
