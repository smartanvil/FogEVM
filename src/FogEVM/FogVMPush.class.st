"
Place N bytes item on stack
"
Class {
	#name : #FogVMPush,
	#superclass : #FogEVMInstruction,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'bytes',
		'parameter'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush class >> byteCode [
	<doc>
	^ nil
]

{ #category : #'as yet unclassified' }
FogVMPush class >> description [ 
<doc>
	^ 'Place N bytes item on stack'
]

{ #category : #generated }
FogVMPush class >> expectedPops [
<doc>
		^0.
	
]

{ #category : #generated }
FogVMPush class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #generated }
FogVMPush class >> fetchGoCode [
<doc>
	| stream lowcaseStream selector bytes goCode |
	stream := 'instructions.go' asFileReference readStream.
	lowcaseStream := stream contents asLowercase readStream.
	selector := 'func makePush' asLowercase.
	lowcaseStream upToAll: selector.
	stream position: lowcaseStream position - selector size.
	bytes := (lowcaseStream upToAll: 'func') size + (lowcaseStream upToAll: 'func') size + (lowcaseStream upToAll: 'func') size.
	goCode := stream next: bytes.
	self class
		compile:
			('goCode
	^ ''{1}''' format: {goCode})
		classified: #generated
]

{ #category : #generated }
FogVMPush class >> goCode [
<doc>
	^ 'func makePush(size uint64, pushByteSize int) executionFunc {
	return func(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
		codeLen := len(contract.Code)

		startMin := codeLen
		if int(*pc+1) < startMin {
			startMin = int(*pc + 1)
		}

		endMin := codeLen
		if startMin+pushByteSize < endMin {
			endMin = startMin + pushByteSize
		}

		integer := interpreter.intPool.get()
		stack.push(integer.SetBytes(common.RightPadBytes(contract.Code[startMin:endMin], pushByteSize)))

		*pc += size
		return nil, nil
	}
}

// '
]

{ #category : #generated }
FogVMPush class >> instance [
<doc>
	^ self new
]

{ #category : #'as yet unclassified' }
FogVMPush class >> instance0x00 [
<doc>
	^ self new parameter: '0x00'; yourself 
]

{ #category : #'as yet unclassified' }
FogVMPush class >> instance0x0002 [
<doc>
	^ self new
		parameter: '0x0002';
		yourself
]

{ #category : #converting }
FogVMPush >> asPushableRegistry [
	^ FogEVMRegistry forPush: self 
]

{ #category : #accessing }
FogVMPush >> bytes [
	^ bytes
]

{ #category : #testing }
FogVMPush >> isPush [
	^ true
]

{ #category : #'as yet unclassified' }
FogVMPush >> loadParametersFrom: anHexaStream [
	parameter := '0x' , (anHexaStream next: bytes * 2)
]

{ #category : #'as yet unclassified' }
FogVMPush >> loadParametersFromByteArray: anByteStream [
	parameter := '0x' , ((anByteStream next: bytes) hex asString copyReplaceAll: '16r' with: '')
]

{ #category : #'as yet unclassified' }
FogVMPush >> parameter [
	^ parameter
]

{ #category : #'as yet unclassified' }
FogVMPush >> parameter: aString [ 
	parameter := aString
]

{ #category : #printing }
FogVMPush >> printBinaryOn: aStream [
	| stream |
	super printBinaryOn: aStream.
	aStream nextPutAll: self asPushableRegistry asRegistryLengthArray .
	
]

{ #category : #printing }
FogVMPush >> printHexaOn: aStream [
	super printHexaOn: aStream.
	aStream nextPutAll: self asPushableRegistry asWordByteArray hex
]

{ #category : #printing }
FogVMPush >> printOn: aStream [
	aStream
		nextPutAll: self mnemonic;
		nextPutAll: ' '.
	parameter ifNotNil: [ aStream nextPutAll: self asPushableRegistry printString ]
]

{ #category : #'as yet unclassified' }
FogVMPush >> pushable [
	^ parameter 
]

{ #category : #'as yet unclassified' }
FogVMPush >> size [
	^ super size + bytes
]
