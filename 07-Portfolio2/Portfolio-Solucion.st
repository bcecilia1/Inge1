!classDefinition: #AccountSummaryTest category: 'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:21'!
test01ReceptiveAccountSummaryForAnEmptyReceptiveAccount

	|aReceptiveAccount emptyAccountBalance aReceptiveAccountReport|
	
	aReceptiveAccount := ReceptiveAccount new.
	emptyAccountBalance := OrderedCollection new.
	emptyAccountBalance add: 'Balance = 0'. 
	aReceptiveAccountReport := AccountSummary for: aReceptiveAccount.
	
	self assert: emptyAccountBalance  equals:(aReceptiveAccountReport report) .! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:21'!
test02ReceptiveAccountSummaryForAnReceptiveAccountWithOneTransaction

	|aReceptiveAccount aReceptiveAccountReport receptiveAccountBalance|
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register:  10 on: aReceptiveAccount.
	aReceptiveAccountReport := AccountSummary for: aReceptiveAccount.
	
	receptiveAccountBalance := OrderedCollection new.
	receptiveAccountBalance add: 'Deposito por 10'.
	receptiveAccountBalance add: 'Balance = 10'. 
	
	self assert: receptiveAccountBalance equals: (aReceptiveAccountReport report) .! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:21'!
test03ReceptiveAccountSummaryForAnReceptiveAccountWithMoreTransactions

	|aReceptiveAccount anotherReceptiveAccount aReceptiveAccountReport theReceptiveAccountReport|
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Deposit register:  100 on: aReceptiveAccount.
	Withdraw register:  50 on: aReceptiveAccount.
	Transfer from: aReceptiveAccount transfer: 20 to: anotherReceptiveAccount.
	Transfer from: anotherReceptiveAccount transfer: 30 to: aReceptiveAccount.
	aReceptiveAccountReport := AccountSummary for: aReceptiveAccount.
	
	theReceptiveAccountReport := OrderedCollection new.
	theReceptiveAccountReport add: 'Deposito por 100'.
	theReceptiveAccountReport add: 'Extraccion por 50'.
	theReceptiveAccountReport add: 'Salida por transferencia de 20'.
	theReceptiveAccountReport add: 'Entrada por transferencia de 30'.
	theReceptiveAccountReport add: 'Balance = 60'. 
	
	self assert: theReceptiveAccountReport  equals: (aReceptiveAccountReport report).! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:21'!
test04PortfolioAccountSummaryForAPortfolioWithOneAccount

	|aPortfolio emptyPortfolioBalance aPortfolioReport account1 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.

	
	Deposit register: 100 on: account1.
	
	aPortfolio := Portfolio with: account1.
	
	
	emptyPortfolioBalance := OrderedCollection new.
	emptyPortfolioBalance add: 'Deposito por 100'.
	emptyPortfolioBalance add: 'Balance = 100'. 
	aPortfolioReport := AccountSummary for: aPortfolio.
	
	self assert: emptyPortfolioBalance  equals:(aPortfolioReport report) .! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:21'!
test05PortfolioAccountSummaryForAPortfolioWithMoreThanOneAccount

	|aPortfolio thePortfolioBalance aPortfolioReport account1 account2|
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new. 
	
	Deposit register: 100 on: account1.
	Transfer from: account1 transfer: 50 to: account2.
	Withdraw register:  50 on: account2.
	Transfer from: account2 transfer: 25 to: account1.
	
	aPortfolio := Portfolio with: account1.
	aPortfolio add: account2.
	
	thePortfolioBalance := OrderedCollection new.
	thePortfolioBalance add: 'Deposito por 100'.
	thePortfolioBalance add: 'Salida por transferencia de 50'.
	thePortfolioBalance add: 'Entrada por transferencia de 25'.

	thePortfolioBalance add: 'Entrada por transferencia de 50'.
	thePortfolioBalance add: 'Extraccion por 50'.
	thePortfolioBalance add: 'Salida por transferencia de 25'.

	thePortfolioBalance add: 'Balance = 50'. 
	aPortfolioReport := AccountSummary for: aPortfolio.
	
	self assert: thePortfolioBalance  equals:(aPortfolioReport report) 
	! !


!classDefinition: #PortfolioSummaryTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioSummaryTest methodsFor: 'test' stamp: 'NH 5/31/2023 23:45:59'!
test01PortfolioSummaryForEmptyPortfolio

	|aPortfolio thePortfolioSummary aPortfolioSummary|
	
	aPortfolio  := Portfolio named:'Portfolio vacio'.
	thePortfolioSummary  := OrderedCollection new.
	thePortfolioSummary add:'Portfolio vacio'.
	aPortfolioSummary := PortfolioSummary for: aPortfolio. 
	
	self assert: thePortfolioSummary equals: aPortfolioSummary report.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 11:39:12'!
