<cfparam name="videoID" default="">
<cfparam name="width" default="425">
<cfparam name="height" default="350">
<cfparam name="url" default="">

<cfscript>
	cfg =  this.controller.getModuleConfigBean();
	moduleID = this.controller.getModuleID();
	errorMsg = "";
	title = "";
	description = "";

	// get module path
	cfg = this.controller.getModuleConfigBean();
	tmpModulePath = cfg.getModuleRoot();	
	imgRoot = tmpModulePath & "/images";
	
	stUser = this.controller.getUserInfo();	

	try {
		// check if a video has been passed as a url
		if(structKeyExists(arguments,"url") and arguments.url neq "") {
			tmp = reFindNoCase("[\?|&|/]v=([^&##]*)",arguments.url,1,true);
			if(arrayLen(tmp.len) gt 1)
				videoID = mid(arguments.url,tmp.pos[2],tmp.len[2]);
		}
		
		// get settings
		if(videoID eq "") videoID = cfg.getPageSetting("videoID","");
		width = cfg.getPageSetting("width","425");
		height = cfg.getPageSetting("height","350");
		autoplay = cfg.getPageSetting("autoplay","0");
		
		if(videoID neq "") {
			obj = getYouTubeService();
			xmlResults = obj.getDetails(videoID);
			title = xmlResults.xmlRoot.title.xmlText;
			description = xmlResults.xmlRoot.content.xmlText;
		}
	
	} catch(any e) {
		errorMsg = e.message;	
	}
</cfscript>

<cfoutput>
	<div style="text-align:center;">
		<cfif errorMsg eq "">
			<cfif videoID neq "">
				<cfset tmpVideoURL = "http://www.youtube.com/v/#videoID#?fs=1">
				<cfif autoplay>
					<cfset tmpVideoURL = tmpVideoURL & "&autoplay=1">
				</cfif>
				
				<object width="#width#" height="#height#">
					<param name="movie" value="#tmpVideoURL#"></param>
					<param name="wmode" value="transparent"></param>
					<embed src="#tmpVideoURL#" 
							type="application/x-shockwave-flash" 
							wmode="transparent" width="#width#" height="#height#">
					</embed>
				</object>
				<div style="text-align:left;margin-top:10px;">
					#description#
				</div>
				
				<!--- set module title --->
				<script>
					#moduleID#.setTitle("#jsstringformat(title)#");
					#moduleID#.setIcon("http://www.youtube.com/favicon.ico");
				</script>				
			<cfelse>
				<b>No video set</b>
			</cfif>
		<cfelse>
			<b>Error: #errorMsg#</b>
		</cfif>
	</div>
	
	<cfif stUser.isOwner>
		<div class="SectionToolbar">
			<a href="javascript:#moduleID#.getPopupView('configVideo');"><img src="#imgRoot#/edit-page-yellow.gif" border="0" align="absmiddle"></a>
			<a href="javascript:#moduleID#.getPopupView('configVideo');">Configure</a>
		</div>
	</cfif>		
		
	<cfsavecontent variable="tmpHead">
		<script>
			#moduleID#.showVideo = function(args) {
				if(!args.videoID || args.videoID==undefined) args.videoID="";
				if(!args.url || args.url==undefined) args.url="";
				
				this.getView('', '', {videoID:args.videoID, url:args.url})
			}
		</script>
	</cfsavecontent>
	<cfhtmlhead text="#tmpHead#">
</cfoutput>
	