"
SUnit tests for AnimateCSSDeploymentFileLibrary
"
Class {
	#name : #AnimateCSSDeploymentFileLibraryTest,
	#superclass : #TestCase,
	#category : #'AnimateCSS-Tests-Core'
}

{ #category : #tests }
AnimateCSSDeploymentFileLibraryTest >> testIncludeAnimateMinCssByDefault [

	self assert: (AnimateCSSDeploymentFileLibrary  new selectorsToInclude includes: #animateminCss)
	
]