test02PortfolioSummaryForPortfolioWithOneLevel

	|familyPortfolio myAccount childrenPortfolio thePortfolioSummary aPortfolioSummary|
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	familyPortfolio  := Portfolio named: 'Portfolio de la familia' with: myAccount.
	familyPortfolio add: childrenPortfolio.
	
	aPortfolioSummary := PortfolioSummary for: familyPortfolio. 
	
	thePortfolioSummary  := OrderedCollection new.
	thePortfolioSummary add:'Portfolio de la familia'.
	thePortfolioSummary add:' Cuenta mia'.
	thePortfolioSummary add:' Portfolio de hijos'.
	
	
	self assert: thePortfolioSummary equals: aPortfolioSummary report.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:40:54'!
test03PortfolioSummaryForPortfolioWithMoreThanOneLevel

	|johnsAccount angiesAccount childrenPortfolio myAccount familyPortfolio thePortfolioSummary aPortfolioSummary|
		
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with:
	myAccount with: childrenPortfolio.
	
	thePortfolioSummary  := OrderedCollection new.
	thePortfolioSummary add:'Portfolio de la familia'.
	thePortfolioSummary add:' Cuenta mia'.
	thePortfolioSummary add:' Portfolio de hijos'.
	thePortfolioSummary add:'  Cuenta de Juan'.
	thePortfolioSummary add:'  Cuenta de Angeles'.
	aPortfolioSummary := PortfolioSummary for: familyPortfolio.
	
	self assert: thePortfolioSummary equals: aPortfolioSummary report.! !


!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:01'!
test01ReceptiveAccountTransferNetForAnEmptyReceptiveAccount

	|aReceptiveAccount  aReceptiveAccountTransferNet|
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccountTransferNet := TransferNet for: aReceptiveAccount.
	
	self assert:0 equals:  (aReceptiveAccountTransferNet report) .! !

!TransferNetTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:01'!
test02ReceptiveAccountTransferNetForAReceptiveAccountWithOneTransfer

	|aReceptiveAccount anotherReceptiveAccount aReceptiveAccountTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Deposit register:  100 on: aReceptiveAccount.
	Withdraw register:  50 on: aReceptiveAccount.
	Transfer from: aReceptiveAccount transfer: 20 to: anotherReceptiveAccount.

	aReceptiveAccountTransferNet := TransferNet for: aReceptiveAccount.
	
	self assert: -20 equals: (aReceptiveAccountTransferNet report).! !

!TransferNetTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:01'!
test03ReceptiveAccountTransferNetForAReceptiveAccountWithMoreTransfer

	|aReceptiveAccount anotherReceptiveAccount aReceptiveAccountTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Deposit register:  100 on: aReceptiveAccount.
	Withdraw register:  50 on: aReceptiveAccount.
	Transfer from: aReceptiveAccount transfer: 20 to: anotherReceptiveAccount.
	Transfer from: anotherReceptiveAccount transfer: 30 to: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := TransferNet for: aReceptiveAccount.
	
	self assert:10 equals:  (aReceptiveAccountTransferNet report) .! !

!TransferNetTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:01'!
test04PortfolioTransferNetForAPortfolioWithOneAccount

	|aPortfolio  aPortfolioTransferNet account1 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	aPortfolio := Portfolio with: account1.
	
	aPortfolioTransferNet := TransferNet for: aPortfolio.
	
	self assert: 0 equals:(aPortfolioTransferNet report) .! !

!TransferNetTest methodsFor: 'test' stamp: 'NH 6/1/2023 12:57:01'!
test05PortfolioTransferNetForAPortfolioWithMoreThanOneAccount

	|aPortfolio aPortfolioTransferNet account1 account2|
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new. 
	
	Deposit register: 100 on: account1.
	Transfer from: account1 transfer: 50 to: account2.
	Withdraw register:  50 on: account2.
	Transfer from: account2 transfer: 25 to: account1.
	
	aPortfolio := Portfolio with: account1.
	aPortfolio add: account2.
	
	aPortfolioTransferNet := TransferNet for: aPortfolio.
	
	self assert: 0  equals:(aPortfolioTransferNet report) ! !


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'test' stamp: 'NH 5/28/2023 13:11:38'!
test01TransferToAccount

        |previousBalanceFromAccount1 account1 account2 previousBalanceFromAccount2|

        account1 := ReceptiveAccount new.
        account2 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
        previousBalanceFromAccount1 := account1 balance. 
        previousBalanceFromAccount2 := account2 balance.
        Transfer from: account1 transfer: 10 to: account2.
        
	self assert:  previousBalanceFromAccount1 - 10  equals: account1 balance. 
	self assert:previousBalanceFromAccount2 + 10  equals: account2 balance.! !

