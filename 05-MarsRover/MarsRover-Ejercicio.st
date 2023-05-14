!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'test private' stamp: 'NH 5/13/2023 11:55:05'!
assertMarsRover: aMarsRover IsAt: aPosition facing: aDirection

	self assert: aPosition equals:  aMarsRover currentPosition. 
	self assert: aDirection equals: aMarsRover currentDirection! !

!MarsRoverTest methodsFor: 'test private' stamp: 'CB 5/14/2023 14:24:41'!
marsRoverStartingAt: aPositionToStart facing: aDirection received: aCommand
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt:  aPositionToStart facing: aDirection. 
	aMarsRover readCommands: aCommand.

	^aMarsRover! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:33:17'!
test18MarsRoverFacingWestMovesFoward

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: -1@0 facing: #West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:33:38'!
test19MarsRoverFacingWestMovesBackwardsThreeTimes

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'bbb'.
	
	self assertMarsRover: aMarsRover IsAt: 3@0 facing: #West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:34:02'!
test20MarsRoverFacingWestRotateRightOnce
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'r'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:34:13'!
test21MarsRoverFacingWestRotateRightTwice
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:34:25'!
test22MarsRoverFacingWestRotateRightThreeTimes
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:34:35'!
test23MarsRoverFacingWestRotateLeftOnce
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'l'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:34:47'!
test24MarsRoverFacingWestRotateLeftTwice
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'CB 5/14/2023 14:35:00'!
test25MarsRoverFacingWestRotateLeftTwice
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #West received: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:29:41'!
test00MarsRoverCreatedCorrectlyAtOriginFacingNorth

	|aMarsRover |
        
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: ''.

	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:26:33'!
test01MarsRoverMovesFoward

	|aMarsRover|
        
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'f'.
	
	
	self assertMarsRover: aMarsRover IsAt: 0@1 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:27:00'!
test02MarsRoverMovesBackwards

	|aMarsRover|
	
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-1 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:27:15'!
test03MarsRoverRotatesLeft

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'l'.

	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:27:29'!
test04MarsRoverRotatesRight

	|aMarsRover|

        aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'r'.

	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:27:41'!
test05MarsRoverCreatedCorrectlyAt01MovesFowardFacingNorth

	|aMarsRover|
	
	aMarsRover := self marsRoverStartingAt: 0@1 facing: #North received: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:27:57'!
test06MarsRoverCreatedCorrectlyAt33MovesFowardFacingNorth

	|aMarsRover|

        aMarsRover := self marsRoverStartingAt: 3@3 facing: #North received: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 3@4 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:30:04'!
test07MarsRoverCreatedCorrectlyAt47MovesFowardFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 4@7 facing: #North received: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 4@8 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:30:20'!
test08MarsRoverCreatedCorrectlyAt01MovesBackwardsFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@1 facing: #North received: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:30:41'!
test09MarsRoverCreatedCorrectlyAt33MovesBackwardsFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 3@3 facing: #North received: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 3@2 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:30:57'!
test10MarsRoverMovesFowardTwiceFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'ff'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:31:12'!
test11MarsRoverMovesFowardThreeTimesFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'fff'.
	
	self assertMarsRover: aMarsRover IsAt: 0@3 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:31:28'!
test12MarsRoverMovesBackwardsTwiceFacingNorth

	|aMarsRover|
        aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'bb'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-2 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:31:43'!
test13MarsRoverMovesBackwardsThreeTimesFacingNorth

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'bbb'.

	self assertMarsRover: aMarsRover IsAt: 0@-3 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:32:00'!
test14MarsRoverRotatesLeftTwice

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:32:11'!
test15MarsRoverRotatesLeftThreeTimes

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:32:37'!
test16MarsRoverRotatesRightTwice

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'CB 5/14/2023 14:32:52'!
test17MarsRoverRotatesRightThreeTimes

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #North received: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #West! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:35:17'!
test26MarsRoverFacingSouthMovesBackwards

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'bb'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: #South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:35:29'!
test27MarsRoverFacingSouthMovesFoward

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'ffff'.

	self assertMarsRover: aMarsRover IsAt: 0@-4 facing: #South.! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:35:41'!
