!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:25:31'!
test01NewCartsAreCreatedEmpty

	self assert: ObjectForTest emptyCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:26:26'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	self 
		should: [ cart add: 'otherBook' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:26:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	cart add: 'firstBook'.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:27:14'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	self 
		should: [cart add: 0 of: 'firstBook' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:27:41'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	self 
		should: [cart add: 2 of: 'otherBook'  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:28:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	cart add: 'firstBook'.
	self assert: (cart includes: 'firstBook')! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:28:53'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	self deny: (cart includes: 'firstBook')! !

!CartTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:29:27'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := ObjectForTest emptyCart.
	
	cart add: 2 of: 'firstBook'.
	self assert: (cart occurrencesOf: 'firstBook') = 2! !



!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:49:58'!
test01CanNotCheckOutAnEmptyCart
        |anEmptyCart |
         anEmptyCart := ObjectForTest createCart.
         self 
		should: [ Cashier checkOut: anEmptyCart charging: ObjectForTest aValidCreditCard on: GregorianMonthOfYear current]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCartToCheckOut.]! !

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:11'!
test02CheckOutACartWithOneItemShouldReturnItemsPrice
        |aCart |
         aCart := ObjectForTest aCartWithOneItem.
         self assert: 'debit has been done' equals: (Cashier checkOut: aCart charging: ObjectForTest aValidCreditCard  on: GregorianMonthOfYear current).
	
		
		! !

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:18'!
test03CheckOutACartWithMoreThanOneItemShouldReturnTotalPrice
        |aCart |
         aCart := ObjectForTest aCartWithMoreThanOneItem.
         self assert: 'debit has been done' equals: (Cashier checkOut: aCart charging: ObjectForTest aValidCreditCard on: GregorianMonthOfYear current).
	
		
		! !

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:26'!
test04CanNotCheckOutACartChargingACardWithAnInvalidName
        |aCart |
         aCart := ObjectForTest aCartWithMoreThanOneItem. 
         self 
		should: [ Cashier checkOut: aCart charging: ObjectForTest anInvalidNameCreditCard on: GregorianMonthOfYear current]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCardToCheckOut.]
	
		
		! !

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:33'!
test05CanNotCheckOutACartChargingACardWithAnInvalidDigits
        |aCart |
         aCart := ObjectForTest aCartWithMoreThanOneItem.
         self 
		should: [ Cashier checkOut: aCart charging: ObjectForTest anInvalidDigitsCreditCard on: GregorianMonthOfYear current]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCardToCheckOut.]
	
		
		! !

!CashierTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:39'!
test06CanNotCheckOutACartChargingAnExpiredCard
        |aCart |
         aCart := ObjectForTest aCartWithMoreThanOneItem.
         self 
		should: [ Cashier checkOut: aCart charging: ObjectForTest anExpiredCreditCard on: GregorianMonthOfYear current]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCardToCheckOut.]
	
		
		! !


!classDefinition: #SimulatorMerchantProcessorTest category: 'TusLibros'!
TestCase subclass: #SimulatorMerchantProcessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SimulatorMerchantProcessorTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:44'!
test01CanNotCheckOutACartChargingACardWithNoMoney
        |aCart |
         aCart := ObjectForTest aCartWithOneItem.
         self 
		should: [ Cashier checkOut: aCart charging: ObjectForTest aValidCreditCardWithNoMoney on: GregorianMonthOfYear current ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SimulatorMerchantProcessor cardWithNoMoney.]! !

!SimulatorMerchantProcessorTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:50'!
test02CanNotCheckOutACartChargingAStolenCard
        |aCart |
         aCart := ObjectForTest aCartWithOneItem.
         self 
		should: [ Cashier checkOut: aCart charging: ObjectForTest aValidStolenCreditCard on: GregorianMonthOfYear current]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SimulatorMerchantProcessor stolenCardErrorDescription.]! !

