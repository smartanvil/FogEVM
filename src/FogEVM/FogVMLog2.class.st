"
Append log record with 2 topic
"
Class {
	#name : #FogVMLog2,
	#superclass : #FogVMLog,
	#category : #'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMLog2 class >> byteCode [
<doc>
	^ '0xa2'
]

{ #category : #'as yet unclassified' }
FogVMLog2 class >> expectedPops [
<doc>
	^ 4
]

{ #category : #'as yet unclassified' }
FogVMLog2 class >> expectedPushes [
<doc>
	^ 0
]

{ #category : #'as yet unclassified' }
FogVMLog2 class >> gas [
<doc>
		^ self gasTable at: #makeGasLog.
]

{ #category : #generated }
FogVMLog2 class >> goCode [
<doc>
	^ 'func makeLog(size int) executionFunc {
	return func(pc *uint64, interpreter *EVMInterpreter, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
		topics := make([]common.Hash, size)
		mStart, mSize := stack.pop(), stack.pop()
		for i := 0; i < size; i++ {
			topics[i] = common.BigToHash(stack.pop())
		}

		d := memory.Get(mStart.Int64(), mSize.Int64())
		interpreter.evm.StateDB.AddLog(&types.Log{
			Address: contract.Address(),
			Topics:  topics,
			Data:    d,
			// This is a non-consensus field, but assigned here because
			// core/state doesnt know the current block number.
			BlockNumber: interpreter.evm.BlockNumber.Uint64(),
		})

		interpreter.intPool.put(mStart, mSize)
		return nil, nil
	}
}

// ma'
]

{ #category : #'as yet unclassified' }
FogVMLog2 class >> memoryUsage [
<doc>
		^ self memoryTable at: #memoryLog.
]

{ #category : #accessing }
FogVMLog2 class >> mnemonic [
<doc>
	^ 'LOG2'
]

{ #category : #'as yet unclassified' }
FogVMLog2 class >> writes [
<doc>
		^ true.
]
