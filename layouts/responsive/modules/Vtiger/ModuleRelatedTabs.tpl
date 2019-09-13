{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

{strip}
<div align="center" class='related-tabs row   visible-lg'>
	<ul class="nav nav-tabs">
		{foreach item=RELATED_LINK from=$DETAILVIEW_LINKS['DETAILVIEWTAB']}
			{assign var=RELATEDLINK_URL value=$RELATED_LINK->getUrl()}
			{assign var=RELATEDLINK_LABEL value=$RELATED_LINK->getLabel()}
			{assign var=RELATED_TAB_LABEL value={vtranslate('SINGLE_'|cat:$MODULE_NAME, $MODULE_NAME)}|cat:" "|cat:$RELATEDLINK_LABEL}
			<li class="tab-item {if $RELATED_TAB_LABEL==$SELECTED_TAB_LABEL}active{/if}" data-url="{$RELATEDLINK_URL}&tab_label={$RELATED_TAB_LABEL}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATEDLINK_LABEL}" data-link-key="{$RELATED_LINK->get('linkKey')}" >
				<a href="{$RELATEDLINK_URL}&tab_label={$RELATEDLINK_LABEL}&app={$SELECTED_MENU_CATEGORY}" class="textOverflowEllipsis">
					<span class="tab-label"><strong>{vtranslate($RELATEDLINK_LABEL,{$MODULE_NAME})}</strong></span>
				</a>
			</li>
		{/foreach}

		{assign var=RELATEDTABS value=$DETAILVIEW_LINKS['DETAILVIEWRELATED']}
		{assign var=COUNT value=$RELATEDTABS|@count}

		{assign var=LIMIT value = 8}
		{if $COUNT gt 8}
			{assign var=COUNT1 value = $LIMIT}
		{else}
			{assign var=COUNT1 value=$COUNT}
		{/if}

		{for $i = 0 to $COUNT1-1}
			{assign var=RELATED_LINK value=$RELATEDTABS[$i]}
			{assign var=RELATEDMODULENAME value=$RELATED_LINK->getRelatedModuleName()}
			{assign var=RELATEDFIELDNAME value=$RELATED_LINK->get('linkFieldName')}
			{assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK->getLabel(),$RELATEDMODULENAME)}
			<li class="tab-item {if (trim($RELATED_LINK->getLabel())== trim($SELECTED_TAB_LABEL)) && ($RELATED_LINK->getId() == $SELECTED_RELATION_ID)}active{/if}"  data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATED_LINK->getLabel()}"
				data-module="{$RELATEDMODULENAME}" data-relation-id="{$RELATED_LINK->getId()}" {if $RELATEDMODULENAME eq "ModComments"} title {else} title="{$DETAILVIEWRELATEDLINKLBL}"{/if} {if $RELATEDFIELDNAME}data-relatedfield ="{$RELATEDFIELDNAME}"{/if}>
				<a href="index.php?{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" class="textOverflowEllipsis" displaylabel="{$DETAILVIEWRELATEDLINKLBL}" recordsCount="" >
					{if $RELATEDMODULENAME eq "ModComments"}
						<span class="tab-label" ><strong>{$DETAILVIEWRELATEDLINKLBL}</strong></span>&nbsp;
					{else}
						<span class="tab-icon">
								{assign var=RELATED_MODULE_MODEL value=Vtiger_Module_Model::getInstance($RELATEDMODULENAME)}
							<i class="vicon-{strtolower($RELATEDMODULENAME)}" ></i>
								<span class="tab-label vtTabHeader">{$DETAILVIEWRELATEDLINKLBL}</span>
							</span>
					{/if}
					<span class="numberCircle hide">0</span>
				</a>
			</li>
			{if ($RELATED_LINK->getId() == {$smarty.request.relationId})}
				{assign var=MORE_TAB_ACTIVE value='true'}
			{/if}
		{/for}
		{if $MORE_TAB_ACTIVE neq 'true'}
			{for $i = 0 to $COUNT-1}
				{assign var=RELATED_LINK value=$RELATEDTABS[$i]}
				{if ($RELATED_LINK->getId() == {$smarty.request.relationId})}
					{assign var=RELATEDMODULENAME value=$RELATED_LINK->getRelatedModuleName()}
					{assign var=RELATEDFIELDNAME value=$RELATED_LINK->get('linkFieldName')}
					{assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK->getLabel(),$RELATEDMODULENAME)}
					<li class="more-tab moreTabElement active"  data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATED_LINK->getLabel()}"
						data-module="{$RELATEDMODULENAME}" data-relation-id="{$RELATED_LINK->getId()}" {if $RELATEDMODULENAME eq "ModComments"} title {else} title="{$DETAILVIEWRELATEDLINKLBL}"{/if} {if $RELATEDFIELDNAME}data-relatedfield ="{$RELATEDFIELDNAME}"{/if}>
						<a href="index.php?{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" class="textOverflowEllipsis" displaylabel="{$DETAILVIEWRELATEDLINKLBL}" recordsCount="" >
							{if $RELATEDMODULENAME eq "ModComments"}
								<span class="tab-label" ><strong>{$DETAILVIEWRELATEDLINKLBL}</strong></span>&nbsp;
							{else}
								<span class="tab-icon">
										{assign var=RELATED_MODULE_MODEL value=Vtiger_Module_Model::getInstance($RELATEDMODULENAME)}
									<i class="vicon-{strtolower($RELATEDMODULENAME)}" ></i>
									</span>
							{/if}
							<span class="numberCircle hide">0</span>
						</a>
					</li>
					{break}
				{/if}
			{/for}
		{/if}
		{if $COUNT gt $LIMIT}
			<li class="dropdown related-tab-more-element">
				<a href="javascript:void(0)" data-toggle="dropdown" class="dropdown-toggle">
						<span class="tab-label">
							<strong>{vtranslate("LBL_MORE",$MODULE_NAME)}</strong> &nbsp; <b class="fa fa-caret-down"></b>
						</span>
				</a>
				<ul class="dropdown-menu pull-right" id="relatedmenuList">
					{for $j = $COUNT1 to $COUNT-1}
						{assign var=RELATED_LINK value=$RELATEDTABS[$j]}
						{assign var=RELATEDMODULENAME value=$RELATED_LINK->getRelatedModuleName()}
						{assign var=RELATEDFIELDNAME value=$RELATED_LINK->get('linkFieldName')}
						{assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK->getLabel(),$RELATEDMODULENAME)}
						<li class="more-tab {if (trim($RELATED_LINK->getLabel())== trim($SELECTED_TAB_LABEL)) && ($RELATED_LINK->getId() == $SELECTED_RELATION_ID)}active{/if}" data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATED_LINK->getLabel()}"
							data-module="{$RELATEDMODULENAME}" title="" data-relation-id="{$RELATED_LINK->getId()}" {if $RELATEDFIELDNAME}data-relatedfield ="{$RELATEDFIELDNAME}"{/if}>
							<a href="index.php?{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" displaylabel="{$DETAILVIEWRELATEDLINKLBL}" recordsCount="">
								{if $RELATEDMODULENAME eq "ModComments"}
									<span class="tab-label textOverflowEllipsis"><strong>{$DETAILVIEWRELATEDLINKLBL}</strong></span>&nbsp;
								{else}
									{assign var=RELATED_MODULE_MODEL value=Vtiger_Module_Model::getInstance($RELATEDMODULENAME)}
									<span class="tab-icon textOverflowEllipsis">
											<i class="vicon-{strtolower($RELATEDMODULENAME)}"></i>
											<span class="content"> &nbsp;{$DETAILVIEWRELATEDLINKLBL}</span>
										</span>
								{/if}
								<span class="numberCircle hide">0</span>
							</a>
						</li>
					{/for}
				</ul>
			</li>
		{/if}
	</ul>
