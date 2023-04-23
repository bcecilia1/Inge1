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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:14:45'!
test01FindOnlyOneSentenceWithPrefix

"	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject."! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:15:29'!
test02FindMoreThanOneSentencesWithPrefix

"	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject."! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:16:13'!
test03NoSentencesWithPrefix

"	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject."! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:17:29'!
test04SentenceWithLowerCaseAndPrefixWithUpperCase

"	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject."! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:17:43'!
test05SentenceWithUpperCaseAndPrefixWithLowerCase

"	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject."! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:52:46'!
test06FindSentencesWithPrefixInCorrectOrder

	| stack pushedObject0 pushedObject1 pushedObject2 stack1 sentencesToFind| 
	
	stack := OOStack new.
	pushedObject0 := 'the winter is coming'.
	pushedObject1 := 'the summer is coming'.
	pushedObject2 := 'never give up'.
	stack push: pushedObject0.
	stack push: pushedObject1.
	stack push: pushedObject2.
	
	sentencesToFind := SentenceFinderByPrefix with: stack.
	
	stack1 := OOStack new.
	stack1 push: pushedObject0.
	stack1 push: pushedObject1.
	
	
	
	self assert: stack1 equals: (sentencesToFind findSentencesByPrefix: 'the').! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'values stackStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:07:24'!
initialize
	values := OrderedCollection new.
	stackStatus := OOStackStatus with: values size. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:19:54'!
isEmpty
	^stackStatus isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:29:26'!
pop
        ^stackStatus checkingMyStackStatusTryingToPop: self.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:05:41'!
popEmptyStack
        ^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:00:00'!
popNotEmptyStack
         |tamañoProximoStack|
         tamañoProximoStack := self size - 1.
         stackStatus := OOStackStatus with:tamañoProximoStack.
        ^values removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:08:08'!
push: aPhraseToAdd
	stackStatus := OOStackStatus with: (self size + 1).
	values add: aPhraseToAdd 
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:22:39'!
size
	^values size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:27:20'!
top
	^stackStatus checkingMyStackStatusTryingToTop: self. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:24:25'!
topEmptyStack
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:32:19'!
topNotEmptyStack
	^values at: values size! !

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

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:00:59'!
checkingMyStackStatus: aStackToCheck
     self subclassResponsibility.! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:20:46'!
isEmpty
     self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:44:07'!
canHandle: size
        self subclassResponsibility ! !

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:04:53'!
with: aValue
       ^(OOStackStatus allSubclasses detect:[:aClass | aClass canHandle: aValue]) new.! !


!classDefinition: #NoVacio category: 'Stack-Exercise'!
OOStackStatus subclass: #NoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:29:54'!
checkingMyStackStatusTryingToPop: aStackToCheck
    ^aStackToCheck popNotEmptyStack.! !

!NoVacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:31:32'!
checkingMyStackStatusTryingToTop: aStackToCheck
    ^aStackToCheck topNotEmptyStack.! !

!NoVacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:19:17'!
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

!Vacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:28:04'!
checkingMyStackStatusTryingToPop:  aStackToCheck
    ^aStackToCheck popEmptyStack! !

!Vacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:27:51'!
checkingMyStackStatusTryingToTop:  aStackToCheck
    ^aStackToCheck topEmptyStack! !

!Vacio methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 20:20:22'!
isEmpty
    ^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 21:01:07'!
canHandle: aValue
       ^aValue = 0.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences encontradas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:53:45'!
findNextSentenceByPrefix: aPrefix inNext: aSentenceStack
           |lastSentence|  
           sentences isEmpty ifTrue:[^encontradas].

           lastSentence := sentences top.
           sentences pop. 
           (lastSentence beginsWith: aPrefix) ifTrue: [encontradas push: lastSentence].
            
           ^self findNextSentenceByPrefix: aPrefix inNext: sentences.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:46:38'!
findSentencesByPrefix: aPrefix
          
           ^self findNextSentenceByPrefix: aPrefix inNext: sentences! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:41:49'!
initializeWith: sentenceStack
        sentences := sentenceStack. 
        encontradas := OOStack new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CB 4/22/2023 22:39:04'!
with: sentenceStack
       ^self new initializeWith: sentenceStack.! !
