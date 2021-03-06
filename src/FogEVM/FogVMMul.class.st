"
Multiplication operation
"
Class {
	#name : #FogVMMul,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMul class >> byteCode [
<doc>
		^'0x02'.
	
]

{ #category : #'as yet unclassified' }
FogVMMul class >> description [ 
<doc>
	^ 'Multiplication operation'
]

{ #category : #generated }
FogVMMul class >> expectedPops [
<doc>
		^2.
	
]

{ #category : #generated }
FogVMMul class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #'as yet unclassified' }
FogVMMul class >> gas [
<doc>
		^ self gasTable at: #GasFastStep.
]

{ #category : #generated }
FogVMMul class >> goCode [
<doc>
	^ 'func opMul(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	x, y := stack.pop(), stack.pop()
	stack.push(math.U256(x.Mul(x, y)))

	interpreter.intPool.put(y)

	return ni'
]

{ #category : #generated }
FogVMMul class >> mnemonic [
<doc>
		^'MUL'.
	
]
