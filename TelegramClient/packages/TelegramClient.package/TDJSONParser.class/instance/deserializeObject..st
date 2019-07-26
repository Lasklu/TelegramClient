serialization
deserializeObject: jobj
	| type string |
	jobj class = Array ifTrue: [
		^ jobj collect: [:e | self deserializeObject: e]].
	(self class isSerializedObject: jobj) ifFalse: [ 
		^jobj ].
	
	type := 'TD_', (jobj at: '@type').
	
	Smalltalk globals declarations do: [:c | 
		(c key asString = type) ifTrue: [
			| obj |
			obj := c value new.
			 jobj keysAndValuesDo: [:k :v | 
				(k beginsWith: '@') ifFalse: [
				obj instVarNamed: k put: (self deserializeObject: v)]].
			^obj]].
	string := jobj at: '@type' asString.
	Debug warn: '[NOT IMPLEMENTED]', string.
	^nil