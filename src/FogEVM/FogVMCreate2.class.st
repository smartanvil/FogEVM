"
New create routine 
"
Class {
	#name : #FogVMCreate2,
	#superclass : #FogEVMInstruction,
	#category : #'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCreate2 class >> byteCode [
<doc>
	^ '0xf5'
]

{ #category : #generated }
FogVMCreate2 class >> description [
<doc>
	^ 'New create routine'
]

{ #category : #generated }
FogVMCreate2 class >> expectedPops [
<doc>
	^ 4
]

{ #category : #generated }
FogVMCreate2 class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #'as yet unclassified' }
FogVMCreate2 class >> gas [
<doc>
		^ self gasTable at: #gasCreate2.
]

{ #category : #generated }
FogVMCreate2 class >> goCode [
<doc>
	^ 'func opCreate2(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	var (
		endowment    = stack.pop()
		offset, size = stack.pop(), stack.pop()
		salt         = stack.pop()
		input        = memory.Get(offset.Int64(), size.Int64())
		gas          = contract.Gas
	)

	// Apply EIP150
	gas -= gas / 64
	contract.UseGas(gas)
	res, addr, returnGas, suberr := interpreter.evm.Create2(contract, input, gas, endowment, salt)
	// Push item on the stack based on the returned error.
	if suberr != nil {
		stack.push(interpreter.intPool.getZero())
	} else {
		stack.push(addr.Big())
	}
	contract.Gas += returnGas
	interpreter.intPool.put(endowment, offset, size, salt)

	if suberr == errExecutionReverted {
		return res, nil
	}
	retur'
]

{ #category : #'as yet unclassified' }
FogVMCreate2 class >> memoryUsage [
<doc>
		^ self memoryTable at: #memoryCreate2.
]

{ #category : #generated }
FogVMCreate2 class >> mnemonic [
<doc>
		^'CREATE2'.
	
]

{ #category : #'as yet unclassified' }
FogVMCreate2 class >> returns [
<doc>
		^ true.
]

{ #category : #'as yet unclassified' }
FogVMCreate2 class >> writes [
<doc>
		^ true.
]
