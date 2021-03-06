"
Message-call into this account with an alternative accounts code
"
Class {
	#name : #FogVMCallcode,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCallcode class >> byteCode [
<doc>
		^'0xf2'.
	
]

{ #category : #'as yet unclassified' }
FogVMCallcode class >> description [ 
<doc>
	^ 'Message-call into this account with an alternative accounts code'
]

{ #category : #generated }
FogVMCallcode class >> expectedPops [
<doc>
		^7.
	
]

{ #category : #generated }
FogVMCallcode class >> expectedPushes [
<doc>
		^1.
	
]

{ #category : #'as yet unclassified' }
FogVMCallcode class >> gas [
<doc>
		^ self gasTable at: #gasCallCode.
]

{ #category : #generated }
FogVMCallcode class >> goCode [
<doc>
	^ 'func opCallCode(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	// Pop gas. The actual gas is in interpreter.evm.callGasTemp.
	interpreter.intPool.put(stack.pop())
	gas := interpreter.evm.callGasTemp
	// Pop other call parameters.
	addr, value, inOffset, inSize, retOffset, retSize := stack.pop(), stack.pop(), stack.pop(), stack.pop(), stack.pop(), stack.pop()
	toAddr := common.BigToAddress(addr)
	value = math.U256(value)
	// Get arguments from the memory.
	args := memory.Get(inOffset.Int64(), inSize.Int64())

	if value.Sign() != 0 {
		gas += params.CallStipend
	}
	ret, returnGas, err := interpreter.evm.CallCode(contract, toAddr, args, gas, value)
	if err != nil {
		stack.push(interpreter.intPool.getZero())
	} else {
		stack.push(interpreter.intPool.get().SetUint64(1))
	}
	if err == nil || err == errExecutionReverted {
		memory.Set(retOffset.Uint64(), retSize.Uint64(), ret)
	}
	contract.Gas += returnGas

	interpreter.intPool.put(addr, value, inOffset, inSize, retOffset, retSize)
	retu'
]

{ #category : #'as yet unclassified' }
FogVMCallcode class >> memoryUsage [
<doc>
		^ self memoryTable at: #memoryCall.
]

{ #category : #generated }
FogVMCallcode class >> mnemonic [
<doc>
		^'CALLCODE'.
	
]

{ #category : #'as yet unclassified' }
FogVMCallcode class >> returns [
<doc>
		^ true.
]

{ #category : #'as yet unclassified' }
FogVMCallcode >> readsMemory [
	^ true
]

{ #category : #'as yet unclassified' }
FogVMCallcode >> readsStorage [
	^ true
]

{ #category : #'as yet unclassified' }
FogVMCallcode >> writesMemory [
	^ true
]