test28MarsRoverFacingSouthRotatesRightOnce

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'r'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:35:53'!
test29MarsRoverFacingSouthRotatesRightTwice

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:36:05'!
test30MarsRoverFacingSouthRotatesRightThreeTimes

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:36:20'!
test31MarsRoverFacingSouthRotatesLeftOnce

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'l'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:36:32'!
test32MarsRoverFacingSouthRotatesLeftTwice

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'CB 5/14/2023 14:36:39'!
test33MarsRoverFacingSouthRotatesLeftThreeTimes

	|aMarsRover|
	
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #South received: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #West! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'CB 5/14/2023 14:36:56'!
test34MarsRoverFacingEastMovesFoward

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 1@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'CB 5/14/2023 14:37:19'!
test35MarsRoverFacingEastMovesBackwards

	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: -1@0 facing: #East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'CB 5/14/2023 14:37:39'!
test36MarsRoverFacingEastRotatesRightThreeTimes
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'CB 5/14/2023 14:38:05'!
test37MarsRoverFacingEastRotatesLeftThreeTimes
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'lll'.

	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #South! !


!MarsRoverTest methodsFor: 'test multiple different commands' stamp: 'CB 5/14/2023 14:38:20'!
test38MarsRoverFacingEastRotatesLeftAndRight
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'rl'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: #East.! !

!MarsRoverTest methodsFor: 'test multiple different commands' stamp: 'CB 5/14/2023 14:38:32'!
test39MarsRoverFacingEastMovesFowardAndBackward
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 0@0 facing: #East received: 'rfr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-1 facing: #West.! !

!MarsRoverTest methodsFor: 'test multiple different commands' stamp: 'CB 5/14/2023 14:38:59'!
test40MarsRoverFacingNorthMovesToSamePosition
	|aMarsRover|
	aMarsRover := self marsRoverStartingAt: 4@7 facing: #North received: 'fbrllrfb'.
	
	self assertMarsRover: aMarsRover IsAt: 4@7 facing: #North.! !

!MarsRoverTest methodsFor: 'test multiple different commands' stamp: 'CB 5/14/2023 13:05:27'!
test41MarsRoverFacingNorthReceivedAnInvalidCommand
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 4@7 facing: #North.
	
	
	self
		should: [ aMarsRover readCommands: 'x'.]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommand].! !

!MarsRoverTest methodsFor: 'test multiple different commands' stamp: 'CB 5/14/2023 13:24:34'!
test42MarsRoverFacingNorthReceivedACommandWithAnInvalidCommandAtLast
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 4@7 facing: #North.
	

	self
		should: [ aMarsRover readCommands: 'fftbb'.]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommand].
	
	self assertMarsRover: aMarsRover IsAt: 4@9 facing: #North.	
		! !


!classDefinition: #Command category: 'MarsRover-Ejercicio'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Command methodsFor: 'actions' stamp: 'CB 5/14/2023 13:46:19'!
hasToTakeActionToMove: aMarsRover whenFacing: state
       self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover-Ejercicio'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'initialization' stamp: 'CB 5/14/2023 14:16:45'!
with: aCommand
          ^(self allSubclasses detect: [:commandAvailable | commandAvailable canHandle: aCommand ]) new! !


!classDefinition: #NonValid category: 'MarsRover-Ejercicio'!
Command subclass: #NonValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!NonValid methodsFor: 'actions' stamp: 'CB 5/14/2023 13:50:35'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^aMarsRover notAValidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonValid class' category: 'MarsRover-Ejercicio'!
NonValid class
	instanceVariableNames: ''!

!NonValid class methodsFor: 'initialization' stamp: 'CB 5/14/2023 14:02:51'!
canHandle: aCommand
     ^((aCommand = $f or: aCommand = $b) or: (aCommand = $r or: aCommand = $l ) or: aCommand = $ ) not
    
     
    
     ! !


!classDefinition: #Valid category: 'MarsRover-Ejercicio'!
Command subclass: #Valid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Valid methodsFor: 'actions' stamp: 'CB 5/14/2023 13:47:04'!
hasToTakeActionToMove: aMarsRover whenFacing: state
       self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Valid class' category: 'MarsRover-Ejercicio'!
Valid class
	instanceVariableNames: ''!

