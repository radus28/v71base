{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{include file="modules/Vtiger/partials/Topbar.tpl"}

<div class="container-fluid app-nav">
    <div class="row">
        {include file="modules/Users/UsersSidebarHeader.tpl"}
        {include file="modules/Users/UsersModuleHeader.tpl"}
    </div>
</div>
</nav>
 <div id='overlayPageContent' class='fade modal overlayPageContent content-area overlay-container-300' tabindex='-1' role='dialog' aria-hidden='true'>
        <div class="data">
        </div>
        <div class="modal-dialog">
        </div>
    </div>
{if $FIELDS_INFO neq null}
    <script type="text/javascript">
        var users_settings_uimeta = (function() {
            var fieldInfo  = {$FIELDS_INFO};
            return {
                field: {
                    get: function(name, property) {
                        if(name && property === undefined) {
                            return fieldInfo[name];
                        }
                        if(name && property) {
                            return fieldInfo[name][property]
                        }
                    },
                    isMandatory : function(name){
                        if(fieldInfo[name]) {
                            return fieldInfo[name].mandatory;
                        }
                        return false;
                    },
                    getType : function(name){
                        if(fieldInfo[name]) {
                            return fieldInfo[name].type
                        }
                        return false;
                    }
                },
            };
        })();
    </script>
{/if}
<div class="main-container clearfix">
        <div class="module-nav clearfix" id="modnavigator">
            <div class="hidden-xs hidden-sm">
                {include file="modules/Users/UsersSidebar.tpl"}
            </div>
        </div>

<!--sidebar user toggle center-->
        <div id="sidebar-essentials" class="sidebar-essentials visible-xs visible-sm">
        <div class="col-xs-12 text-center visible-xs visible-sm" style="margin-top: 20px;">
        <a class="btn btn-default" onclick="$('.sidebar-menu').toggleClass('hidden-xs hidden-sm')">Sidebar 
        &nbsp;<span class="toggleButton"><i class="fa fa-angle-down"></i></span></a>
        </div>
        <div class="sidebar-menu hidden-xs hidden-sm">
        {include file="layouts/responsive/modules/Users/UsersSidebar_mobile.tpl"}
        </div>
        </div>
<!--sidebar user toggle center-->

        <div class="usersSettingsPageDiv row">
            <div class="col-sm-12 col-xs-12 ">
