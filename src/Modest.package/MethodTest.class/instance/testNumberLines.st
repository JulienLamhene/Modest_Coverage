running
testNumberLines
	| xmlReport test path method |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlReport := XMLReport loadFrom: path on: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	test := Test fromXMLReport: xmlReport.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method numberLines equals: 4.