{**
 * templates/management/context.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * The press settings page.
 *}
{extends file="layouts/backend.tpl"}

{block name="page"}
	<h1 class="app__pageHeading">
		{translate key="manager.setup"}
	</h1>

	{if $newVersionAvailable}
		<div class="pkp_notification">
			{capture assign="notificationContents"}{translate key="site.upgradeAvailable.manager" currentVersion=$currentVersion latestVersion=$latestVersion siteAdminName=$siteAdmin->getFullName() siteAdminEmail=$siteAdmin->getEmail()}{/capture}
			{include file="controllers/notification/inPlaceNotificationContent.tpl" notificationId="upgradeWarning-"|uniqid notificationStyleClass="notifyWarning" notificationTitle="common.warning"|translate notificationContents=$notificationContents}
		</div>
	{/if}

	<tabs>
		<tab id="masthead" label="{translate key="manager.setup.masthead"}">
			{help file="settings/context-settings" class="pkp_help_tab"}
			<pkp-form
				v-bind="components.{$smarty.const.FORM_MASTHEAD}"
				@set="set"
			/>
		</tab>
		<tab id="contact" label="{translate key="about.contact"}">
			{help file="settings/context-settings" class="pkp_help_tab"}
			<pkp-form
				v-bind="components.{$smarty.const.FORM_CONTACT}"
				@set="set"
			/>
		</tab>
		<tab id="series" label="{translate key="series.series"}">
			{help file="settings/context-settings" class="pkp_help_tab"}
			{capture assign=seriesGridUrl}{url router=$smarty.const.ROUTE_COMPONENT component="grid.settings.series.SeriesGridHandler" op="fetchGrid" escape=false}{/capture}
			{load_url_in_div id="seriesGridContainer" url=$seriesGridUrl}
		</tab>
		<tab id="categories" label="{translate key="grid.category.categories"}">
			{help file="settings/context-settings" class="pkp_help_tab"}
			{capture assign=categoriesUrl}{url router=$smarty.const.ROUTE_COMPONENT component="grid.settings.category.CategoryCategoryGridHandler" op="fetchGrid" escape=false}{/capture}
			{load_url_in_div id="categoriesContainer" url=$categoriesUrl}
		</tab>
	</tabs>
{/block}