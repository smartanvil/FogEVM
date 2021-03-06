"
Signed less-than comparison
"
Class {
	#name : #FogVMSlt,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSlt class >> byteCode [
<doc>
		^'0x12'.
	
]

{ #category : #'as yet unclassified' }
FogVMSlt class >> description [ 
<doc>
	^ 'Signed less-than comparison'
]

{ #category : #generated }
FogVMSlt class >> expectedPops [
<doc>
		^2.
	
]

{ #category : #generated }
FogVMSlt class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #'as yet unclassified' }
FogVMSlt class >> gas [
<doc>
		^ self gasTable at: #GasFastestStep.
]

{ #category : #generated }
FogVMSlt class >> goCode [
<doc>
	^ 'func opSlt(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	x, y := stack.pop(), stack.peek()

	xSign := x.Cmp(tt255)
	ySign := y.Cmp(tt255)

	switch {
	case xSign >= 0 && ySign < 0:
		y.SetUint64(1)

	case xSign < 0 && ySign >= 0:
		y.SetUint64(0)

	default:
		if x.Cmp(y) < 0 {
			y.SetUint64(1)
		} else {
			y.SetUint64(0)
		}
	}
	interpreter.intPool.put(x)
	return ni'
]

{ #category : #generated }
FogVMSlt class >> mnemonic [
<doc>
		^'SLT'.
	
]
