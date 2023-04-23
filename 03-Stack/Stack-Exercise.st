!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceStack sentenceToFind'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:41:49'!
test01FindOnlyOneSentenceWithPrefix

	|correctSentenceToBeFound|
	
	correctSentenceToBeFound := OrderedCollection new.
	correctSentenceToBeFound add: 'never give up'.	
	
	self assert: correctSentenceToBeFound equals: (sentenceToFind findSentencesByPrefix: 'never').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:42:55'!
test02FindSentencesWithPrefixInCorrectOrder

	|correctSentencesToBeFound|
	
	correctSentencesToBeFound := OrderedCollection new.
	correctSentencesToBeFound add: 'the winter is coming'.
	correctSentencesToBeFound add: 'the summer is coming'.
	
	
	self assert: correctSentencesToBeFound equals: (sentenceToFind findSentencesByPrefix: 'the').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:43:26'!
test03NoSentencesWithPrefix

	|correctSentencesToBeFound|
	
	correctSentencesToBeFound := OrderedCollection new.
	
	self assert: correctSentencesToBeFound equals: (sentenceToFind findSentencesByPrefix: 'a').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:46:08'!
test04SentenceWithLowerCaseAndPrefixWithUpperCase

	|correctSentencesToBeFound|
	
	correctSentencesToBeFound := OrderedCollection new.
	
	self assert: correctSentencesToBeFound equals: (sentenceToFind findSentencesByPrefix: 'Nev')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:46:41'!
test05SentenceWithUpperCaseAndPrefixWithLowerCase


	|correctSentencesToBeFound|
	
	correctSentencesToBeFound := OrderedCollection new.
	
	self assert: correctSentencesToBeFound equals: (sentenceToFind findSentencesByPrefix: 'calculate')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:47:37'!
test06SentenceStackDoesNotChangeAfterSentenceFinderOperation
	
	sentenceToFind findSentencesByPrefix: 'the'.
	
	self assert:sentenceStack isEmpty equals: false.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 12:51:02'!
test07PrefixShouldNotContainWhitespace

	self 
		should: [ sentenceToFind findSentencesByPrefix: 't he']
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixCannotContainWhitespace ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'm 4/23/2023 13:40:43'!
test08PrefixShouldNotBeEmpty

	self 
		should: [ sentenceToFind findSentencesByPrefix: '']
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix prefixCannotBeEmpty ]! !


!SentenceFinderByPrefixTest methodsFor: 'set up' stamp: 'm 4/23/2023 12:47:01'!
setUp
	| firstSentence secondSentence thirdSentence forthSentence| 
	
	sentenceStack := OOStack new.
	
	firstSentence := 'the winter is coming'.
	secondSentence := 'the summer is coming'.
	thirdSentence := 'never give up'.
	forthSentence := 'Calculate the derivative'.
	
	sentenceStack push: firstSentence.
	sentenceStack push: secondSentence.
	sentenceStack push: thirdSentence.
	sentenceStack push: forthSentence.
	
	sentenceToFind := SentenceFinderByPrefix with: sentenceStack
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'values stackStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations - private' stamp: 'CB 4/22/2023 20:05:41'!
popEmptyStack
        ^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations - private' stamp: 'm 4/23/2023 14:38:15'!
popNotEmptyStack

         |tamañoProximoStack|

         tamañoProximoStack := self size - 1.
         stackStatus := OOStackStatus with:tamañoProximoStack.

        ^values removeLast.! !

!OOStack methodsFor: 'operations - private' stamp: 'm 4/23/2023 14:38:23'!
topEmptyStack

	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations - private' stamp: 'm 4/23/2023 14:39:03'!
topNotEmptyStack
	
	^values at: self size! !


!OOStack methodsFor: 'initialization' stamp: 'm 4/23/2023 14:39:35'!
initialize
	values := OrderedCollection new.
	stackStatus := OOStackStatus with: self size.! !


