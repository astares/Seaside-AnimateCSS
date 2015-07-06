"
SUnit tests for AnimateCSSDevelopmentFileLibrary
"
Class {
	#name : #AnimateCSSDevelopmentFileLibraryTest,
	#superclass : #TestCase,
	#category : #'AnimateCSS-Tests-Core'
}

{ #category : #tests }
AnimateCSSDevelopmentFileLibraryTest >> testIncludeAnimateCssByDefault [

	self assert: (AnimateCSSDevelopmentFileLibrary  new selectorsToInclude includes: #animateCss)
	
]