!SimulatorMerchantProcessorTest methodsFor: 'tests' stamp: 'cb 6/11/2023 20:50:54'!
test03CheckOutACartChargingAValidCreditCard
        |aCart |
         aCart := ObjectForTest aCartWithOneItem.
         self assert: 'debit has been done' equals: (Cashier checkOut: aCart charging: ObjectForTest aValidCreditCard on: GregorianMonthOfYear current).
		! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'cb 6/11/2023 19:41:52'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'cb 6/11/2023 20:37:25'!
totalPriceFor: aCashier
        ^items sum: [:anItem | catalog at: anItem] .! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'validation' stamp: 'cb 6/11/2023 20:51:19'!
isValidCreditCard: aCreditCard comparing: aDate
       ^((self isValidDigits: aCreditCard) and: (self isValidName: aCreditCard)) and: (self isValidDate: aCreditCard comparing: aDate) ! !

!Cashier class methodsFor: 'validation' stamp: 'cb 6/11/2023 20:47:15'!
isValidDate: aCreditCard comparing: aDate
       ^aDate < (aCreditCard expiredDate)! !

!Cashier class methodsFor: 'validation' stamp: 'cb 6/9/2023 18:47:30'!
isValidDigits: aCreditCard
        ^(aCreditCard digits size) = 16! !

!Cashier class methodsFor: 'validation' stamp: 'cb 6/9/2023 18:52:42'!
isValidName: aCreditCard
       ^aCreditCard name isEmpty not! !


!Cashier class methodsFor: 'errors' stamp: 'cb 6/9/2023 17:55:58'!
invalidCardToCheckOut
      ^'invalid card'
	! !

!Cashier class methodsFor: 'errors' stamp: 'cb 6/8/2023 20:00:02'!
invalidCartToCheckOut
     ^'The cart is empty'! !


!Cashier class methodsFor: 'operation' stamp: 'cb 6/11/2023 20:13:08'!
chargeHasBeenDoneCorrectly
     ^'debit has been done'
       
	! !

!Cashier class methodsFor: 'operation' stamp: 'cb 6/11/2023 20:49:02'!
checkOut: aCart charging: aCreditCard on: aDate
        aCart isEmpty ifTrue: [^self error: self invalidCartToCheckOut].
        (self isValidCreditCard: aCreditCard comparing: aDate) ifFalse: [^self error: self invalidCardToCheckOut]. 
         ^SimulatorMerchantProcessor debit: (aCart totalPriceFor: self) from: aCreditCard cameFrom: self
       
	! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'name expiredDate digits'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'cb 6/9/2023 17:54:40'!
initializeCreateCardFor: aName expired: anExpiredDate withDigits: creditCardDigits
       name := aName.
       expiredDate := anExpiredDate.
       digits := creditCardDigits! !


!CreditCard methodsFor: 'accesing' stamp: 'cb 6/9/2023 18:06:22'!
digits 
      ^digits copy! !

!CreditCard methodsFor: 'accesing' stamp: 'cb 6/11/2023 19:14:08'!
expiredDate
      ^expiredDate copy! !

!CreditCard methodsFor: 'accesing' stamp: 'cb 6/9/2023 17:58:19'!
name
       ^name copy! !


!CreditCard methodsFor: 'comparing' stamp: 'cb 6/11/2023 19:55:35'!
= anOtherCreditCard
    ^((name = anOtherCreditCard name) and: (digits = anOtherCreditCard digits)) and: (expiredDate = anOtherCreditCard expiredDate)
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'cb 6/9/2023 17:53:40'!
createCardFor: aName expired: anExpiredDate withDigits: creditCardDigits
    ^self new initializeCreateCardFor: aName expired: anExpiredDate withDigits: creditCardDigits! !


!classDefinition: #ObjectForTest category: 'TusLibros'!
Object subclass: #ObjectForTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObjectForTest class' category: 'TusLibros'!
ObjectForTest class
	instanceVariableNames: ''!

!ObjectForTest class methodsFor: 'cart' stamp: 'cb 6/9/2023 19:02:57'!
aCartWithMoreThanOneItem
       |aCart|
        aCart := self createCart.
        aCart add: 'firstBook'.
         aCart add: 'firstBook'.
         aCart add: 'secondBook'.
       ^aCart! !