!OOStack methodsFor: 'operations' stamp: 'CB 4/22/2023 20:29:26'!
pop
        ^stackStatus checkingMyStackStatusTryingToPop: self.
	! !

!OOStack methodsFor: 'operations' stamp: 'm 4/23/2023 14:41:23'!
push: aPhraseToAdd
	
	values add: aPhraseToAdd.
	stackStatus := OOStackStatus with: (self size).! !

!OOStack methodsFor: 'operations' stamp: 'CB 4/22/2023 20:27:20'!
top
	^stackStatus checkingMyStackStatusTryingToTop: self. ! !


!OOStack methodsFor: 'testing' stamp: 'CB 4/22/2023 20:19:54'!
isEmpty
	^stackStatus isEmpty.! !


!OOStack methodsFor: 'accessing' stamp: 'CB 4/22/2023 20:22:39'!
size
	^values size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'n 4/20/2023 21:17:46'!
new
	^self basicNew initialize ! !

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'testing' stamp: 'CB 4/22/2023 20:20:46'!
isEmpty
     self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'instance creation' stamp: 'CB 4/22/2023 20:44:07'!
canHandle: size
        self subclassResponsibility ! !

!OOStackStatus class methodsFor: 'instance creation' stamp: 'CB 4/22/2023 21:04:53'!
with: aValue
       ^(OOStackStatus allSubclasses detect:[:aClass | aClass canHandle: aValue]) new.! !


!classDefinition: #NoVacio category: 'Stack-Exercise'!
OOStackStatus subclass: #NoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:29:54'!
checkingMyStackStatusTryingToPop: aStackToCheck
    ^aStackToCheck popNotEmptyStack.! !

!NoVacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:31:32'!
checkingMyStackStatusTryingToTop: aStackToCheck
    ^aStackToCheck topNotEmptyStack.! !

!NoVacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:19:17'!
isEmpty
    ^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacio class' category: 'Stack-Exercise'!
NoVacio class
	instanceVariableNames: ''!

!NoVacio class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:00:23'!
canHandle: aValue.
       ^aValue >= 1! !


!classDefinition: #Vacio category: 'Stack-Exercise'!
OOStackStatus subclass: #Vacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Vacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:28:04'!
checkingMyStackStatusTryingToPop:  aStackToCheck
    ^aStackToCheck popEmptyStack! !

!Vacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:27:51'!
checkingMyStackStatusTryingToTop:  aStackToCheck
    ^aStackToCheck topEmptyStack! !

!Vacio methodsFor: 'testing' stamp: 'CB 4/22/2023 20:20:22'!
isEmpty
    ^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:01:07'!
canHandle: aValue
       ^aValue = 0.! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'prefixValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'testing' stamp: 'm 4/23/2023 13:09:26'!
checkingIfPrefixIsValidForSentenceFinder: aSentenceFinder
	self subclassResponsibility ! !


!Prefix methodsFor: 'initialization' stamp: 'm 4/23/2023 15:15:37'!
initializeWith: aPrefix
	prefixValue := aPrefix! !


!Prefix methodsFor: 'accessing' stamp: 'm 4/23/2023 15:18:13'!
value
	^prefixValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:22:12'!
canHandle: aPrefix 
	self subclassResponsibility 
! !

!Prefix class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:49:06'!
for: aPrefix
	^self new initializeWith: aPrefix! !

!Prefix class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:44:44'!
with: aPrefix
	^(Prefix allSubclasses  detect:[:aClass | aClass canHandle: aPrefix]) for: aPrefix! !


!classDefinition: #PrefijoNoVacio category: 'Stack-Exercise'!
Prefix subclass: #PrefijoNoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefijoNoVacio methodsFor: 'testing' stamp: 'm 4/23/2023 13:09:48'!
checkingIfPrefixIsValidForSentenceFinder: aSentenceFinder
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefijoNoVacio class' category: 'Stack-Exercise'!
PrefijoNoVacio class
	instanceVariableNames: ''!

