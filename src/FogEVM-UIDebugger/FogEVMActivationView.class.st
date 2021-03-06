"
The activation view allow to see the current activation configuration. 
"
Class {
	#name : #FogEVMActivationView,
	#superclass : #ComposablePresenter,
	#instVars : [
		'activation',
		'from',
		'to',
		'contract',
		'context',
		'input',
		'return',
		'empty',
		'gas',
		'gasPrice',
		'transferValue',
		'returnBinary'
	],
	#classInstVars : [
		'mainLabel'
	],
	#category : #'FogEVM-UIDebugger-View'
}

{ #category : #specs }
FogEVMActivationView class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newRow: [ :r | 
			r
				newColumn: #empty width: 10;
				newColumn: [ :col | 
					col
						add: #empty height: 25;
						add: #from height: 25;
						add: #to height: 25;
						add: #contract height: 25;
						add: #context height: 25;
						add: #transferValue height: 25;
						add: #gas height: 25;
						add: #gasPrice height: 25;
						add: #input height: 50;
						add: #return;
						add: #returnBinary height: 25;
						add: #empty height: 25 ];
				newColumn: #empty width: 10 ]
]

{ #category : #accessing }
FogEVMActivationView >> activation [
	^ activation
]

{ #category : #accessing }
FogEVMActivationView >> activation: anObject [
	activation := anObject.
	self bindValues.
]

{ #category : #accessing }
FogEVMActivationView >> bindValues [
	from text: activation call callerAddress.
	to text: activation call contractAddress.
	contract text: (activation contract ifNil: [ '' ] ifNotNil: [ :val | val address ]).
	input subwidget text: (String streamContents: [ :str | activation call contractInput printOn: str ]).
	transferValue text: activation call callValue unsignedValue.
	context text: activation contextualAccount printString.
	gas text: activation gas unsignedValue printString.
	gasPrice text: activation gasPrice unsignedValue printString.
	return text: activation returnDebuggableValue asString.
	returnBinary text: activation return hex asString.
]

{ #category : #accessing }
FogEVMActivationView >> context [
	^ context
]

{ #category : #accessing }
FogEVMActivationView >> context: anObject [
	context := anObject
]

{ #category : #accessing }
FogEVMActivationView >> contract [
	^ contract
]

{ #category : #accessing }
FogEVMActivationView >> contract: anObject [
	contract := anObject
]

{ #category : #accessing }
FogEVMActivationView >> empty [ 
	^ empty
]

{ #category : #accessing }
FogEVMActivationView >> from [
	^ from
]

{ #category : #accessing }
FogEVMActivationView >> from: anObject [
	from := anObject
]

{ #category : #accessing }
FogEVMActivationView >> gas [
	^ gas
]

{ #category : #accessing }
FogEVMActivationView >> gasPrice [
	^ gasPrice
]

{ #category : #initialization }
FogEVMActivationView >> initializeWidgets [
	from := self instantiate: LabelledTextInput.
	from label: 'From:'.
	to := self instantiate: LabelledTextInput.
	to label: 'To:'.
	contract := self instantiate: LabelledTextInput.
	contract label: 'Contract:'.
	context := self instantiate: LabelledTextInput.
	context label: 'Context:'.
	input := self instantiate: LabelledContainer.
	input label: 'Input:'.
	input subwidget: self newText.
	
	
	return := self instantiate: LabelledContainer.
	return label: 'Return:'.
	return subwidget: self newText.
	
	returnBinary := self instantiate: LabelledTextInput.
	returnBinary label: 'Binary Return:'.
	
	transferValue := self instantiate: LabelledTextInput.
	transferValue label: 'Value:'.
	gas := self instantiate: LabelledTextInput.
	gas label: 'Gas:'.
	gasPrice := self instantiate: LabelledTextInput.
	gasPrice label: 'Gas price:'.
	empty := self newLabel.
	empty label: ''
]

{ #category : #accessing }
FogEVMActivationView >> input [
	^ input
]

{ #category : #accessing }
FogEVMActivationView >> input: anObject [
	input := anObject
]

{ #category : #accessing }
FogEVMActivationView >> refresh [ 
	self bindValues
]

{ #category : #accessing }
FogEVMActivationView >> return [
	^ return
]

{ #category : #accessing }
FogEVMActivationView >> returnBinary [
	^ returnBinary
]

{ #category : #accessing }
FogEVMActivationView >> to [
	^ to
]

{ #category : #accessing }
FogEVMActivationView >> to: anObject [
	to := anObject
]

{ #category : #accessing }
FogEVMActivationView >> transferValue [
	^ transferValue
]

{ #category : #accessing }
FogEVMActivationView >> transferValue: anObject [
	transferValue := anObject
]
