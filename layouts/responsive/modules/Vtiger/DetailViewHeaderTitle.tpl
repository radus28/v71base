{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

{strip}
    <div class="col-lg-6 col-md-6 col-sm-6">
        <div class="record-header clearfix">
            {if !$MODULE}
                {assign var=MODULE value=$MODULE_NAME}
            {/if}
            <div class="recordImage bg_{$MODULE} app-{$SELECTED_MENU_CATEGORY} hidden-sm hidden-xs ">
                <div class="name">

                    {assign var=IMAGE_DETAILS value=$RECORD->getImageDetails()}
                    {foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
                        {if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
                            <img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" style="width:90px;height:90px">
                        {else}
                            <span><strong><i class="vicon-{strtolower($MODULE)}"></i></strong></span>
                                {/if}
                            {/foreach}
                            {if empty($IMAGE_DETAILS)}
                        <span><strong><i class="vicon-{strtolower($MODULE)}"></i></strong></span>
                            {/if}

                    <span><strong><i class="vicon-{strtolower($MODULE)}"></i></strong></span>

                </div>  
            </div>

            <div class="recordBasicInfo">
                <div class="info-row">
                    <h4>
                        <span class="recordLabel pushDown" title="{$RECORD->getName()}">
                            {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                                {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                                {if $FIELD_MODEL->getPermissions()}
                                    <span class="{$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
                                {/if}
                            {/foreach}
                        </span>
                    </h4>
                </div>
                {include file="DetailViewHeaderFieldsView.tpl"|vtemplate_path:$MODULE}
            </div>
        </div>
    </div>
{/strip}