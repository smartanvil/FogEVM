"
Duplicates the item 16 at the stack and push it
"
Class {
	#name : #FogVMDup16,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDup16 class >> byteCode [ 
<doc>
	^'0x8f'
]

{ #category : #'as yet unclassified' }
FogVMDup16 class >> description [ 
<doc>
	^ 'Duplicates the item 16 at the stack and push it'
]

{ #category : #generated }
FogVMDup16 class >> expectedPops [ 
<doc>
	^16
]

{ #category : #generated }
FogVMDup16 class >> expectedPushes [ 
<doc>
	^17
]

{ #category : #'as yet unclassified' }
FogVMDup16 class >> gas [
<doc>
		^ self gasTable at: #gasDup.
]

{ #category : #generated }
FogVMDup16 class >> goCode [
<doc>
	^ 'func makeDup(size int64) executionFunc {
	return func(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
		stack.dup(interpreter.intPool, int(size))
		return nil, nil
	}
}

// ma'
]

{ #category : #generated }
FogVMDup16 class >> mnemonic [
<doc>
	^ 'DUP16'
]
