"
Signed integer division operation (truncated)
"
Class {
	#name : #FogVMSdiv,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSdiv class >> byteCode [
<doc>
		^'0x05'.
	
]

{ #category : #'as yet unclassified' }
FogVMSdiv class >> description [ 
<doc>
	^ 'Signed integer division operation (truncated)'
]

{ #category : #generated }
FogVMSdiv class >> expectedPops [
<doc>
		^2.
	
]

{ #category : #generated }
FogVMSdiv class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #'as yet unclassified' }
FogVMSdiv class >> gas [
<doc>
		^ self gasTable at: #GasFastStep.
]

{ #category : #generated }
FogVMSdiv class >> goCode [
<doc>
	^ 'func opSdiv(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	x, y := math.S256(stack.pop()), math.S256(stack.pop())
	res := interpreter.intPool.getZero()

	if y.Sign() == 0 || x.Sign() == 0 {
		stack.push(res)
	} else {
		if x.Sign() != y.Sign() {
			res.Div(x.Abs(x), y.Abs(y))
			res.Neg(res)
		} else {
			res.Div(x.Abs(x), y.Abs(y))
		}
		stack.push(math.U256(res))
	}
	interpreter.intPool.put(x, y)
	return n'
]

{ #category : #generated }
FogVMSdiv class >> mnemonic [
<doc>
		^'SDIV'.
	
]
