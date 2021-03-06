"
Basic Abstract instruction definition 
"
Class {
	#name : #FogEVMInstruction,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #assertion }
FogEVMInstruction class >> assert: aValue equals: anExpected [
	self assert: aValue = anExpected
]

{ #category : #asserting }
FogEVMInstruction class >> assert: aString in: aCollection [
	self assert: (aCollection anySatisfy: [ :s | s = aString ])
]

{ #category : #generating }
FogEVMInstruction class >> bootstrapInstructions [
	self
		register: '0x00'
		and: 'STOP'
		and: '0'
		and: '0'
		and: 'Halts execution'.
	self
		register: '0x01'
		and: 'ADD'
		and: '2'
		and: '1'
		and: 'Addition operation'.
	self
		register: '0x02'
		and: 'MUL'
		and: '2'
		and: '1'
		and: 'Multiplication operation'.
	self
		register: '0x03'
		and: 'SUB'
		and: '2'
		and: '1'
		and: 'Subtraction operation'.
	self
		register: '0x04'
		and: 'DIV'
		and: '2'
		and: '1'
		and: 'Integer division operation'.
	self
		register: '0x05'
		and: 'SDIV'
		and: '2'
		and: '1'
		and: 'Signed integer division operation (truncated)'.
	self
		register: '0x06'
		and: 'MOD'
		and: '2'
		and: '1'
		and: 'Modulo remainder operation'.
	self
		register: '0x07'
		and: 'SMOD'
		and: '2'
		and: '1'
		and: 'Signed modulo remainder operation'.
	self
		register: '0x08'
		and: 'ADDMOD'
		and: '3'
		and: '1'
		and: 'Modulo addition operation'.
	self
		register: '0x09'
		and: 'MULMOD'
		and: '3'
		and: '1'
		and: 'Modulo multiplication operation'.
	self
		register: '0x0a'
		and: 'EXP'
		and: '2'
		and: '1'
		and: 'Exponential operation'.
	self
		register: '0x0b'
		and: 'SIGNEXTEND'
		and: '2'
		and: '1'
		and: 'Extend length of twos complement signed integer'.
	self
		register: '0x10'
		and: 'LT'
		and: '2'
		and: '1'
		and: 'Less-than comparison'.
	self
		register: '0x11'
		and: 'GT'
		and: '2'
		and: '1'
		and: 'Greater-than comparison'.
	self
		register: '0x12'
		and: 'SLT'
		and: '2'
		and: '1'
		and: 'Signed less-than comparison'.
	self
		register: '0x13'
		and: 'SGT'
		and: '2'
		and: '1'
		and: 'Signed greater-than comparison'.
	self
		register: '0x14'
		and: 'EQ'
		and: '2'
		and: '1'
		and: 'Equality comparison'.
	self
		register: '0x15'
		and: 'ISZERO'
		and: '1'
		and: '1'
		and: 'Simple not operator'.
	self
		register: '0x16'
		and: 'AND'
		and: '2'
		and: '1'
		and: 'Bitwise AND operation'.
	self
		register: '0x17'
		and: 'OR'
		and: '2'
		and: '1'
		and: 'Bitwise OR operation'.
	self
		register: '0x18'
		and: 'XOR'
		and: '2'
		and: '1'
		and: 'Bitwise XOR operation'.
	self
		register: '0x19'
		and: 'NOT'
		and: '1'
		and: '1'
		and: 'Bitwise NOT operation'.
	self
		register: '0x1a'
		and: 'BYTE'
		and: '2'
		and: '1'
		and: 'Retrieve single byte from word'.
	self
		register: '0x20'
		and: 'SHA3'
		and: '2'
		and: '1'
		and: 'Compute Keccak-256 hash'.
	self
		register: '0x30'
		and: 'ADDRESS'
		and: '0'
		and: '1'
		and: 'Get address of currently executing account'.
	self
		register: '0x31'
		and: 'BALANCE'
		and: '1'
		and: '1'
		and: 'Get balance of the given account'.
	self
		register: '0x32'
		and: 'ORIGIN'
		and: '0'
		and: '1'
		and: 'Get execution origination address'.
	self
		register: '0x33'
		and: 'CALLER'
		and: '0'
		and: '1'
		and: 'Get caller address'.
	self
		register: '0x34'
		and: 'CALLVALUE'
		and: '0'
		and: '1'
		and: 'Get deposited value by the instruction/transaction responsible for this execution'.
	self
		register: '0x35'
		and: 'CALLDATALOAD'
		and: '1'
		and: '1'
		and: 'Get input data of current environment'.
	self
		register: '0x36'
		and: 'CALLDATASIZE'
		and: '0'
		and: '1'
		and: 'Get size of input data in current environment'.
	self
		register: '0x37'
		and: 'CALLDATACOPY'
		and: '3'
		and: '0'
		and: 'Copy input data in current environment to memory'.
	self
		register: '0x38'
		and: 'CODESIZE'
		and: '0'
		and: '1'
		and: 'Get size of code running in current environment'.
	self
		register: '0x39'
		and: 'CODECOPY'
		and: '3'
		and: '0'
		and: 'Copy code running in current environment to memory'.
	self
		register: '0x3a'
		and: 'GASPRICE'
		and: '0'
		and: '1'
		and: 'Get price of gas in current environment'.
	self
		register: '0x3b'
		and: 'EXTCODESIZE'
		and: '1'
		and: '1'
		and: 'Get size of an account''s code'.
	self
		register: '0x3c'
		and: 'EXTCODECOPY'
		and: '4'
		and: '0'
		and: 'Copy an account''s code to memory'.
	self
		register: '0x40'
		and: 'BLOCKHASH'
		and: '1'
		and: '1'
		and: 'Get the hash of one of the 256 most recent complete blocks'.
	self
		register: '0x41'
		and: 'COINBASE'
		and: '0'
		and: '1'
		and: 'Get the block''s beneficiary address'.
	self
		register: '0x42'
		and: 'TIMESTAMP'
		and: '0'
		and: '1'
		and: 'Get the block''s timestamp'.
	self
		register: '0x43'
		and: 'NUMBER'
		and: '0'
		and: '1'
		and: 'Get the block''s number'.
	self
		register: '0x44'
		and: 'DIFFICULTY'
		and: '0'
		and: '1'
		and: 'Get the block''s difficulty'.
	self
		register: '0x45'
		and: 'GASLIMIT'
		and: '0'
		and: '1'
		and: 'Get the block''s gas limit'.
	self
		register: '0x50'
		and: 'POP'
		and: '1'
		and: '0'
		and: 'Remove item from stack'.
	self
		register: '0x51'
		and: 'MLOAD'
		and: '1'
		and: '1'
		and: 'Load word from memory'.
	self
		register: '0x52'
		and: 'MSTORE'
		and: '2'
		and: '0'
		and: 'Save word to memory'.
	self
		register: '0x53'
		and: 'MSTORE8'
		and: '2'
		and: '0'
		and: 'Save byte to memory'.
	self
		register: '0x54'
		and: 'SLOAD'
		and: '1'
		and: '1'
		and: 'Load word from storage'.
	self
		register: '0x55'
		and: 'SSTORE'
		and: '2'
		and: '0'
		and: 'Save word to storage'.
	self
		register: '0x56'
		and: 'JUMP'
		and: '1'
		and: '0'
		and: 'Alter the program counter'.
	self
		register: '0x57'
		and: 'JUMPI'
		and: '2'
		and: '0'
		and: 'Conditionally alter the program counter'.
	self
		register: '0x58'
		and: 'PC'
		and: '0'
		and: '1'
		and: 'Get the value of the program counter prior to the increment '.
	self
		register: '0x59'
		and: 'MSIZE'
		and: '0'
		and: '1'
		and: 'Get the size of active memory in bytes'.
	self
		register: '0x5a'
		and: 'GAS'
		and: '0'
		and: '1'
		and: 'Get the amount of available gas, including the corresponding reduction '.
	self
		register: '0x5b'
		and: 'JUMPDEST'
		and: '0'
		and: '0'
		and: 'Mark a valid destination for jumps'.
	self
		register: '0x60'
		and: 'PUSH1'
		and: '0'
		and: '1'
		and: 'Place 1 byte item on stack'.
	self
		register: '0x61'
		and: 'PUSH2'
		and: '0'
		and: '1'
		and: 'Place 2-byte item on stack'.
	self
		register: '0x7f'
		and: 'PUSH32'
		and: '0'
		and: '1'
		and: 'Place 32-byte (full word) item on stack'.
	self
		register: '0x80'
		and: 'DUP1'
		and: '1'
		and: '2'
		and: 'Duplicate 1st stack item'.
	self
		register: '0x81'
		and: 'DUP2'
		and: '2'
		and: '3'
		and: 'Duplicate 2nd stack item'.
	self
		register: '0x8f'
		and: 'DUP16'
		and: '16'
		and: '17'
		and: 'Duplicate 16th stack item'.
	self
		register: '0x90'
		and: 'SWAP1'
		and: '2'
		and: '2'
		and: 'Exchange 1st and 2nd stack items'.
	self
		register: '0x91'
		and: 'SWAP2'
		and: '3'
		and: '3'
		and: 'Exchange 1st and 3rd stack items'.
	self
		register: '0x9f'
		and: 'SWAP16'
		and: '17'
		and: '17'
		and: 'Exchange 1st and 17th stack items'.
	self
		register: '0xa0'
		and: 'LOG0'
		and: '2'
		and: '0'
		and: 'Append log record with no topics'.
	self
		register: '0xa1'
		and: 'LOG1'
		and: '3'
		and: '0'
		and: 'Append log record with one topic'.
	self
		register: '0xa4'
		and: 'LOG4'
		and: '6'
		and: '0'
		and: 'Append log record with four topics'.
	self
		register: '0xf0'
		and: 'CREATE'
		and: '3'
		and: '1'
		and: 'Create a new account with associated code'.
	self
		register: '0xf1'
		and: 'CALL'
		and: '7'
		and: '1'
		and: 'Message-call into an account'.
	self
		register: '0xf2'
		and: 'CALLCODE'
		and: '7'
		and: '1'
		and: 'Message-call into this account with an alternative account''s code'.
	self
		register: '0xf3'
		and: 'RETURN'
		and: '2'
		and: '0'
		and: 'Halt execution returning output data'.
	self
		register: '0xf4'
		and: 'DELEGATECALL'
		and: '6'
		and: '1'
		and:
			'Message-call into this account with an alternative account''s code, but persisting the current values for it sender and it value'.
	self
		register: '0xfe'
		and: 'INVALID'
		and: 0
		and: 0
		and: 'Designated invalid instruction'.
	self
		register: '0xff'
		and: 'SELFDESTRUCT'
		and: '1'
		and: '0'
		and: 'Halt execution and register account for later deletion'.
	self
		register: (FogVMByte byteCode read0xHexadecimal + 1) write0xHexadecimal
		and: 'SHL'
		and: 2
		and: 1
		and: 'Shift val left by shift bits, filling with zero bits'.
	self
		register: (FogVMByte byteCode read0xHexadecimal + 2) write0xHexadecimal
		and: 'SHR'
		and: 2
		and: 1
		and: 'Shift val right by shift bits, filling with zero bits.'.
	self
		register: (FogVMByte byteCode read0xHexadecimal + 3) write0xHexadecimal
		and: 'SAR'
		and: 2
		and: 1
		and:
			'The SAR instruction (arithmetic shift right) pops 2 values from the stack, first arg1 and then arg2 '.
	self
		register: (FogVMDelegatecall byteCode read0xHexadecimal + 1) write0xHexadecimal
		and: 'CREATE2'
		and: 4
		and: 1
		and: ' New create routine '.
	self
		register: (FogVMDelegatecall byteCode read0xHexadecimal + 2) write0xHexadecimal
		and: 'STATICCALL'
		and: 6
		and: 1
		and: ' Documentation shows nothuing about this'.
	self
		register: (FogVMExtcodecopy byteCode read0xHexadecimal + 3) write0xHexadecimal
		and: 'EXTCODEHASH'
		and: 1
		and: 1
		and: ' opExtCodeHash returns the code hash of a specified account.'.
	self
		register: (FogVMExtcodecopy byteCode read0xHexadecimal + 1) write0xHexadecimal
		and: 'RETURNDATASIZE'
		and: 0
		and: 1
		and: ' Documentation says nothing about'.
	self
		register: (FogVMExtcodecopy byteCode read0xHexadecimal + 2) write0xHexadecimal
		and: 'RETURNDATACOPY'
		and: 3
		and: 0
		and: ' Documentation says nothing about'
]

{ #category : #accessing }
FogEVMInstruction class >> byteCodeNumber [
	^ self byteCode ifNil: [ -1 ] ifNotNil: [ :code | code read0xHexadecimal ]
]

{ #category : #'matching with go vm - crawling pandora box' }
FogEVMInstruction class >> checkUnImplementedBytecodes [
	| stream codes |
	stream := 'opcodes.go' asFileReference readStream.
	stream upToAll: 'var stringToOp = map[string]OpCode{'.
	codes := Set new.
	[ stream atEnd ]
		whileFalse: [ codes
				add:
					(stream
						upTo: $:;
						upTo: $,) trimBoth ].
	^ codes
		reject: [ :c | c isEmpty or: [ Smalltalk globals includesKey: ('FogVM{1}' format: {c asLowercase capitalized}) asSymbol ] ]
]

{ #category : #generating }
FogEVMInstruction class >> codeOpClassMethod: anAmount [
	^ 'byteCode
		^''{1}''.
	' format: {anAmount}
]

{ #category : #generating }
FogEVMInstruction class >> createSubclassFor: aMnemoic [
	^ FogEVMInstruction
		subclass: ('FogVM' , aMnemoic asLowercase capitalized) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'FogEVMByteCode'
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> execute: aString [
	| content |
	content := aString trimBoth.
	content := content copyReplaceAll: '(' with: ''.
	content := content copyReplaceAll: ')' with: ''.
	content := content readStream upTo: $,.

	self
		assert: content asLowercase
		in:
			{('op' , self mnemonicForCrawl asLowercase).
			('make' , self mnemonicForCrawl asLowercase)}
]

{ #category : #generated }
FogEVMInstruction class >> expectedPops [
	self shouldBeImplemented.
]

{ #category : #generated }
FogEVMInstruction class >> expectedPushes [
	self shouldBeImplemented.
]

{ #category : #'matching with go vm - crawling pandora box' }
FogEVMInstruction class >> fetchGoCode [
	| stream lowcaseStream selector bytes goCode |
	stream := 'instructions.go' asFileReference readStream.
	lowcaseStream := stream contents asLowercase readStream.
	selector := 'func op' , self mnemonic asLowercase.
	lowcaseStream upToAll: selector.
	stream position: lowcaseStream position - selector size.
	bytes := (lowcaseStream upToAll: 'func') size.
	goCode := stream next: bytes.
	self class
		compile:
			('goCode
	^ ''{1}''' format: {goCode})
		classified: #generated
]

{ #category : #'matching with go vm - crawling pandora box' }
FogEVMInstruction class >> fetchGoInstructionConf [
	| stream selector confstream setter |
	self allSubclasses ifNotEmpty: [ ^ self ].
	stream := 'jump_table.go' asFileReference readStream.
	selector := 'instructionSet[' , self mnemonic , ']'.
	stream upToAll: selector.
	stream atEnd
		ifTrue: [ stream position: 1.
			stream upToAll: (',
		',self mnemonic , ':') ].
	stream upTo: ${.
	confstream := (stream upTo: $}) contents readStream.
	[ confstream atEnd ]
		whileFalse: [ setter := ((confstream upTo: $:) trimBoth , ':') asSymbol.
			setter = #':'
				ifTrue: [ ^ self ].
			self perform: setter with: (confstream upTo: Character lf) ]
]

{ #category : #accessing }
FogEVMInstruction class >> gas [ 	
	self subclassResponsibility 
]

{ #category : #'matching with go vm - crawling pandora box' }
FogEVMInstruction class >> gasCost: aString [
	| stream gasTag |
	stream := aString trimBoth readStream.
	stream upTo: $(.
	gasTag := stream atEnd
		ifTrue: [ stream position: 0.
			stream upTo: $, ]
		ifFalse: [ stream peek isDigit
				ifTrue: [ stream position: 0.
					stream upTo: $( ]
				ifFalse: [ stream upTo: $) ] ].
	^ self class
		compile:
			('gas
		^ self gasTable at: #{1}.
' format: {gasTag})
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> halts [
	^ false
]

{ #category : #accessing }
FogEVMInstruction class >> instance [
	^ instance ifNil: [ instance  := self new  ]
]

{ #category : #testing }
FogEVMInstruction class >> jumps [
	^ false 
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> jumps: aString [ 
	| stream boolean |
	stream := aString trimBoth readStream.
	stream upTo: $(.
	boolean := stream atEnd
		ifTrue: [ stream position: 0.
			stream upTo: $, ]
		ifFalse: [ stream upTo: $) ].
	^ self class
		compile:
			('jumps
		^ {1}.
' format: {boolean})
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> memorySize: aString [
	| stream memoryTag |
	stream := aString trimBoth readStream.
	stream upTo: $(.
	memoryTag := stream atEnd
		ifTrue: [ stream position: 0.
			stream upTo: $, ]
		ifFalse: [ stream upTo: $) ].
	^ self class 
		compile:
			('memoryUsage
		^ self memoryTable at: #{1}.
' format: {memoryTag})
]

{ #category : #accessing }
FogEVMInstruction class >> memoryUsage [
	^ 0
]

{ #category : #generating }
FogEVMInstruction class >> mnemonicClassMethod: anAmount [
	^ 'mnemonic
		^''{1}''.
	' format: {anAmount}
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> mnemonicForCrawl [
	^ self mnemonic 
]

{ #category : #generating }
FogEVMInstruction class >> register: aCodeOp and: aMnemoic and: stackPops and: stackPushes and: aDescription [
	| class |
	class := self createSubclassFor: aMnemoic.
	class comment: aDescription.
	{(self stackPushesClassMethod: stackPushes).
	(self stackPopsClassMethod: stackPops).
	(self codeOpClassMethod: aCodeOp).
	(self mnemonicClassMethod: aMnemoic)} do: [ :m | class class compile: m classified: 'generated' ]
]

{ #category : #testing }
FogEVMInstruction class >> returns [
	^ false 
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> returns: aString [
	| stream boolean |
	stream := aString trimBoth readStream.
	stream upTo: $(.
	boolean := stream atEnd
		ifTrue: [ stream position: 0.
			stream upTo: $, ]
		ifFalse: [ stream upTo: $) ].
	^ self class
		compile:
			('returns
		^ {1}.
' format: {boolean})
]

{ #category : #testing }
FogEVMInstruction class >> reverts [
	^ false 
]

{ #category : #generating }
FogEVMInstruction class >> stackPopsClassMethod: anAmount [
	^ 'expectedPops
		^{1}.
	' format: {anAmount}
]

{ #category : #generating }
FogEVMInstruction class >> stackPushesClassMethod: anAmount [
	^ 'expectedPushes
		^{1}.
	' format: {anAmount}
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> valid: aString [
	self assert: (aString trimBoth beginsWith: 'true')
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> validateStack: aString [
	| stream |
	stream := aString readStream.
	stream upTo: $(.
	self assert: self expectedPops equals: (stream upTo: $,) trimBoth asNumber.
	self assert: self expectedPushes equals: (stream upTo: $)) trimBoth asNumber
]

{ #category : #'go configuration - crawling pandora box' }
FogEVMInstruction class >> writes: aString [
	| stream boolean |
	stream := aString trimBoth readStream.
	stream upTo: $(.
	boolean := stream atEnd
		ifTrue: [ stream position: 0.
			stream upTo: $, ]
		ifFalse: [ stream upTo: $) ].
	^ self class
		compile:
			('writes
		^ {1}.
' format: {boolean})
]

{ #category : #generated }
FogEVMInstruction >> accept: anInterpreter [
	| perform stackSize localMnemonic |
	localMnemonic := self mnemonic.
	(self mnemonic beginsWith: 'PUSH')
		ifTrue: [ localMnemonic := 'PUSH' ].
	(self mnemonic beginsWith: 'DUP')
		ifTrue: [ localMnemonic := 'DUP' ].
	(self mnemonic beginsWith: 'SWAP')
		ifTrue: [ localMnemonic := 'SWAP' ].
	(self mnemonic beginsWith: 'LOG')
		ifTrue: [ localMnemonic := 'LOG' ].
	perform := ('visit' , localMnemonic asLowercase capitalized , ':') asSymbol.

	anInterpreter perform: perform withArguments: {self}
]

{ #category : #generated }
FogEVMInstruction >> accept: anInterpreter loadedAt: byteNumber of: anExecutableMemoryReificaiton [
	| perform stackSize localMnemonic result |
	localMnemonic := self mnemonic.
	(self mnemonic beginsWith: 'PUSH')
		ifTrue: [ localMnemonic := 'PUSH' ].
	(self mnemonic beginsWith: 'DUP')
		ifTrue: [ localMnemonic := 'DUP' ].
	(self mnemonic beginsWith: 'SWAP')
		ifTrue: [ localMnemonic := 'SWAP' ].
	(self mnemonic beginsWith: 'LOG')
		ifTrue: [ localMnemonic := 'LOG' ].
	perform := ('visit' , localMnemonic asLowercase capitalized , ':') asSymbol.
	stackSize := anInterpreter stackSize.
	"self manageBreakpointFor: anExecutableMemoryReificaiton atMethod: anInterpreter class >> perform."
	anInterpreter currentMemory: anExecutableMemoryReificaiton.
	result := anInterpreter perform: perform withArguments: {self}.
	anExecutableMemoryReificaiton releaseCurrentMemory.
	self
		assert: anInterpreter stackSize = (stackSize - (self expectedPops - self expectedPushes)).
	
	^ result
]

{ #category : #accessing }
FogEVMInstruction >> binaryBytecode [
	| code | 
	code := self byteCode read0xHexadecimal asByteArray.
	self assert: code size= 1 .
	^ code first
]

{ #category : #generated }
FogEVMInstruction >> byteCode [
	^ self class byteCode
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> expectedPops [
	^ self class expectedPops
]

{ #category : #generated }
FogEVMInstruction >> expectedPushes [
	^ self class expectedPushes
]

{ #category : #testing }
FogEVMInstruction >> isConditionalJump [ 
	^ false
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> isCopyCode [
	^ false 
]

{ #category : #testing }
FogEVMInstruction >> isFinishStatus [
	^ false 
]

{ #category : #generated }
FogEVMInstruction >> isPush [
	^ false
]

{ #category : #generated }
FogEVMInstruction >> isStrictJump [
	^ false 
]

{ #category : #testing }
FogEVMInstruction >> isValidJumpDestination [
	^ false
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> loadParametersFrom: aStream [
	
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> loadParametersFromByteArray: aByteStream [
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> manageBreakpointFor: aMemoryEntry atMethod: aMethod [
	aMemoryEntry shouldBreak
		ifTrue: [ Breakpoint new
				node: aMethod ast;
				once;
				install ]
]

{ #category : #generated }
FogEVMInstruction >> mnemonic [
	^ self class mnemonic
]

{ #category : #printing }
FogEVMInstruction >> printBinaryOn: aStream [

	aStream nextPut: self binaryBytecode
]

{ #category : #printing }
FogEVMInstruction >> printHexaOn: aStream [
	| value |
	value := self binaryBytecode hex copyReplaceAll: '16r' with: ''.
	value size = 1
		ifTrue: [ value := '0' , value ].
	self assert: value size = 2.
	aStream nextPutAll: value
]

{ #category : #printing }
FogEVMInstruction >> printOn: aStream [
	aStream
		nextPutAll: self mnemonic; nextPut:$( ;nextPutAll: self printableByteCode ; nextPut:$)
]

{ #category : #generated }
FogEVMInstruction >> printableByteCode [
	^ self byteCode copyReplaceAll: '0x' with: ''
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> readsMemory [
	^ false
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> readsStorage [
	^ false
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> size [
	^ 1 " So far the byte code is 0~256"
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> writesMemory [
	^ false
]

{ #category : #'as yet unclassified' }
FogEVMInstruction >> writesStorage [
	^ false
]
