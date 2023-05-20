!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/15/2023 20:21:41'!
test01AnEmptyPortfolio

	| portfolio |
         portfolio := Portfolio new. 	
         self assert: 0 equals: portfolio balance! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 10:22:57'!
test02APortfolioBalanceWithOneAccount
        
	| portfolio anAccount |
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
         portfolio := Portfolio new.
         portfolio add: anAccount.
 	
         self assert: 50 equals: portfolio balance! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/19/2023 17:23:27'!
test03APortfolioBalanceWithOneAccountAndOnePortfolio
        
	| portfolio anAccount portfolio1 anAccount1 |
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
	 portfolio1 := Portfolio new.
        	portfolio1 add: anAccount.
	anAccount1 := ReceptiveAccount new.
	
	 Deposit register: 120 on: anAccount.
         portfolio := Portfolio new.
         portfolio add: anAccount1.
 	 portfolio add: portfolio1.
         self assert: 170 equals: portfolio balance! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 10:48:58'!
test04AnEmptyPortfolioTransactions
        
	| portfolio |
         portfolio := Portfolio new. 	
         self assert: (OrderedCollection new) equals: portfolio transactions! !

!PortfolioTest methodsFor: 'operations test' stamp: 'N 5/20/2023 16:42:43'!
test05APortfolioTransactionWithOneAccount
        
	| portfolio anAccount  |
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
	portfolio := Portfolio new.
        	portfolio add: anAccount.


         self assert: (anAccount transactions) equals: portfolio transactions! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 11:41:53'!
