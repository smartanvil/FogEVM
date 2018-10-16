Class {
	#name : #FogEVMContractsByteCodeTest,
	#superclass : #FogEVMUnitaryTest,
	#category : #'FogEVM-ByteCode-Interpreter-Tests'
}

{ #category : #test }
FogEVMContractsByteCodeTest >> testCALL [
		|  bytecode  |
		
		"should test over 
		func opCaller(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	stack.push(contract.Caller().Big())
	return n"
		bytecode := self createBytecodeForCALL.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]

{ #category : #test }
FogEVMContractsByteCodeTest >> testCREATE [
		|  bytecode  |
		
		"should test over 
		func opCreate(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	var (
		value        = stack.pop()
		offset, size = stack.pop(), stack.pop()
		input        = memory.Get(offset.Int64(), size.Int64())
		gas          = contract.Gas
	)
	if interpreter.evm.ChainConfig().IsEIP150(interpreter.evm.BlockNumber) {
		gas -= gas / 64
	}

	contract.UseGas(gas)
	res, addr, returnGas, suberr := interpreter.evm.Create(contract, input, gas, value)
	// Push item on the stack based on the returned error. If the ruleset is
	// homestead we must check for CodeStoreOutOfGasError (homestead only
	// rule) and treat as an error, if the ruleset is frontier we must
	// ignore this error and pretend the operation was successful.
	if interpreter.evm.ChainConfig().IsHomestead(interpreter.evm.BlockNumber) && suberr == ErrCodeStoreOutOfGas {
		stack.push(interpreter.intPool.getZero())
	} else if suberr != nil && suberr != ErrCodeStoreOutOfGas {
		stack.push(interpreter.intPool.getZero())
	} else {
		stack.push(addr.Big())
	}
	contract.Gas += returnGas
	interpreter.intPool.put(value, offset, size)

	if suberr == errExecutionReverted {
		return res, nil
	}
	return"
		bytecode := self createBytecodeForCREATE.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]

{ #category : #test }
FogEVMContractsByteCodeTest >> testCREATE2 [
		|  bytecode  |
		
		"should test over 
		func opCreate2(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
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
	retur"
		bytecode := self createBytecodeForCREATE2.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]

{ #category : #test }
FogEVMContractsByteCodeTest >> testDELEGATECALL [
		|  bytecode  |
		
		"should test over 
		func opDelegateCall(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	// Pop gas. The actual gas is in interpreter.evm.callGasTemp.
	interpreter.intPool.put(stack.pop())
	gas := interpreter.evm.callGasTemp
	// Pop other call parameters.
	addr, inOffset, inSize, retOffset, retSize := stack.pop(), stack.pop(), stack.pop(), stack.pop(), stack.pop()
	toAddr := common.BigToAddress(addr)
	// Get arguments from the memory.
	args := memory.Get(inOffset.Int64(), inSize.Int64())

	ret, returnGas, err := interpreter.evm.DelegateCall(contract, toAddr, args, gas)
	if err != nil {
		stack.push(interpreter.intPool.getZero())
	} else {
		stack.push(interpreter.intPool.get().SetUint64(1))
	}
	if err == nil || err == errExecutionReverted {
		memory.Set(retOffset.Uint64(), retSize.Uint64(), ret)
	}
	contract.Gas += returnGas

	interpreter.intPool.put(addr, inOffset, inSize, retOffset, retSize)
	"
		bytecode := self createBytecodeForDELEGATECALL.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]

{ #category : #test }
FogEVMContractsByteCodeTest >> testSELFDESTRUCT [
		|  bytecode  |
		
		"should test over 
		func opSuicide(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	balance := interpreter.evm.StateDB.GetBalance(contract.Address())
	interpreter.evm.StateDB.AddBalance(common.BigToAddress(stack.pop()), balance)

	interpreter.evm.StateDB.Suicide(contract.Address())
	return nil, nil
}"
		bytecode := self createBytecodeForSELFDESTRUCT.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]

{ #category : #test }
FogEVMContractsByteCodeTest >> testSTATICCALL [
		|  bytecode  |
		
		"should test over 
		func opStaticCall(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
	// Pop gas. The actual gas is in interpreter.evm.callGasTemp.
	interpreter.intPool.put(stack.pop())
	gas := interpreter.evm.callGasTemp
	// Pop other call parameters.
	addr, inOffset, inSize, retOffset, retSize := stack.pop(), stack.pop(), stack.pop(), stack.pop(), stack.pop()
	toAddr := common.BigToAddress(addr)
	// Get arguments from the memory.
	args := memory.Get(inOffset.Int64(), inSize.Int64())

	ret, returnGas, err := interpreter.evm.StaticCall(contract, toAddr, args, gas)
	if err != nil {
		stack.push(interpreter.intPool.getZero())
	} else {
		stack.push(interpreter.intPool.get().SetUint64(1))
	}
	if err == nil || err == errExecutionReverted {
		memory.Set(retOffset.Uint64(), retSize.Uint64(), ret)
	}
	contract.Gas += returnGas

	interpreter.intPool.put(addr, inOffset, inSize, retOffset, retSize)
	re"
		bytecode := self createBytecodeForSTATICCALL.
		interpreter bytecode:bytecode.
		interpreter run. 
		
		self assert: false.
		

]