Class {
	#name : #TestCombinationTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #initialization }
TestCombinationTest >> setUpTestCombi [
	| file testCatalog method comb |
	testCatalog := TestCatalogTest loadCatalog.
	file := 'Coffee.java'.
	method := (testCatalog allMethodsFrom: file) at: 2.
	comb := TestCombinationCatalog createCombiOfMethod: method fromFile: file withTests: testCatalog.
	^ comb at: 10.
]

{ #category : #running }
TestCombinationTest >> testCoverage [
	| testC |
	testC := self setUpTestCombi.
	self assert: testC coverage equals: 56.
	testC := TestCombination new coverage: 20.
	self assert: testC coverage equals: 20.
]

{ #category : #running }
TestCombinationTest >> testInitialize [
	| testC |
	testC := TestCombination new.
	self assert: testC combi size equals: 0.
	self assert: testC file equals: ''.
	self assert: testC method equals: (Method new).
]

{ #category : #running }
TestCombinationTest >> testSize [
	| testC |
	testC := self setUpTestCombi.
	self assert: testC combi size equals: 2.
]

{ #category : #running }
TestCombinationTest >> testUnionCovered [
	| testC collection |
	testC := self setUpTestCombi.
	"6 10 11 12 14 15 16"
	collection := testC unionCovered collect: [ :l | l number asInteger ].
	self assert: collection equals: (#(6 10 11 12 14 15 16) asOrderedCollection).
]