</div>

<!-- Related mobile -->
<div class="related-tabs-mobile visible-xs visible-md visible-sm row">
	<div class="col-md-12 col-sm-12 col-xs-12 text-center">
		<div class="btn-group">
			<button type="button" class="btn btn-se7en dropdown-toggle" style="width:200px!important;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-paperclip"></i> Related Modules <i class="fa fa-caret-down"></i>
			</button>
			<ul class="dropdown-menu related">
				{foreach item=RELATED_LINK from=$DETAILVIEW_LINKS['DETAILVIEWTAB']}
					{$engagementEnabledModules = ['Accounts','Contacts','Leads']}
					{if $MODULE_NAME|in_array:$engagementEnabledModules && (trim($RELATED_LINK->getLabel()) == 'LBL_UPDATES')}
						{assign var=RELATEDLINK_URL value="index.php?view=Detail&mode=showHistory&page=1&module="|cat:$MODULE_NAME|cat:"&record="|cat:$RECORD->getId()}
						{assign var=RELATEDLINK_LABEL value="LBL_HISTORY"}
						{assign var=RELATED_TAB_LABEL value="LBL_HISTORY"}
					{else}
						{assign var=RELATEDLINK_URL value=$RELATED_LINK->getUrl()}
						{assign var=RELATEDLINK_LABEL value=$RELATED_LINK->getLabel()}
						{assign var=RELATED_TAB_LABEL value={vtranslate('SINGLE_'|cat:$MODULE_NAME, $MODULE_NAME)}|cat:" "|cat:$RELATEDLINK_LABEL}
					{/if}
					<li class="tab-item {if $RELATED_TAB_LABEL==$SELECTED_TAB_LABEL}active{/if}{if $RELATED_LINK->getLabel()==$SELECTED_TAB_LABEL || ($SELECTED_TAB_LABEL=="" && $smarty.foreach.detlink.iteration==1)}active{/if}" data-url="{$RELATEDLINK_URL}&tab_label={$RELATED_TAB_LABEL}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATEDLINK_LABEL}" data-link-key="{$RELATED_LINK->get('linkKey')}" >
						<a href="{$RELATEDLINK_URL}&tab_label={$RELATEDLINK_LABEL}&app={$SELECTED_MENU_CATEGORY}" class="textOverflowEllipsis">
							<span class="tab-label"><strong>{vtranslate($RELATEDLINK_LABEL,{$MODULE_NAME})}</strong></span>
						</a>
					</li>
				{/foreach}
				<li class="divider"></li>
				{foreach item=RELATED_LINK from=$DETAILVIEW_LINKS['DETAILVIEWRELATED']}


					{assign var=RELATEDMODULENAME value=$RELATED_LINK->getRelatedModuleName()}
					{assign var=RELATEDFIELDNAME value=$RELATED_LINK->get('linkFieldName')}
					{assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK->getLabel(),$RELATEDMODULENAME)}

					<li class="tab-itemm {if $RELATED_LINK->getLabel()==$SELECTED_TAB_LABEL}active{/if}" data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" data-label-key="{$RELATED_LINK->getLabel()}" style="width:auto" title="{$DETAILVIEWRELATEDLINKLBL}">
						<a href="index.php?{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}&app={$SELECTED_MENU_CATEGORY}" class="textOverflowEllipsis">
						<span class="tab-label"><strong>{$DETAILVIEWRELATEDLINKLBL}</strong>&nbsp;
							</span>

							<span class="tab-icon pull-right">
								{assign var=RELATED_MODULE_MODEL value=Vtiger_Module_Model::getInstance($RELATEDMODULENAME)}
								<i class="vicon-{strtolower($RELATEDMODULENAME)}" ></i>
								<span class="numberCircle hide">0</span>
							</span>
						</a>

					</li>

				{/foreach}


			</ul>
		</div></div></div>
<!-- / Related mobile -->
{strip}