!TransferTest methodsFor: 'test' stamp: 'NH 5/28/2023 13:12:06'!
test02HasRegisteredTransactionFromSourceToTarget

        |transmitterAccount receiverAccount aTransaction |

        transmitterAccount := ReceptiveAccount new.
        receiverAccount := ReceptiveAccount new.
	Deposit register: 100 on: transmitterAccount.
	
        
        aTransaction := Transfer from: transmitterAccount transfer: 10 to: receiverAccount.
        
	self assert: 10 equals: aTransaction value.
	self assert: true equals: (transmitterAccount hasRegistered: (aTransaction source)). 
	self assert: true equals:  (receiverAccount hasRegistered: (aTransaction target)). ! !

!TransferTest methodsFor: 'test' stamp: 'NH 5/28/2023 13:12:25'!
test03NavigateFromTransferSourceToTarget

        |transmitterAccount receiverAccount aTransaction |

        transmitterAccount := ReceptiveAccount new.
        receiverAccount := ReceptiveAccount new.
	Deposit register: 100 on: transmitterAccount.
	
        
        aTransaction := Transfer from: transmitterAccount transfer: 10 to: receiverAccount.
        
	self assert: (aTransaction target )equals:  (aTransaction source recipient) . 
	
	
	! !

!TransferTest methodsFor: 'test' stamp: 'NH 5/28/2023 13:12:40'!
test04NavigateFromTransferTargetToSource

        |transmitterAccount receiverAccount aTransaction |

        transmitterAccount := ReceptiveAccount new.
        receiverAccount := ReceptiveAccount new.
	Deposit register: 100 on: transmitterAccount.
	
        
        aTransaction := Transfer from: transmitterAccount transfer: 10 to: receiverAccount.
        
	self assert: (aTransaction source) equals:(aTransaction target remitter). 
	
	! !

!TransferTest methodsFor: 'test' stamp: 'NH 5/30/2023 21:21:32'!
test05CannotTransferToInexistentAccount

        |transmitterAccount receiverAccount |

        transmitterAccount := ReceptiveAccount new.
        receiverAccount :=''.
	Deposit register: 100 on: transmitterAccount.
	
      self 
		should: [ Transfer from: transmitterAccount transfer: 10 to: receiverAccount. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: Transfer cannotTransferToInexistentAccountDescription]
        
	
	! !

!TransferTest methodsFor: 'test' stamp: 'NH 5/30/2023 21:32:02'!
test06CannotTransferFromInexistentAccount

        |transmitterAccount receiverAccount |

        transmitterAccount := ''.
        receiverAccount := ReceptiveAccount new.
	
      self 
		should: [ Transfer from: transmitterAccount transfer: 10 to: receiverAccount. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: Transfer cannotTransferFromInexistentAccountDescription]
        
	
	! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'NH 6/1/2023 00:04:32'!
initializeNamed: aName 
	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'NH 6/1/2023 12:54:20'!
givePortfolioSummaryFor: aPortfolioSummary with: level

	aPortfolioSummary addName: self name with: level. 
	accounts do:[:anAccount | anAccount givePortfolioSummaryFor: aPortfolioSummary with: (level +1) ].
	! !

!Portfolio methodsFor: 'reports' stamp: 'NH 5/31/2023 23:05:23'!
giveReport: aReport

	^accounts do:[ :anAccount |  anAccount giveReport: aReport ].! !


!Portfolio methodsFor: 'accesing' stamp: 'NH 6/1/2023 00:12:01'!
name
	^name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'NH 5/31/2023 23:44:34'!
named: aName
	^self new initializeNamed: aName ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NH 6/1/2023 00:08:50'!
named: aName with: anAccount 

	^(self new initializeNamed: aName)
		add: anAccount;
		yourself ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NH 6/1/2023 00:06:42'!
named: aName with: anAccount with: anotherAccount 

	^(self new initializeNamed: aName)
		add: anAccount;
		add: anotherAccount;
		yourself ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NH 6/1/2023 11:29:30'!
initializeNamed: aName 
	
	super initialize.
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'NH 6/1/2023 12:52:52'!
givePortfolioSummaryFor: aPortfolioSummary with: level
	aPortfolioSummary addName: self name with: level. 
	! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'NH 5/31/2023 22:57:10'!
