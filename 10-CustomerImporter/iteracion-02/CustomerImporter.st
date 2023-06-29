!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 11:31:10'!
test01AccurateImportOfValidData

	CustomerImporter valueFrom: self validImportData into: session..

	self assertImportedRightNumberOfCustomers.
	self assertPepeSanchezWasImportedCorrecty.
	self assertJuanPerezWasImportedCorrectly ! !

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 11:37:50'!
test02InabilityToImportAddressWithoutCustomer

	|adressWithNoCustomer|

	adressWithNoCustomer := ReadStream on: 'A,Corrientes,1234,Lanus,0000,BsAs'.
	
	self 
		should: [ CustomerImporter valueFrom: adressWithNoCustomer into: session. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: CustomerImporter cannotImportAddressWithoutCustomerErrorDescription
		! !

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 12:18:01'!
test03InabilityToImportCustomerWithWrongDescription

	|wrongCustomerInputData|

	wrongCustomerInputData := ReadStream on: 'CX,Pepe,Sanchez,D,22333444'.
	
	self 
		should: [ CustomerImporter valueFrom: wrongCustomerInputData into: session. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: CustomerImporter wrongCustomerInputDataErrorDescription
		! !

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 12:20:14'!
test04InabilityToImportCustomerAdressWithWrongDescription

	|wrongCustomerAdressInputData|

	wrongCustomerAdressInputData := ReadStream on: 'C,Pepe,Sanchez,D,22333444
AC,San Martin,3322,Olivos,1636,BsAs'.
	
	self 
		should: [ CustomerImporter valueFrom: wrongCustomerAdressInputData into: session. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: CustomerImporter wrongCustomerAdressInputDataErrorDescription.
		! !

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 12:22:54'!
test05CannotImportEmptyString

	|emptyString|

	emptyString := ReadStream on: ''.
	
	self 
		should: [ CustomerImporter valueFrom: emptyString into: session. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: CustomerImporter cannotImportEmptyString.
		! !

!ImportTest methodsFor: 'tests' stamp: 'N 6/29/2023 12:39:42'!
test06CustomerMustHaveFiveItemsAndAdressSix

	|customerWithMoreThanFiveItemsAndAdressMoreThanSix|

	customerWithMoreThanFiveItemsAndAdressMoreThanSix := ReadStream on:
'C,Pepe,Sanchez,D,22333444,2
A,San Martin,3322,Olivos,1636,BsAs,Arg'.
	
	self 
		should: [ CustomerImporter valueFrom: customerWithMoreThanFiveItemsAndAdressMoreThanSix into: session. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: CustomerImporter invalidDataErrorDescription.
		! !


!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:22:05'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:27:57'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:12:18'!
assertImportedRightNumberOfCustomers

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:45'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:05'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:27:50'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:28:23'!
tearDown

	session commit.
	session close.
	! !


!ImportTest methodsFor: 'customer' stamp: 'HAW 5/22/2022 18:14:22'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !


!ImportTest methodsFor: 'test data' stamp: 'HAW 5/22/2022 18:08:08'!
validImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 17:55:46'!
isAt: aStreetName

	^streetName = aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 17:55:17'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !


!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session readStream newCustomer2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'N 6/29/2023 13:34:46'!
importAdressFrom: data for: newCustomer 
|newAddress|
	newAddress := Address new.
	newCustomer addAddress: newAddress.
	newAddress streetName: data second.
	newAddress streetNumber: data third asNumber .
	newAddress town: data fourth.
	newAddress zipCode: data fifth asNumber .
	newAddress province: data sixth.
	^newAddress ! !

!CustomerImporter methodsFor: 'initialization' stamp: 'HAW 5/22/2022 18:06:47'!
initializeFrom: aReadStream into: aSession
	session := aSession.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:20:07'!
assertAdressDataDescriptionIsCorrect: data

	^ (data first = 'A') ifFalse: [ self error: self class wrongCustomerAdressInputDataErrorDescription]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:20:34'!
assertAdressDataHasSixElements: data

	^ (data size = 6) ifFalse: [self error: self class invalidDataErrorDescription.]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 12:46:44'!
assertCustomerDataDescriptionIsCorrect: customerData

	^ (customerData first = 'C') ifFalse: [ self error: self class wrongCustomerInputDataErrorDescription]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 12:46:15'!
assertCustomerDataHasFiveElements: customerData

	^ (customerData size = 5) ifFalse: [self error: self class invalidDataErrorDescription.]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 12:49:48'!
assertCustomerIsImported: newCustomer

	^ newCustomer ifNil: [ self error: self class cannotImportAddressWithoutCustomerErrorDescription ]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:22:00'!
assertDataIsNotEmpty: line

	^ (line isNil) ifTrue:[self error: self class cannotImportEmptyString ]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:32:55'!
assertValidAddresDataFrom: newCustomer with: data

	self assertCustomerIsImported: newCustomer.
			self assertAdressDataDescriptionIsCorrect: data.
			self assertAdressDataHasSixElements: data! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:32:26'!
assertValidCustomerData: data

	self assertCustomerDataHasFiveElements: data.
			self assertCustomerDataDescriptionIsCorrect: data! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:29:55'!
importCustomerFrom: data into: aSession 

|newCustomer|

	newCustomer := Customer new.
	newCustomer firstName: data second.
	newCustomer lastName: data third.
	newCustomer identificationType: data fourth.
	newCustomer identificationNumber: data fifth.
	session persist: newCustomer.
	
	^newCustomer! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:40:32'!
importDataFrom: data into: aSession for: newCustomer 
	self shouldBeImplemented.! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:48:59'!
importFrom: data

	self recordCustomerFrom: data.
		
	self recordAddressFrom: data! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:19:34'!
isAdress: line

	^ line first beginsWith: 'A'! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:19:37'!
isCustomer: line

	^ line first beginsWith: 'C'! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 12:44:24'!
readRow: line

	^ line findTokens: $,! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:48:59'!
recordAddressFrom: data

	^ (self isAdress: data) ifTrue: [ 
			self assertValidAddresDataFrom: newCustomer2 with: data.
			self importAdressFrom: data for: newCustomer2]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:48:48'!
recordCustomerFrom: data

	^ (self isCustomer: data) ifTrue: [ 
			self assertValidCustomerData: data.
			newCustomer2 := self importCustomerFrom: data into: session]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'N 6/29/2023 13:47:58'!
value

	"
	self importCustomers
	"
	|  line|


	line := readStream nextLine.
	self assertDataIsNotEmpty: line.
	
	[ line notNil ] whileTrue: [|data |
		
		data := self readRow: line.
		self importFrom: data.
		line := readStream nextLine. ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 18:06:47'!
from: aReadStream into: aSession
	^self new initializeFrom: aReadStream into: aSession! !


!CustomerImporter class methodsFor: 'importing' stamp: 'HAW 5/22/2022 18:11:27'!
valueFrom: aReadStream into: aSession

	^(self from: aReadStream into: aSession) value! !


!CustomerImporter class methodsFor: 'error description' stamp: 'N 6/29/2023 11:44:31'!
cannotImportAddressWithoutCustomerErrorDescription
	^'cannot import adress with no customer'! !

!CustomerImporter class methodsFor: 'error description' stamp: 'N 6/29/2023 12:24:58'!
cannotImportEmptyString
	^'empty string'! !

!CustomerImporter class methodsFor: 'error description' stamp: 'N 6/29/2023 12:40:01'!
invalidDataErrorDescription
	^'invalid Data'! !

!CustomerImporter class methodsFor: 'error description' stamp: 'N 6/29/2023 12:18:35'!
wrongCustomerAdressInputDataErrorDescription
	^'wrong adress description'! !

!CustomerImporter class methodsFor: 'error description' stamp: 'N 6/29/2023 12:06:33'!
wrongCustomerInputDataErrorDescription
	^'invalid customer found'! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 00:19:29'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 19:17:36'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'HAW 5/22/2022 00:19:29'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 19:29:06'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'HAW 5/22/2022 00:19:29'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'HAW 5/22/2022 00:19:29'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
