!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'N 4/11/2023 16:08:13'!
doTask: aClosureTakingAnAction shouldTakeLessThan: someMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosureTakingAnAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (someMilliseconds * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'd 4/10/2023 21:27:46'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self doTask:[customerBook addCustomerNamed:'John Lennon'.] shouldTakeLessThan: 50.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:38:31'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self doTask:[customerBook removeCustomerNamed:paulMcCartney] shouldTakeLessThan: 100.
	  
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:40:43'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
        self tryingToDo: [ customerBook addCustomerNamed: ''.]
	      willRaise: Error 
	       ifChecks: [:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]

      ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:05:35'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self tryingToDo: [ customerBook removeCustomerNamed: 'Paul McCartney']
	      willRaise: NotFound 
	       ifChecks: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 15:28:47'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verifyThat: customerBook HasThisNumberOfActiveCustomers: 0 
	ThisNumberOfSuspendedCustomers: 1 ThisNumberOfCustomer: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'N 4/11/2023 15:51:45'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verifyThat: customerBook HasThisNumberOfActiveCustomers: 0 
	ThisNumberOfSuspendedCustomers: 0 ThisNumberOfCustomer: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:08:50'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self tryingToDo: [ customerBook suspendCustomerNamed: 'George Harrison']
	      willRaise: CantSuspend 
	       ifChecks: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)]

	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:10:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self tryingToDo: [ customerBook suspendCustomerNamed: johnLennon] willRaise: CantSuspend ifChecks: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)]
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CB 4/12/2023 16:12:16'!
tryingToDo: anInvalidClosure willRaise: typeOfProhibitiveAction ifChecks: firstCondition

       [anInvalidClosure value.
	self fail ]
		on: typeOfProhibitiveAction 
		do: firstCondition ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'N 4/11/2023 16:27:44'!
verifyThat: aCustomerBook HasThisNumberOfActiveCustomers: numberOfActiveCustomers 
	ThisNumberOfSuspendedCustomers: numberOfSuspendedCustomers  
	ThisNumberOfCustomer: numberOfCustomers 
	
	
	self assert: numberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomers equals: aCustomerBook numberOfCustomers.
	

	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'CB 4/12/2023 15:11:41'!
addCustomerNamed: aName

        aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'CB 4/12/2023 16:40:10'!
numberOfCustomers
	
	^self numberOfSuspendedCustomers + self numberOfActiveCustomers 
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'CB 4/12/2023 15:05:42'!
removeCustomerNamed: aName 
 	self removeFrom: active thisCustomer: aName ifNotThereRemoveFrom: suspended  
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'CB 4/12/2023 15:04:30'!
removeFrom: aCustomerCollection thisCustomer: aName ifNotThereRemoveFrom: anOtherCustomerCollection  
      
     aCustomerCollection remove: aName ifAbsent: [anOtherCustomerCollection remove: aName ifAbsent: [^ NotFound signal]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