giveReport: aReport

	^transactions do:[ :aTransaction |  aTransaction doOperationForReport: aReport ].! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'NH 6/1/2023 11:36:35'!
name
	^name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'NH 5/31/2023 23:48:07'!
named: aName 
	
	
	^self new initializeNamed: aName ! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NH 6/1/2023 14:08:34'!
register: TransactionInfo on: account

	| transaction |
	
	transaction := self for: TransactionInfo.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'NH 5/31/2023 22:58:23'!
doOperationForReport: aReport
	^aReport operationForDepositWith: value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLegs category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferLegs
	instanceVariableNames: 'transaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLegs methodsFor: 'accesing' stamp: 'NH 5/28/2023 13:22:45'!
value
	^transaction value! !


!TransferLegs methodsFor: 'balance' stamp: 'NH 5/28/2023 13:23:33'!
affectBalance: aBalance
	self subclassResponsibility ! !


!TransferLegs methodsFor: 'intialization' stamp: 'NH 6/1/2023 14:04:20'!
initializeFor: aTransaction
	transaction  := aTransaction ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLegs class' category: 'Portfolio-Solucion'!
TransferLegs class
	instanceVariableNames: ''!

!TransferLegs class methodsFor: 'instance creation' stamp: 'NH 6/1/2023 14:07:21'!
for: aTransaction
	^self new initializeFor: aTransaction! !


!classDefinition: #TransferRecipient category: 'Portfolio-Solucion'!
TransferLegs subclass: #TransferRecipient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferRecipient methodsFor: 'accesing' stamp: 'NH 5/28/2023 12:03:12'!
remitter
	^transaction source! !


!TransferRecipient methodsFor: 'report' stamp: 'NH 5/31/2023 22:59:31'!
doOperationForReport: aReport
	^aReport operationForTransferRecipientWith: self value.
! !


!TransferRecipient methodsFor: 'balance' stamp: 'NH 5/28/2023 12:02:53'!
affectBalance: aBalance

	^aBalance + (transaction value)! !


!classDefinition: #TransferRemmiter category: 'Portfolio-Solucion'!
TransferLegs subclass: #TransferRemmiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferRemmiter methodsFor: 'balance' stamp: 'NH 5/28/2023 12:01:01'!
affectBalance: aBalance

	^aBalance - (transaction value)! !


!TransferRemmiter methodsFor: 'accesing' stamp: 'NH 5/28/2023 11:58:48'!
recipient
	^transaction target
	! !


!TransferRemmiter methodsFor: 'report' stamp: 'NH 5/31/2023 22:59:53'!
doOperationForReport: aReport
	^aReport operationForTransferRemmiterWith: self value.! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'NH 5/31/2023 22:58:58'!
doOperationForReport: aReport
	^aReport operationForWithdrawWith: value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioSummary category: 'Portfolio-Solucion'!
Object subclass: #PortfolioSummary
	instanceVariableNames: 'portfolio portfolioReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioSummary methodsFor: 'report' stamp: 'NH 6/1/2023 12:53:19'!
addName: aNameToAdd with: level
	|nameToAdd|
	nameToAdd  := aNameToAdd.
	level timesRepeat: [nameToAdd := ' ', nameToAdd ].
	portfolioReport add: nameToAdd. ! !

!PortfolioSummary methodsFor: 'report' stamp: 'NH 6/1/2023 12:54:02'!
report
	portfolio givePortfolioSummaryFor: self with: 0. 
	^ portfolioReport! !


!PortfolioSummary methodsFor: 'initialization' stamp: 'NH 6/1/2023 12:08:12'!
initializeFor: aPortfolio 

	portfolio := aPortfolio.
	portfolioReport := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioSummary class' category: 'Portfolio-Solucion'!
PortfolioSummary class
	instanceVariableNames: ''!

!PortfolioSummary class methodsFor: 'instance creation' stamp: 'NH 5/31/2023 23:34:44'!
for: aPortfolio 
	^self new initializeFor: aPortfolio ! !


!classDefinition: #Report category: 'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'initialization' stamp: 'NH 5/31/2023 23:23:32'!
initializeFor: anAccount 
	self subclassResponsibility ! !


!Report methodsFor: 'report private' stamp: 'NH 5/31/2023 23:23:47'!
operationForDepositWith: aDepositValue
	^self subclassResponsibility ! !

!Report methodsFor: 'report private' stamp: 'NH 5/31/2023 23:24:07'!
operationForTransferRecipientWith: aTRValue
	^self subclassResponsibility 
		! !

