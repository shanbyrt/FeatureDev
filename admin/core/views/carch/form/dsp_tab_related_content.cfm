<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfset tabLabelList=listAppend(tabLabelList,application.rbFactory.getKeyValue(session.rb,"sitemanager.content.tabs.relatedcontent"))/>
<cfset tabList=listAppend(tabList,"tabRelatedcontent")>
<cfoutput>
<div id="tabRelatedcontent" class="tab-pane">

	<span id="extendset-container-tabrelatedcontenttop" class="extendset-container"></span>

	<div class="fieldset padded">
	<!--- #application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.relatedcontent')#:  --->
	<span id="selectRelatedContent"> <a class="btn" href="javascript:;" onclick="javascript: siteManager.loadRelatedContent('#HTMLEditFormat(rc.siteid)#','',1);return false;"><i class="icon-plus-sign"></i> #application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.addrelatedcontent')#</a></span>
		<table id="relatedContent" class="table table-striped table-condensed table-bordered mura-table-grid"> 
			<thead>
				<tr>
				<th class="var-width">#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.contenttitle')#</th>
				<th>#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.type')#</th>
				<th class="actions">&nbsp;</th>
				</tr>
			</thead>
			<tbody id="RelatedContent">
				<cfif rc.rsRelatedContent.recordCount>
				<cfloop query="rc.rsRelatedContent">
				<cfset itemcrumbdata=application.contentManager.getCrumbList(rc.rsRelatedContent.contentid, rc.siteid)/>
				<tr id="c#rc.rsRelatedContent.contentID#">
				<td class="var-width">#application.contentRenderer.dspZoom(itemcrumbdata)#</td>
				<td>#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.type.#rc.rsRelatedContent.type#')#</td>
				<td class="actions">
					<input type="hidden" name="relatedcontentid" value="#rc.rsRelatedContent.contentid#" />
						<ul class="clearfix"><li class="delete"><a title="Delete" href="##" onclick="return siteManager.removeRelatedContent('c#rc.rsRelatedContent.contentid#','#jsStringFormat(application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.removerelatedcontent'))#');"><i class="icon-remove-sign"></i></a></li>
						</ul>
				</td>
				</tr></cfloop>
				<cfelse>
				<tr>
				<td id="noFilters" colspan="4" class="noResults">#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.norelatedcontent')#</td>
				</tr>
				</cfif>
			</tbody>
		</table>	
	</div>

	<span id="extendset-container-relatedcontent" class="extendset-container"></span>
	<span id="extendset-container-tabrelatedcontentbottom" class="extendset-container"></span>
</div>

</cfoutput>