/*
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
*/
component extends="mura.plugin.pluginGenericEventHandler" output="false" {
	
	variables.configurator='MyConfigurator';
	variables.missingLib=false;

	function onApplicationLoad($){
		variables.configurator = variables.pluginConfig.getSetting("configurator");
		initFuseguard();
		variables.pluginConfig.addEventHandler(this);
		
		if(!variables.missingLib){
			$.getBean('configBean').setScriptProtect(0);
		}
	}

	function onGlobalRequestStart($){

		if(NOT IsDefined("application.fuseguard") OR application.fuseguard.shouldReInitialize()){
			initFuseguard();
		}

		if(!variables.missingLib){
			application.fuseguard.processRequest();
		}
	}

	function initFuseguard(){
		if(!variables.missingLib){
			if(fileExists(expandPath("/fuseguard/components/firewall.cfc"))){
				application.fuseguard=new fuseguard.components.firewall(configurator=variables.configurator);
			} else {
				variables.missingLib=true;
			}
		}
	}

}

