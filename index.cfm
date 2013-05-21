<!---
   Copyright 2013 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->

<cfset $=application.serviceFactory.getBean('$')>
<cfset pluginConfig=$.getBean('pluginManager').getConfig('MuraFuseGuard')>

<cfif not structKeyExists(session,"siteID") or not application.permUtility.getModulePerm(pluginConfig.getValue('moduleID'),session.siteID)>
   <cflocation url="#application.configBean.getContext()#/admin/" addtoken="false">
</cfif>

<cfset $.init(session.siteID)>

<cfsavecontent variable="body">
   <cfoutput>
      <h1>Mura FuseGuard Connector</h1>

      <p>The FuseGuard Web Application Firewall for ColdFusion is a set of code designed to run inside your existing CFML web applications to block, filter, or log potentially malicious requests.</p>

      <p>Installation is as simple as adding a few lines of code to your Application.cfm or Application.cfc file, and optionally creating a database (see the install.txt file for details). Configuration, and all of the actual filtering, is done with ColdFusion so you don't need to learn a new XML language or complicated user interfaces. The Foundeo WAF (Web Application Firewall) is designed for easy 
     
      <cfif len(pluginConfig.getSetting('managerURL'))>
         <p>
            <a class="btn" href="#HTMLEditFormat(pluginConfig.getSetting('managerURL'))#" target="_blank">Open Web Manager</a>
         </p>
      </cfif>
   </cfoutput>
</cfsavecontent>

<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body=body,pagetitle='Mura FuseGuard Connector')#</cfoutput>