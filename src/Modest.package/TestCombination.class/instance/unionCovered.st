accessing
unionCovered
	| uniLines uniCombi |
	uniLines := OrderedCollection new.
	1 to: (self size) do: [ :i | 
		| tmpLines |
		tmpLines := ((self combi at: i) accessMethod: method atClass: file) lines.
		uniLines := (tmpLines union: uniLines) reject: [:elt | elt isNil].
	].
	uniCombi := self filterUnion: uniLines.
	coverage := uniCombi sum: [ :l | l coveredInstruction asInteger ].
	^ uniCombi.