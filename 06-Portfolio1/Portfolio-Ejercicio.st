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

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 11:11:03'!
test05APortfolioTransactionWithOneAccount
        
	| portfolio anAccount  |
	anAccount := ReceptiveAccount new.
	
	 Deposit register: 50 on: anAccount.
	portfolio := Portfolio new.
        	portfolio add: anAccount.

 	 "para preguntar"
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

!PortfolioTest methodsFor: 'operations test' stamp: 'CB 5/18/2023 11:45:17'!
test09PortfolioHasRegisteredATransactionWithOneAccount
        
	| portfolio anAccount aTransaction|
	anAccount := ReceptiveAccount new.
	aTransaction := Deposit register: 200 on: anAccount.

	 portfolio := Portfolio new.
        	portfolio add: anAccount.

 	 "para preguntar"
         self assert: (anAccount hasRegistered: aTransaction) equals: (portfolio hasRegistered: aTransaction)! !


!PortfolioTest methodsFor: 'constructor test' stamp: 'CB 5/19/2023 16:59:38'!
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

!PortfolioTest methodsFor: 'constructor test' stamp: 'CB 5/19/2023 16:59:27'!
test11CanNotAddSameAccountTwiceToAPortfolioWithAPortfolioWithThisAccount
        
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

!PortfolioTest methodsFor: 'constructor test' stamp: 'CB 5/19/2023 17:36:27'!
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

!PortfolioTest methodsFor: 'constructor test' stamp: 'CB 5/19/2023 18:35:29'!
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

!PortfolioTest methodsFor: 'constructor test' stamp: 'CB 5/19/2023 19:15:50'!
test14CanNotAddAPortfolioWithAPortfolioWithOneAccountToAPortfolioThatHasTheSameAccount
        "  portfolio   <-  portfolioToAdd 
                 |                            |
          anAccount          aPortfolio3 
                                              |
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
	instanceVariableNames: 'actives parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 18:42:44'!
actives
     ^actives! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 19:06:36'!
add: anActive 
     
         (parent contains: anActive) ifTrue: [^self error: self class canNotAddSameAccountTwice].
         (anActive actives) do: [:anActiveToCheck | (parent contains: anActiveToCheck) ifTrue: [^self error: self class canNotAddSameAccountTwice]].    
         actives add: anActive.
         anActive childOf: self.! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 16:19:27'!
balance

	 ^actives sum: [:anActive| anActive balance] ifEmpty:[0]! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 18:13:22'!
childOf: aPortfolioParent
       parent := aPortfolioParent
   ! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 18:12:20'!
contains: anActive
         
         parent = self ifTrue: [^self has: anActive].
         ^parent contains: anActive
         
 
! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 17:33:23'!
has: anActive 
         ^actives inject: false into: [:hasTheActive :nextActive | hasTheActive or: (nextActive has: anActive)] 
 
! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 17:51:50'!
initialize 
     actives := OrderedCollection new.
     parent := self. ! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 17:50:16'!
parent
       ^parent
   ! !

!Portfolio methodsFor: 'category-name' stamp: 'CB 5/19/2023 17:03:47'!
transactions
        |transactionsOfPortfolio |
       
        transactionsOfPortfolio := OrderedCollection new.
        "mejorar ?¿ no hacer object recursion"
	
	^actives inject: transactionsOfPortfolio into:  [:transactionsToNow :nextActive |
		                                                                  transactionsToNow add: (nextActive transactions)].! !


!Portfolio methodsFor: 'testing' stamp: 'CB 5/19/2023 16:19:17'!
hasRegistered: aTransaction 
	 ^actives inject: false into: [:hasTransactionRegistered :anActive | hasTransactionRegistered or: (anActive hasRegistered: aTransaction)].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CB 5/19/2023 16:46:32'!
canNotAddSameAccountTwice
    ^'can not add an existing account'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Actives subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'CB 5/19/2023 19:04:59'!
actives
        ^OrderedCollection with: self.! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'CB 5/19/2023 18:13:58'!
childOf: aPortfolioParent
       parent := aPortfolioParent! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'CB 5/19/2023 19:24:12'!
has: anActive 
        (anActive isKindOf: Portfolio) ifTrue: [anActive actives do: [:anActiveToCheck | (parent contains: anActiveToCheck) ifTrue: [^self error: self class canNotAddSameAccountTwice]]].
	^ transactions = (anActive transactions) ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'CB 5/15/2023 20:10:38'!
balance
         |actualBalance|
          actualBalance := 0.
          transactions do: [:aTransaction | actualBalance := aTransaction contributesToAccountBalance: actualBalance].
          ^actualBalance ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
