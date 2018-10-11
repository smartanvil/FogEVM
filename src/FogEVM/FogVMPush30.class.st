"
Place 30 byte item on stack
"
Class {
	#name : #FogVMPush30,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush30 class >> byteCode [ 
	^'0x7d'
]

{ #category : #'as yet unclassified' }
FogVMPush30 class >> description [ 
	^ 'Place 30 byte item on stack'
]

{ #category : #'as yet unclassified' }
FogVMPush30 class >> gas [
		^ self gasTable at: #gasPush.

]

{ #category : #generated }
FogVMPush30 class >> goCode [
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

{ #category : #'as yet unclassified' }
FogVMPush30 class >> mnemonic [
	^ 'PUSH30'
]

{ #category : #'as yet unclassified' }
FogVMPush30 >> initialize [ 
		super initialize.
		bytes := 30
]