!Valid class methodsFor: 'initialization' stamp: 'CB 5/14/2023 14:11:37'!
canHandle: aCommand
         ^false! !


!classDefinition: #Backward category: 'MarsRover-Ejercicio'!
Valid subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Backward methodsFor: 'actions' stamp: 'CB 5/14/2023 13:48:00'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^state movesBackward: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover-Ejercicio'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'initialization' stamp: 'CB 5/14/2023 13:55:43'!
canHandle: aCommand
    ^aCommand = $b! !


!classDefinition: #Empty category: 'MarsRover-Ejercicio'!
Valid subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Empty methodsFor: 'actions' stamp: 'CB 5/14/2023 13:48:44'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'MarsRover-Ejercicio'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'initialization' stamp: 'CB 5/14/2023 14:02:59'!
canHandle: aCommand
     ^aCommand = $! !


!classDefinition: #Foward category: 'MarsRover-Ejercicio'!
Valid subclass: #Foward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Foward methodsFor: 'actions' stamp: 'CB 5/14/2023 13:48:18'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^state movesFoward: aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Foward class' category: 'MarsRover-Ejercicio'!
Foward class
	instanceVariableNames: ''!

!Foward class methodsFor: 'initialization' stamp: 'CB 5/14/2023 14:16:55'!
canHandle: aCommand
     ^aCommand = $f! !


!classDefinition: #RotateLeft category: 'MarsRover-Ejercicio'!
Valid subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateLeft methodsFor: 'actions' stamp: 'CB 5/14/2023 13:49:44'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^aMarsRover rotate: state rotateLeft ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'MarsRover-Ejercicio'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'initialization' stamp: 'CB 5/14/2023 13:56:46'!
canHandle: aCommand
     ^aCommand = $l! !


!classDefinition: #RotateRight category: 'MarsRover-Ejercicio'!
Valid subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!RotateRight methodsFor: 'actions' stamp: 'CB 5/14/2023 13:49:57'!
hasToTakeActionToMove: aMarsRover whenFacing: state
        ^aMarsRover rotate: state rotateRight ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'MarsRover-Ejercicio'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'initialization' stamp: 'CB 5/14/2023 13:56:54'!
canHandle: aCommand
     ^aCommand = $r! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'position state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'initialization' stamp: 'CB 5/14/2023 12:15:14'!
initializeLandsAt: aPointInAMap facing: aDirection 
	
	position := aPointInAMap.
	state := MarsRoverState facing: aDirection.! !


!MarsRover methodsFor: 'accesing' stamp: 'CB 5/14/2023 12:59:50'!
currentDirection
	^state direction! !

!MarsRover methodsFor: 'accesing' stamp: 'NH 5/13/2023 12:11:02'!
currentPosition
	^ position! !


!MarsRover methodsFor: 'actions' stamp: 'CB 5/14/2023 13:52:04'!
moves: oneCommand  
       (Command with: oneCommand) hasToTakeActionToMove: self whenFacing: state.
       "oneCommand = $f ifTrue: [
	        ^state movesFoward: self. 
	]. 
       oneCommand = $b ifTrue: [
	       ^state movesBackward: self.
	].
       oneCommand = $r ifTrue: [
	       ^state := state rotateRight.
	]. 
        oneCommand = $l ifTrue: [
	       ^state := state rotateLeft.
	]. 
        ^self error: self class invalidCommand"! !

!MarsRover methodsFor: 'actions' stamp: 'CB 5/14/2023 13:51:05'!
notAValidCommand
        ^self error: self class invalidCommand! !

!MarsRover methodsFor: 'actions' stamp: 'CB 5/14/2023 13:28:23'!
readCommands: aCommandToTakeAction 
	aCommandToTakeAction ifEmpty:[^self].
	aCommandToTakeAction do: [ :oneCommand | self moves: oneCommand]
	
	
! !


!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:59:02'!
movesBackwardFacingEast 
       position := position  - (1@0)
        ! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:54:39'!