test06APortfolioHasRegisteredATransactionWithOneAccountAndOnePortfolio
        
	| portfolio anAccount anAccount1 portfolio1 aTransaction|
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
	
	 anAccount1 := ReceptiveAccount new.
	 aTransaction := Deposit register: 120 on: anAccount1.
	 portfolio1 := Portfolio new.
         	portfolio1 add: anAccount1.
	
         portfolio := Portfolio new.
         portfolio add: anAccount.
 	 portfolio add: portfolio1.
	
         self assert: true equals: (portfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 11:44:53'!
test07APortfolioTransactionsWithOneAccountAndOnePortfolio
        
	| portfolio anAccount anAccount1 portfolio1|
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
	
	 anAccount1 := ReceptiveAccount new.
	Deposit register: 120 on: anAccount1.
	 portfolio1 := Portfolio new.
         	portfolio1 add: anAccount1.
	
         portfolio := Portfolio new.
         portfolio add: anAccount.
 	 portfolio add: portfolio1.
	
         self assert: (anAccount transactions add: portfolio1 transactions) equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 11:45:05'!
test08AnEmptyPortfolioHasRegisteredATransaction
	
	| portfolio  aTransaction|
         portfolio := Portfolio new. 	
         aTransaction := Deposit for: 50.

         self assert: false equals: (portfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'operations test' stamp: 'N 5/20/2023 16:44:05'!
test09PortfolioHasRegisteredATransactionWithOneAccount
        
	| portfolio anAccount aTransaction|
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 200 on: anAccount.

	 portfolio := Portfolio new.
        	portfolio add: anAccount.

 	
         self assert: (anAccount hasRegistered: aTransaction) equals: (portfolio hasRegistered: aTransaction)! !


!PortfolioTest methodsFor: 'valid adding test' stamp: 'CB 5/19/2023 16:59:38'!
test10CanNotAddSameAccountTwiceToAPortfolioWithOnlyOneAccount
        
	| portfolio anAccount|
	anAccount := ReceptiveAccount new.
	Deposit register: 200 on: anAccount.

	 portfolio := Portfolio new.
        	portfolio add: anAccount.

 	 self
		should: [ portfolio add: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !

!PortfolioTest methodsFor: 'valid adding test' stamp: 'N 5/20/2023 16:45:38'!
test11CanNotAddSameAccountTwiceToAPortfolioWithAPortfolioWithThisAccount
        "
			parentPortfolio  <- anAccount 
			 | 
			portfolio
			 |
			anAccount
	
	"
	| portfolio anAccount parentPortfolio|
	anAccount := ReceptiveAccount new.
	Deposit register: 200 on: anAccount.

	portfolio := Portfolio new.
	parentPortfolio := Portfolio new.
       	portfolio add: anAccount.
        parentPortfolio add: portfolio.
 	 
	self
		should: [ parentPortfolio add: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !

!PortfolioTest methodsFor: 'valid adding test' stamp: 'CB 5/19/2023 17:36:27'!
test12CanNotAddSameAccountTwiceToAPortfolioWhoseParentHasThisAccount
        
	| portfolio anAccount parentPortfolio anAccount1|
	anAccount := ReceptiveAccount new.
	anAccount1 := ReceptiveAccount new.
	Deposit register: 200 on: anAccount.
        Deposit register: 100 on: anAccount1.
	portfolio := Portfolio new.
	portfolio add: anAccount1.
	parentPortfolio := Portfolio new.
        parentPortfolio add: anAccount.
        parentPortfolio add: portfolio.
 	 
	self
		should: [ portfolio add: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !

!PortfolioTest methodsFor: 'valid adding test' stamp: 'CB 5/19/2023 18:35:29'!
test13CanNotAddAPortfolioWithOneAccountToAPortfolioThatHasTheSameAccount
        "  portfolio   <-  portfolioToAdd 
                 |                            |
          anAccount          anAccount and anAccount1 "    
	| portfolio portfolioToAdd anAccount anAccount1|
	anAccount := ReceptiveAccount new.
	anAccount1 :=ReceptiveAccount new. 
	Deposit register: 200 on: anAccount1.
	Deposit register: 200 on: anAccount.
        portfolioToAdd := Portfolio new.
        portfolioToAdd add: anAccount.
	portfolioToAdd add: anAccount1.
	portfolio := Portfolio new.
        portfolio add: anAccount.
        
 	 self
		should: [ portfolio add: portfolioToAdd ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !

!PortfolioTest methodsFor: 'valid adding test' stamp: 'N 5/20/2023 16:46:49'!
test14CanNotAddAPortfolioWithAPortfolioWithOneAccountToAPortfolioThatHasTheSameAccount
        "  portfolio   <-  portfolioToAdd 
                 |                            |
          anAccount              aPortfolio3 
                                              |        \
                                   anAccount   anAccount1"    
	| portfolio portfolioToAdd anAccount anAccount1 portfolio3|
	anAccount := ReceptiveAccount new.
	anAccount1 :=ReceptiveAccount new. 
	Deposit register: 200 on: anAccount1.
	Deposit register: 200 on: anAccount.
        portfolioToAdd := Portfolio new.
        portfolio3 := Portfolio new.
        portfolio3 add: anAccount.
	portfolio3 add: anAccount1.
	portfolioToAdd add: portfolio3.
	portfolio := Portfolio new.
        portfolio add: anAccount.
        
 	 self
		should: [ portfolio add: portfolioToAdd ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !

!PortfolioTest methodsFor: 'valid adding test' stamp: 'N 5/20/2023 16:47:37'!
test15CanNotAddAPortfolioWhoseParentPortfolioHasTheSameAccount
 "        							parentPortfolio
                                                     							/		\
          portfolio     < -    portfolioToAdd  									anAccount
               |                               /					            \
          anAccount         anAccount1     anAccount2

"    
	| portfolio parentPortfolio portfolioToAdd anAccount anAccount1 anAccount2 |
	
	anAccount := ReceptiveAccount new.
	anAccount1 :=ReceptiveAccount new. 
	anAccount2 :=ReceptiveAccount new. 
	
	Deposit register: 200 on: anAccount.
	Deposit register: 100 on: anAccount1.
	Deposit register: 300 on: anAccount2.

	
        portfolioToAdd := Portfolio new.
        portfolio := Portfolio new.
	parentPortfolio := Portfolio new.
	
        portfolio add: anAccount.

	portfolioToAdd add: anAccount1.
	portfolioToAdd add: anAccount2.
	
	parentPortfolio add: anAccount.
        parentPortfolio add: portfolioToAdd.
        
 	 self
		should: [ portfolio add: portfolioToAdd ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio canNotAddSameAccountTwice ].
		
        ! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'CB 5/15/2023 20:11:43'!
contributesToAccountBalance: aBalance

	^aBalance + (self value)! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'CB 5/15/2023 20:11:32'!
contributesToAccountBalance: aBalance

	^aBalance - (self value)! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Actives category: 'Portfolio-Ejercicio'!
Object subclass: #Actives
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Actives subclass: #Portfolio
	instanceVariableNames: 'actives parent accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'N 5/20/2023 16:24:46'!
initialize 
    
     accounts := OrderedCollection new.
     parent := self. ! !


!Portfolio methodsFor: 'adding' stamp: 'N 5/20/2023 16:24:16'!
add: anActive 

	self verifyIfActiveCanBeAdded: anActive.
   	
	anActive addToPortfolio: self. 
	! !


!Portfolio methodsFor: 'testing' stamp: 'N 5/20/2023 16:39:21'!
contains: anAccount
	(self root has: anAccount) ifTrue: [
		^self error: self class canNotAddSameAccountTwice
	].
	^false! !

!Portfolio methodsFor: 'testing' stamp: 'N 5/20/2023 16:17:16'!
has: anActive 
         ^self hasAnyAccountThat: [:anAccount | anAccount isPartOf: anActive].
 
! !

!Portfolio methodsFor: 'testing' stamp: 'N 5/20/2023 16:04:51'!
hasAnyAccountThat: anAccountWithCondition 
         ^accounts inject: false into: [:conditionUntilNow :nextAccount | 
		conditionUntilNow or: (anAccountWithCondition value: nextAccount )] 
 
! !

!Portfolio methodsFor: 'testing' stamp: 'N 5/20/2023 16:04:51'!
hasRegistered: aTransaction 
	^self hasAnyAccountThat: [:anAccount | anAccount hasRegistered: aTransaction]
	
	! !


!Portfolio methodsFor: 'inspecting' stamp: 'N 5/20/2023 14:45:41'!
accounts
	^accounts! !

!Portfolio methodsFor: 'inspecting' stamp: 'N 5/20/2023 16:10:06'!
balance

	 ^accounts sum: [:anActive| anActive balance] ifEmpty:[0]! !

!Portfolio methodsFor: 'inspecting' stamp: 'CB 5/19/2023 18:13:22'!
childOf: aPortfolioParent
       parent := aPortfolioParent
   ! !

!Portfolio methodsFor: 'inspecting' stamp: 'N 5/20/2023 15:16:41'!
root
	parent = self ifTrue: [^self].
         ^parent root ! !

!Portfolio methodsFor: 'inspecting' stamp: 'N 5/20/2023 15:42:40'!
transactions
        |transactionsOfPortfolio |
       
        transactionsOfPortfolio := OrderedCollection new.
        
	^ accounts inject: transactionsOfPortfolio into: [:transactionToNow :nextAccount| 
		transactionToNow addAll: (nextAccount transactions )].! !


!Portfolio methodsFor: 'adding - private' stamp: 'N 5/20/2023 16:22:19'!
addAPortfolio: aPortfolioToBeAdded
	aPortfolioToBeAdded childOf: self.
	accounts addAll: (aPortfolioToBeAdded accounts).! !

!Portfolio methodsFor: 'adding - private' stamp: 'N 5/20/2023 16:24:23'!
addAnAccount: anAccountToBeAdded
	accounts add: anAccountToBeAdded! !

!Portfolio methodsFor: 'adding - private' stamp: 'N 5/20/2023 16:21:30'!
addToPortfolio: aPortfolio
	aPortfolio addAPortfolio: self.! !

!Portfolio methodsFor: 'adding - private' stamp: 'N 5/20/2023 16:15:02'!
verifyIfActiveCanBeAdded: anActive 
     (parent root has: anActive) ifTrue: [
		^self error: self class canNotAddSameAccountTwice
	].
   ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'CB 5/19/2023 16:46:32'!
canNotAddSameAccountTwice
    ^'can not add an existing account'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Actives subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'N 5/20/2023 16:09:07'!
balance
         |actualBalance|
          actualBalance := 0.
          transactions do: [:aTransaction | 
		actualBalance := aTransaction contributesToAccountBalance: actualBalance
	].
          ^actualBalance! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'N 5/20/2023 16:37:17'!
contains: anAccount
	^transactions = (anAccount transactions).! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'N 5/20/2023 16:39:41'!
isPartOf: anActive

	^anActive contains: self. 
       	! !


!ReceptiveAccount methodsFor: 'add to portfolio' stamp: 'N 5/20/2023 16:23:13'!
addToPortfolio: aPortfolio
	aPortfolio addAnAccount: self. ! !
