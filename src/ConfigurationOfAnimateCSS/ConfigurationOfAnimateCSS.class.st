"
Configuration for http://smalltalkhub.com/#!/~TorstenBergmann/AnimateCSS
"
Class {
	#name : #ConfigurationOfAnimateCSS,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfAnimateCSS
}

{ #category : #'development support' }
ConfigurationOfAnimateCSS class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfAnimateCSS class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfAnimateCSS class >> catalogDescription [

^ 
'The html5shiv is the defacto way to enable use of HTML5 sectioning elements in legacy Internet Explorer. This project allows to use this library in Seaside.'
]

{ #category : #catalog }
ConfigurationOfAnimateCSS class >> catalogKeywords [
	^ #(HTML web HTML5 Seaside HTML5Shiv)
	
]

{ #category : #private }
ConfigurationOfAnimateCSS class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfAnimateCSS class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfAnimateCSS class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfAnimateCSS class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfAnimateCSS class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfAnimateCSS class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfAnimateCSS class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfAnimateCSS class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfAnimateCSS >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/AnimateCSS/main/'.
		spec 
			package: #'AnimateCSS-Core';
			package: #'AnimateCSS-Tests-Core' with: [
				spec requires: #(#'AnimateCSS-Core' ). ]. 
		spec 
			group: 'Core' with: #(#'AnimateCSS-Core' );
			group: 'Tests' with: #(#'AnimateCSS-Tests-Core' ). ].

]

{ #category : #baselines }
ConfigurationOfAnimateCSS >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/AnimateCSS/main/'.
		spec 
			package: #'AnimateCSS-Core';
			package: #'AnimateCSS-Tests-Core' with: [
				spec requires: #(#'AnimateCSS-Core' ). ]. 
		spec 
			group: 'Core' with: #(#'AnimateCSS-Core' );
			group: 'Tests' with: #(#'AnimateCSS-Tests-Core' ). ].

]

{ #category : #accessing }
ConfigurationOfAnimateCSS >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfAnimateCSS >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfAnimateCSS >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfAnimateCSS >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.1.0'.

]

{ #category : #versions }
ConfigurationOfAnimateCSS >> version010: spec [
	<version: '0.1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1.0'.
		spec author: 'TorstenBergmann'.
		spec timestamp: '6/30/2015 20:27'.
		spec 
			package: #'AnimateCSS-Core' with: 'AnimateCSS-Core-TorstenBergmann.1';
			package: #'AnimateCSS-Tests-Core' with: 'AnimateCSS-Tests-Core-TorstenBergmann.1'. ].

]
