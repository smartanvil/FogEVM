Class {
	#name : #FogEVMAstStorageStore,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'address',
		'value'
	],
	#category : #'FogEVM-DecompilerAST'
}

{ #category : #'as yet unclassified' }
FogEVMAstStorageStore >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitStorageStore: self 
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageStore >> address [
	^ address
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageStore >> address: aFogEVMAstVariable [ 
	address := aFogEVMAstVariable
]

{ #category : #accessing }
FogEVMAstStorageStore >> isStorageAccess [ 

	^ true 
]

{ #category : #printing }
FogEVMAstStorageStore >> printOn: aStream [
	aStream nextPutAll: '(storage at: '.
	address printOn: aStream.
	aStream nextPutAll: ' put: '.
	value printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : #unifying }
FogEVMAstStorageStore >> unify: aFogEVMAstVariable with: aFogEVMLiteral [
	address = aFogEVMAstVariable
		ifTrue: [ address := aFogEVMLiteral ].
	value = aFogEVMAstVariable
		ifTrue: [ value := aFogEVMLiteral ]
]

{ #category : #accessing }
FogEVMAstStorageStore >> value [
	^ value 
]

{ #category : #'as yet unclassified' }
FogEVMAstStorageStore >> value: aFogEVMAstVariable [ 
	value := aFogEVMAstVariable
]