!ObjectForTest class methodsFor: 'cart' stamp: 'cb 6/9/2023 19:03:16'!
aCartWithOneItem
       |aCart|
        aCart := self createCart.
        aCart add: 'firstBook'.
       ^aCart! !

!ObjectForTest class methodsFor: 'cart' stamp: 'cb 6/9/2023 19:02:28'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!ObjectForTest class methodsFor: 'cart' stamp: 'cb 6/9/2023 19:01:14'!
defaultPriceList
        |priceList|
	priceList := Dictionary new.
	^priceList add: 'firstBook' -> 345; add: 'secondBook' -> 100; add: 'thirdBook' -> 32; yourself! !

!ObjectForTest class methodsFor: 'cart' stamp: 'cb 6/11/2023 20:25:45'!
emptyCart
	
	^self createCart! !


!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:56:47'!
aValidCreditCard
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current nextLeapYear).
         ^CreditCard createCardFor: 'noe' expired: anExpiredDate withDigits: '1111111111111111'.! !

!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:56:56'!
aValidCreditCardWithNoMoney
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current nextLeapYear).
         ^CreditCard createCardFor: 'noe' expired: anExpiredDate withDigits: '1112111111111111'.! !

!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:57:05'!
aValidStolenCreditCard
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current nextLeapYear).
         ^CreditCard createCardFor: 'noe' expired: anExpiredDate withDigits: '1113111111111111'.! !

!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:57:56'!
anExpiredCreditCard
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current previousLeapYear ).
         ^CreditCard createCardFor: 'noe' expired: anExpiredDate withDigits: '1111111111111111'! !

!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:58:13'!
anInvalidDigitsCreditCard
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current nextLeapYear).
         ^CreditCard createCardFor: 'noe' expired: anExpiredDate withDigits: '1111111111111'.! !

!ObjectForTest class methodsFor: 'credit card' stamp: 'cb 6/11/2023 20:58:20'!
anInvalidNameCreditCard
         |anExpiredDate|
         anExpiredDate := GregorianMonthOfYear mayOf: (GregorianYear current nextLeapYear).
       ^CreditCard createCardFor: '' expired: anExpiredDate withDigits: '1111111111111111'.! !


!classDefinition: #SimulatorMerchantProcessor category: 'TusLibros'!
Object subclass: #SimulatorMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimulatorMerchantProcessor class' category: 'TusLibros'!
SimulatorMerchantProcessor class
	instanceVariableNames: ''!

!SimulatorMerchantProcessor class methodsFor: 'operation' stamp: 'cb 6/11/2023 20:18:13'!
assertCardHasCredit: aCreditCard
      (aCreditCard = ObjectForTest aValidCreditCardWithNoMoney ) ifTrue:
                                                  [self error: self cardWithNoMoney].
      ! !

!SimulatorMerchantProcessor class methodsFor: 'operation' stamp: 'cb 6/11/2023 20:17:42'!
assertCardIsNotStolen: aCreditCard
      (aCreditCard = ObjectForTest aValidStolenCreditCard) ifTrue:
                                                  [self error: self stolenCardErrorDescription].
      ! !

!SimulatorMerchantProcessor class methodsFor: 'operation' stamp: 'cb 6/11/2023 20:18:47'!
debit: aTotalAmountOfACart from: aCreditCard cameFrom: aCart
        self assertCardHasCredit: aCreditCard.
        self assertCardIsNotStolen: aCreditCard.
       ^aCart chargeHasBeenDoneCorrectly.! !


!SimulatorMerchantProcessor class methodsFor: 'errors' stamp: 'cb 6/11/2023 19:37:06'!
cardWithNoMoney
     ^'no money in account'! !

!SimulatorMerchantProcessor class methodsFor: 'errors' stamp: 'cb 6/11/2023 20:00:35'!
stolenCardErrorDescription
     ^'the card is stolen'! !