!PrefijoNoVacio class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:37:10'!
canHandle: aPrefix 
	^false 
! !


!classDefinition: #ConEspacio category: 'Stack-Exercise'!
PrefijoNoVacio subclass: #ConEspacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ConEspacio methodsFor: 'testing' stamp: 'm 4/23/2023 13:10:45'!
checkingIfPrefixIsValidForSentenceFinder: aSentenceFinder
	^aSentenceFinder invalidPrefixWithWhitespace.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConEspacio class' category: 'Stack-Exercise'!
ConEspacio class
	instanceVariableNames: ''!

!ConEspacio class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:27:54'!
canHandle: aPrefix 
	^aPrefix includesSubString: ' '
! !


!classDefinition: #SinEspacio category: 'Stack-Exercise'!
PrefijoNoVacio subclass: #SinEspacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SinEspacio methodsFor: 'testing' stamp: 'm 4/23/2023 15:17:49'!
checkingIfPrefixIsValidForSentenceFinder: aSentenceFinder
	^aSentenceFinder validPrefix: self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SinEspacio class' category: 'Stack-Exercise'!
SinEspacio class
	instanceVariableNames: ''!

!SinEspacio class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:29:42'!
canHandle: aPrefix 
	^(aPrefix includesSubString: ' ') not 
! !


!classDefinition: #PrefijoVacio category: 'Stack-Exercise'!
Prefix subclass: #PrefijoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefijoVacio methodsFor: 'testing' stamp: 'm 4/23/2023 13:13:33'!
checkingIfPrefixIsValidForSentenceFinder: aSentenceFinder
	^aSentenceFinder invalidEmptyPrefix ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefijoVacio class' category: 'Stack-Exercise'!
PrefijoVacio class
	instanceVariableNames: ''!

!PrefijoVacio class methodsFor: 'instance creation' stamp: 'm 4/23/2023 13:24:11'!
canHandle: aPrefix 
	^aPrefix isEmpty ! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences encontradas sentencesRevisadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'm 4/23/2023 14:50:59'!
findSentencesByPrefix: aStringPrefix
	
	^(Prefix with: aStringPrefix) checkingIfPrefixIsValidForSentenceFinder: self.
	! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'm 4/23/2023 14:49:21'!
initializeWith: sentenceStack

        sentences := sentenceStack. 
        encontradas := OrderedCollection new.
	sentencesRevisadas := OrderedCollection new. ! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'm 4/23/2023 15:06:55'!
addRecursivelySentenceWithPrefix: aPrefix

           |lastSentence|  

           sentences isEmpty ifTrue:[^encontradas].
	   lastSentence := sentences top.
	   sentences pop.
           (lastSentence beginsWith: aPrefix) ifTrue: [encontradas add: lastSentence].
	   sentencesRevisadas add: lastSentence.            

	   self addRecursivelySentenceWithPrefix: aPrefix
	! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'm 4/23/2023 13:12:46'!
invalidEmptyPrefix
	^ self error: self class prefixCannotBeEmpty! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'm 4/23/2023 13:11:54'!
invalidPrefixWithWhitespace
	^self error: self class prefixCannotContainWhitespace! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'm 4/23/2023 15:06:14'!
validPrefix: aPrefix
	
	self addRecursivelySentenceWithPrefix: aPrefix.
	sentencesRevisadas reverseDo: [:aSentence | sentences push:aSentence].
	
	^ encontradas reversed! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'CB 4/22/2023 22:39:04'!
with: sentenceStack
       ^self new initializeWith: sentenceStack.! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'm 4/23/2023 12:58:14'!
prefixCannotBeEmpty
	^'prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'm 4/23/2023 12:51:55'!
prefixCannotContainWhitespace
	^'prefix cannot contain whitespace'! !
