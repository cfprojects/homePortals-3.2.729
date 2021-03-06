<?xml version="1.0" encoding="UTF-8"?>
<homePortals version="3.2.729">

	<!-- base path for the HomePortals installation -->
	<homePortalsPath>/homePortals/</homePortalsPath>

	<!-- base path for the current application -->
	<appRoot>/homePortals/</appRoot>

	<!-- Directory where content pages will be stored -->
	<contentRoot>/homePortals/contentRoot/</contentRoot>

	<!-- HomePortals page to load when no page has been provided -->
	<defaultPage>default</defaultPage>

	<!-- The maximum number of homeportals pages to cache at any given time -->
	<pageCacheSize>50</pageCacheSize>

	<!-- The maximum amount in minutes before an unchanged page is expelled from the cache. -->
	<pageCacheTTL>60</pageCacheTTL>

	<!-- The maximum number of items to hold in the catalog cache -->
	<catalogCacheSize>50</catalogCacheSize>

	<!-- Default TTL in minutes for content items on the catalog cache. -->
	<catalogCacheTTL>60</catalogCacheTTL>

	<!-- Path in dot notation for the class responsible for storing/retrieving HomePortals pages -->
	<pageProviderClass>homePortals.components.defaultPageProvider</pageProviderClass>

	<!-- List with allowed types of base resources -->
	<baseResourceTypes>script,style,header,footer</baseResourceTypes>
	
	<!-- The following resources are included in every page rendered. -->
	<baseResources>
		<!-- <resource href="/path/to/resource/file.xxx" type="style"/> -->	
	</baseResources>

	<!-- The following templates determine how homeportals will render the html content -->
	<renderTemplates>
		<renderTemplate name="module" type="module" default="true" href="/homePortals/templates/module.htm" />
		<renderTemplate name="moduleNoContainer" type="module" href="/homePortals/templates/moduleNoContainer.htm" />
		<renderTemplate name="page" type="page" default="true" href="/homePortals/templates/page.htm" />
	</renderTemplates>
	
	<!-- The following are the different types of modules or content renderers that will be supported on a page -->
	<contentRenderers>
		<contentRenderer moduleType="content" path="homePortals.renderers.content" />
		<contentRenderer moduleType="view" path="homePortals.renderers.view" />
		<contentRenderer moduleType="image" path="homePortals.renderers.image" />
		<contentRenderer moduleType="navMenu" path="homePortals.renderers.navMenu" />
		<contentRenderer moduleType="rss" path="homePortals.renderers.rss" />
		<contentRenderer moduleType="text" path="homePortals.renderers.text" />
		<contentRenderer moduleType="contentList" path="homePortals.renderers.contentList" />
		<contentRenderer moduleType="resourceList" path="homePortals.renderers.resourceList" />
		<contentRenderer moduleType="imageList" path="homePortals.renderers.imageList" />
		<contentRenderer moduleType="resourceView" path="homePortals.renderers.resourceView" />
		<contentRenderer moduleType="form" path="homePortals.renderers.form" />
	</contentRenderers>
	
	<!-- The following section is used to declare plugins to extend the functionality of HomePortals -->
	<plugins>
		<!--<plugin name="sample" path="homePortals.components.plugin" />-->
	</plugins>		

	<!-- This section declares the available resource types -->
	<resourceTypes>
		<resourceType name="content">
			<description>Content resources are blocks of formatted text that can be reused across a site</description>
			<fileTypes>htm,html</fileTypes>
		</resourceType>
						
		<resourceType name="feed">
			<description>Feeds are either RSS or Atom feeds from external sources that you can use with feed-enabled modules to display their contents on your site</description>
			<property name="rssurl" type="string" hint="Location of the source of the feed" label="Feed URL" />
			<property name="htmlurl" type="string" hint="Location of the website associated with this feed" label="Website URL" />
		</resourceType>
		
		<resourceType name="image">
			<description>This resource type is used to represent an image document</description>
			<property name="label" type="string" hint="Image title" />
			<property name="url" type="string" hint="An URL address associated to this image" />
			<fileTypes>gif,png,jpg,jpeg,pjpg,bmp</fileTypes>
		</resourceType>
		
	</resourceTypes>
	
	<!-- Directories where HomePortals will look for resources  -->
	<resourceLibraryPaths>
		<!-- <resourceLibraryPath>/path/to/library/</resourceLibraryPath> -->
	</resourceLibraryPaths>
	
	<!-- Additional resource library types  -->
	<resourceLibraryTypes>
		<resourceLibraryType prefix="file" path="homePortals.components.defaultResourceLibrary">
		</resourceLibraryType>

		<resourceLibraryType prefix="legacy" path="homePortals.components.legacyResourceLibrary">
		</resourceLibraryType>
		
		<resourceLibraryType prefix="db" path="homePortals.components.dbResourceLibrary">
			<!--
			Optional properties:
				dsn: datasource name, can also be given in the library path
				username: datasource username, if needed
				password: datasource password, if needed
				dbtype: type of database, if empty then is obtained from the JDBC driver
				tblPrefix: a prefix to prepend to table names used to store resource types
				resFilesPath: a web-accessible path to store resource files
			<property name="dsn" value="" />
			<property name="username" value="" /> //
			<property name="password" value="" />
			<property name="dbtype" value="" />
			<property name="tblPrefix" value="" />
			<property name="resFilesPath" value="" />
			-->
		</resourceLibraryType>
	</resourceLibraryTypes>
	
	<!-- this setting determines the default resourceLibraryType to use when not indicating explicitly via prefix -->
	<defaultResourceLibraryType>file</defaultResourceLibraryType>

	<!-- use this setting to provide a class that will be invoked whenever an error occurs while rendering a page -->
	<errorHandlerClass></errorHandlerClass>
	
</homePortals>