movesBackwardFacingNorth
       position := position + (0@-1)
        "direction = North  ifTrue: [
	        oneCommand = $f ifTrue:[
		position := position + (0@1).
		].
	       
	].
	
	
	direction = West ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position + (1@0).
		].
		(oneCommand = $b) ifTrue: [
		position := position - (1@0).
		].

	].
	direction = South ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (0@1).
		].
		(oneCommand = $b) ifTrue: [
		position := position  + (0@1).
		]
	].
	direction = East ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (1@0).
		].
		(oneCommand = $b) ifTrue: [
		.
		].
	].
	(oneCommand = $r) ifTrue: [
		direction := direction right
	].
	(oneCommand = $l) ifTrue: [
		direction := direction left.
	].
	"! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:55:09'!
movesBackwardFacingSouth
       position := position  + (0@1).
        "direction = North  ifTrue: [
	        oneCommand = $f ifTrue:[
		position := position + (0@1).
		].
	       
	].
	
	
	direction = West ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position + (1@0).
		].
		(oneCommand = $b) ifTrue: [
		position := position - (1@0).
		].

	].
	direction = South ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (0@1).
		].
		(oneCommand = $b) ifTrue: [
		
		]
	].
	direction = East ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (1@0).
		].
		(oneCommand = $b) ifTrue: [
		.
		].
	].
	(oneCommand = $r) ifTrue: [
		direction := direction right
	].
	(oneCommand = $l) ifTrue: [
		direction := direction left.
	].
	"! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:57:11'!
movesBackwardFacingWest 
       position := position + (1@0).
        "direction = North  ifTrue: [
	        oneCommand = $f ifTrue:[
		position := position + (0@1).
		].
	        oneCommand = $b ifTrue:[
		position := position + (0@-1).
		].
	].
	
	
	direction = West ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position + (1@0).
		].
		(oneCommand = $b) ifTrue: [
		position := position - (1@0).
		].

	].
	direction = South ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (0@1).
		].
		(oneCommand = $b) ifTrue: [
		position := position  + (0@1).
		]
	].
	direction = East ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (1@0).
		].
		(oneCommand = $b) ifTrue: [
		position := position  + (1@0).
		].
	].
	(oneCommand = $r) ifTrue: [
		direction := direction right
	].
	(oneCommand = $l) ifTrue: [
		direction := direction left.
	].
	"! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:58:47'!
movesFowardFacingEast 
       position := position  + (1@0)
        ! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:58:28'!
movesFowardFacingNorth
       position := position + (0@1)
        "direction = North  ifTrue: [
	        oneCommand = $f ifTrue:[
		position := position + (0@1).
		].
	       
	].
	
	
	direction = West ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position + (1@0).
		].
		(oneCommand = $b) ifTrue: [
		position := position - (1@0).
		].

	].
	direction = South ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (0@1).
		].
		(oneCommand = $b) ifTrue: [
		position := position  + (0@1).
		]
	].
	direction = East ifTrue: [
		(oneCommand = $f) ifTrue: [
		position := position - (1@0).
		].
		(oneCommand = $b) ifTrue: [
		.
		].
	].
	(oneCommand = $r) ifTrue: [
		direction := direction right
	].
	(oneCommand = $l) ifTrue: [
		direction := direction left.
	].
	"! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:58:13'!
movesFowardFacingSouth
       position := position  - (0@1).
       ! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 12:57:45'!
movesFowardFacingWest 
       position := position - (1@0).
        ! !

!MarsRover methodsFor: 'actions - private' stamp: 'CB 5/14/2023 13:42:37'!
rotate: newStateAfterRotate 
	  ^state := newStateAfterRotate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'CB 5/13/2023 17:18:28'!
invalidCommand
    ^'comando no valido para mover'! !

!MarsRover class methodsFor: 'instance creation' stamp: 'NH 5/13/2023 11:52:22'!
landsAt: aPosition facing: aDirection 

	^self new initializeLandsAt: aPosition facing: aDirection ! !


!classDefinition: #MarsRoverState category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRoverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: 'MarsRover-Ejercicio'!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'as yet unclassified' stamp: 'CB 5/14/2023 12:46:07'!
facing: aDirection

	^(self subclasses detect: [:aMarsRoverState | aMarsRoverState canHandle: aDirection ]) new! !


!classDefinition: #MarsRoverEastState category: 'MarsRover-Ejercicio'!
MarsRoverState subclass: #MarsRoverEastState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverEastState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:49:55'!
movesBackward: aMarsRover 
        ^aMarsRover movesBackwardFacingEast! !

