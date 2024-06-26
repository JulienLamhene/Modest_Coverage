initialization
loadAllFrom: aPath
	| home aXMLCollection path|	
	home := ((FileLocator root) / (aPath withoutPrefix: '/')).
	path := home pathString , '/'.
	(home pathString endsWith: '/') ifFalse: [ 
		path := path , '/'.
	].

	home := (home allChildren reject: [ :child | 
		child extension ~= 'xml' 
	]) sort.
	
	aXMLCollection := OrderedCollection new.
	home do: [ :file |
		aXMLCollection add:
			(XMLReport loadFrom: path on: file basename) ].
	^ aXMLCollection