!Report methodsFor: 'report private' stamp: 'NH 5/31/2023 23:24:30'!
operationForTransferRemmiterWith: aTRValue
	^self subclassResponsibility 
		! !

!Report methodsFor: 'report private' stamp: 'NH 5/31/2023 23:24:52'!
operationForWithdrawWith: aWithdrawValue
	^self subclassResponsibility ! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account accountSummary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 5/31/2023 22:50:27'!
initializeFor: anAccount 
	account := anAccount.
	accountSummary := OrderedCollection new.! !

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 5/31/2023 23:01:21'!
operationForDepositWith: aDepositValue
	^accountSummary add: ('Deposito por ', aDepositValue asString)! !

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 5/31/2023 23:01:26'!
operationForTransferRecipientWith: aTRValue
	^accountSummary add: ('Entrada por transferencia de ', aTRValue asString)
		! !

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 5/31/2023 23:01:30'!
operationForTransferRemmiterWith: aTRValue
	^accountSummary add: ('Salida por transferencia de ', aTRValue asString)
		! !

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 5/31/2023 23:01:34'!
operationForWithdrawWith: aWithdrawValue
	^accountSummary add: ('Extraccion por ',  aWithdrawValue asString)
		! !

!AccountSummary methodsFor: 'accountSummary' stamp: 'NH 6/1/2023 12:57:21'!
report
	
	account giveReport: self. 
	accountSummary add: ('Balance = ', account balance asString).
	
	^accountSummary! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'NH 5/31/2023 21:45:05'!
for: anAccount 
	^self new initializeFor: anAccount ! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'account transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'report private' stamp: 'NH 5/31/2023 23:25:31'!
operationForDepositWith: aDepositValue
	! !

!TransferNet methodsFor: 'report private' stamp: 'NH 5/31/2023 23:14:25'!
operationForTransferRecipientWith: aTransferRecipientValue
	^transferNet := transferNet + aTransferRecipientValue! !

!TransferNet methodsFor: 'report private' stamp: 'NH 5/31/2023 23:15:23'!
operationForTransferRemmiterWith: aTransferRemmiterValue
	^ transferNet := transferNet  - aTransferRemmiterValue! !

!TransferNet methodsFor: 'report private' stamp: 'NH 5/31/2023 23:25:38'!
operationForWithdrawWith: aWithdrawValue
	! !


!TransferNet methodsFor: 'initialization' stamp: 'NH 5/31/2023 23:13:29'!
initializeFor: anAccount 
	
	account := anAccount.
	transferNet := 0.! !


!TransferNet methodsFor: 'report' stamp: 'NH 6/1/2023 12:57:01'!
report

	account giveReport: self.
	

	^transferNet 
		
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'Portfolio-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'NH 5/28/2023 12:55:23'!
for: aReceptiveAccount 
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'transferValue source target'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'accessing' stamp: 'NH 5/28/2023 11:56:13'!
source	
	^source! !

!Transfer methodsFor: 'accessing' stamp: 'NH 5/28/2023 11:56:22'!
target	
	^target! !

!Transfer methodsFor: 'accessing' stamp: 'NH 5/28/2023 11:56:30'!
value
	^transferValue! !


!Transfer methodsFor: 'intialization' stamp: 'NH 6/1/2023 13:58:10'!
initializeWith: aValueToTransfer from: anAccountToExtractMoney to: anAccountToReceivedMoney
	transferValue := aValueToTransfer.
	source := TransferRemmiter register: self on: anAccountToExtractMoney .
	target := TransferRecipient register: self on: anAccountToReceivedMoney ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'NH 5/30/2023 21:38:11'!
from: anAccountToExtractMoney transfer: aValueToTransfer to: anAccountToReceivedMoney
	(anAccountToReceivedMoney isKindOf: ReceptiveAccount ) ifFalse: [^self error: self cannotTransferToInexistentAccountDescription.].
	(anAccountToExtractMoney isKindOf: ReceptiveAccount) ifFalse: [^self error: self cannotTransferFromInexistentAccountDescription.].
	^self new initializeWith: aValueToTransfer from: anAccountToExtractMoney to: anAccountToReceivedMoney. 
	
	
	! !


!Transfer class methodsFor: 'error message description' stamp: 'NH 5/30/2023 21:35:22'!
cannotTransferFromInexistentAccountDescription
	^'can only transfer from existent receptive account'! !

!Transfer class methodsFor: 'error message description' stamp: 'NH 5/30/2023 21:29:10'!
cannotTransferToInexistentAccountDescription
	^'can only transfer to existent receptive account'! !