!MarsRoverEastState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:50:04'!
movesFoward: aMarsRover 
        ^aMarsRover movesFowardFacingEast! !

!MarsRoverEastState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:50:00'!
rotateLeft 
        ^MarsRoverNorthState new! !

!MarsRoverEastState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:49:47'!
rotateRight
        ^MarsRoverSouthState new! !


!MarsRoverEastState methodsFor: 'accessing' stamp: 'CB 5/14/2023 13:00:10'!
direction
     ^#East! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverEastState class' category: 'MarsRover-Ejercicio'!
MarsRoverEastState class
	instanceVariableNames: ''!

!MarsRoverEastState class methodsFor: 'as yet unclassified' stamp: 'CB 5/14/2023 12:45:04'!
canHandle: aDirection
      ^aDirection = #East.! !


!classDefinition: #MarsRoverNorthState category: 'MarsRover-Ejercicio'!
MarsRoverState subclass: #MarsRoverNorthState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverNorthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:50:16'!
movesBackward: aMarsRover 
        ^aMarsRover movesBackwardFacingNorth! !

!MarsRoverNorthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:50:27'!
movesFoward: aMarsRover 
        ^aMarsRover movesFowardFacingNorth! !

!MarsRoverNorthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:07'!
rotateLeft 
        ^MarsRoverWestState new! !

!MarsRoverNorthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:18'!
rotateRight
        ^MarsRoverEastState new! !


!MarsRoverNorthState methodsFor: 'accesing' stamp: 'CB 5/14/2023 13:00:21'!
direction
     ^#North! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverNorthState class' category: 'MarsRover-Ejercicio'!
MarsRoverNorthState class
	instanceVariableNames: ''!

!MarsRoverNorthState class methodsFor: 'as yet unclassified' stamp: 'CB 5/14/2023 12:45:32'!
canHandle: aDirection
       ^aDirection = #North! !


!classDefinition: #MarsRoverSouthState category: 'MarsRover-Ejercicio'!
MarsRoverState subclass: #MarsRoverSouthState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverSouthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:27'!
movesBackward: aMarsRover 
        ^aMarsRover movesBackwardFacingSouth! !

!MarsRoverSouthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:37'!
movesFoward: aMarsRover 
        ^aMarsRover movesFowardFacingSouth! !

!MarsRoverSouthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:50'!
rotateLeft 
        ^MarsRoverEastState new! !

!MarsRoverSouthState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:51:57'!
rotateRight
        ^MarsRoverWestState new! !


!MarsRoverSouthState methodsFor: 'accessing' stamp: 'CB 5/14/2023 13:00:31'!
direction
     ^#South! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverSouthState class' category: 'MarsRover-Ejercicio'!
MarsRoverSouthState class
	instanceVariableNames: ''!

!MarsRoverSouthState class methodsFor: 'as yet unclassified' stamp: 'CB 5/14/2023 12:45:46'!
canHandle: aDirection
       ^aDirection = #South! !


!classDefinition: #MarsRoverWestState category: 'MarsRover-Ejercicio'!
MarsRoverState subclass: #MarsRoverWestState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverWestState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:52:28'!
movesBackward: aMarsRover 
        ^aMarsRover movesBackwardFacingWest! !

!MarsRoverWestState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:52:22'!
movesFoward: aMarsRover 
        ^aMarsRover movesFowardFacingWest! !

!MarsRoverWestState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:52:14'!
rotateLeft 
        ^MarsRoverSouthState new! !

!MarsRoverWestState methodsFor: 'actions' stamp: 'CB 5/14/2023 12:52:08'!
rotateRight
        ^MarsRoverNorthState new! !


!MarsRoverWestState methodsFor: 'accessing' stamp: 'CB 5/14/2023 13:00:41'!
direction
     ^#West! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWestState class' category: 'MarsRover-Ejercicio'!
MarsRoverWestState class
	instanceVariableNames: ''!

!MarsRoverWestState class methodsFor: 'as yet unclassified' stamp: 'CB 5/14/2023 12:45:57'!
canHandle: aDirection
       ^aDirection = #West! !
