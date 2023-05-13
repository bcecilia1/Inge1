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


!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:08:57'!
test18MarsRoverFacingWestMovesFoward

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 1@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:09:02'!
test19MarsRoverFacingWestMovesBackwardsThreeTimes

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'bbb'.
	
	self assertMarsRover: aMarsRover IsAt: -3@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:09:06'!
test20MarsRoverFacingWestRotateRightOnce
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'r'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:09:11'!
test21MarsRoverFacingWestRotateRightTwice
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:03:04'!
test22MarsRoverFacingWestRotateRightThreeTimes
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:03:08'!
test23MarsRoverFacingWestRotateLeftOnce
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'l'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:09:15'!
test24MarsRoverFacingWestRotateLeftTwice
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing West at start' stamp: 'NH 5/13/2023 16:09:20'!
test25MarsRoverFacingWestRotateLeftTwice
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: West.
	aMarsRover readCommands: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: South! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 15:59:54'!
test00MarsRoverCreatedCorrectlyAtOriginFacingNorth

	|aMarsRover |

	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: ''.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:27'!
test01MarsRoverMovesFoward

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 0@1 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:32'!
test02MarsRoverMovesBackwards

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-1 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:36'!
test03MarsRoverRotatesLeft

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'l'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:42'!
test04MarsRoverRotatesRight

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'r'.

	self assertMarsRover: aMarsRover IsAt: 0@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:46'!
test05MarsRoverCreatedCorrectlyAt01MovesFowardFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@1 facing: North.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:50'!
test06MarsRoverCreatedCorrectlyAt33MovesFowardFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 3@3 facing: North.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 3@4 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:55'!
test07MarsRoverCreatedCorrectlyAt47MovesFowardFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 4@7 facing: North.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: 4@8 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:01:59'!
test08MarsRoverCreatedCorrectlyAt01MovesBackwardsFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@1 facing: North.
	aMarsRover readCommands: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:04'!
test09MarsRoverCreatedCorrectlyAt33MovesBackwardsFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 3@3 facing: North.
	aMarsRover readCommands: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 3@2 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:08'!
test10MarsRoverMovesFowardTwiceFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'ff'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:12'!
test11MarsRoverMovesFowardThreeTimesFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'fff'.
	
	self assertMarsRover: aMarsRover IsAt: 0@3 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:18'!
test12MarsRoverMovesBackwardsTwiceFacingNorth

	|aMarsRover|

	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'bb'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-2 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:24'!
test13MarsRoverMovesBackwardsThreeTimesFacingNorth

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'bbb'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-3 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:29'!
test14MarsRoverRotatesLeftTwice

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:33'!
test15MarsRoverRotatesLeftThreeTimes

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:37'!
test16MarsRoverRotatesRightTwice

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing North at start' stamp: 'NH 5/13/2023 16:02:58'!
test17MarsRoverRotatesRightThreeTimes

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: North.
	aMarsRover readCommands: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:32'!
test26MarsRoverFacingSouthMovesBackwards

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'bb'.
	
	self assertMarsRover: aMarsRover IsAt: 0@2 facing: South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:36'!
test27MarsRoverFacingSouthMovesFoward

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'ffff'.
	
	self assertMarsRover: aMarsRover IsAt: 0@-4 facing: South.! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:41'!
test28MarsRoverFacingSouthRotatesRightOnce

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'r'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:03:12'!
test29MarsRoverFacingSouthRotatesRightTwice

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'rr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:45'!
test30MarsRoverFacingSouthRotatesRightThreeTimes

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:50'!
test31MarsRoverFacingSouthRotatesLeftOnce

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'l'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: West! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:03:16'!
test32MarsRoverFacingSouthRotatesLeftTwice

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing South at start' stamp: 'NH 5/13/2023 16:09:54'!
test33MarsRoverFacingSouthRotatesLeftThreeTimes

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: South.
	aMarsRover readCommands: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: East! !


!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'NH 5/13/2023 16:09:58'!
test34MarsRoverFacingEastMovesFoward

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: East.
	aMarsRover readCommands: 'f'.
	
	self assertMarsRover: aMarsRover IsAt: -1@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'NH 5/13/2023 16:10:07'!
test35MarsRoverFacingEastMovesBackwards

	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: East.
	aMarsRover readCommands: 'b'.
	
	self assertMarsRover: aMarsRover IsAt: 1@0 facing: East! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'NH 5/13/2023 16:11:49'!
test36MarsRoverFacingEastRotatesRightThreeTimes
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: East.
	aMarsRover readCommands: 'rrr'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: South! !

!MarsRoverTest methodsFor: 'test w/MarsRover facing East at start' stamp: 'NH 5/13/2023 16:12:00'!
test37MarsRoverFacingEastRotatesLeftThreeTimes
	|aMarsRover|
	
	aMarsRover := MarsRover landsAt: 0@0 facing: East.
	aMarsRover readCommands: 'lll'.
	
	self assertMarsRover: aMarsRover IsAt: 0@0 facing: North! !


!classDefinition: #Direction category: 'MarsRover-Ejercicio'!
DenotativeObject subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!Direction methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 14:36:51'!
left
	self subclassResponsibility! !

!Direction methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 14:36:41'!
right
	self subclassResponsibility! !


!classDefinition: #East category: 'MarsRover-Ejercicio'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover-Ejercicio'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:58:09'!
left
	^South! !

!East class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:58:05'!
right
	^North! !


!classDefinition: #North category: 'MarsRover-Ejercicio'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover-Ejercicio'!
North class
	instanceVariableNames: 'uniqueinstance'!

!North class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:57:23'!
left

	^East! !

!North class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:57:28'!
right
	
	^West ! !


!North class methodsFor: '--** private fileout/in **--' stamp: 'NH 5/13/2023 16:15:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	uniqueinstance := nil.! !


!classDefinition: #South category: 'MarsRover-Ejercicio'!
Direction subclass: #South
	instanceVariableNames: 'right left'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover-Ejercicio'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:59:14'!
left
	^West! !

!South class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 16:08:38'!
right
	^East! !


!classDefinition: #West category: 'MarsRover-Ejercicio'!
Direction subclass: #West
	instanceVariableNames: 'right left'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover-Ejercicio'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:59:21'!
left
	^North! !

!West class methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 15:59:18'!
right
	^South! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'direction position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'initialization' stamp: 'NH 5/13/2023 15:50:51'!
initializeLandsAt: aPointInAMap facing: aDirection 
	
	position := aPointInAMap.
	direction := aDirection.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 12:18:04'!
currentDirection
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 12:11:02'!
currentPosition
	^ position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'NH 5/13/2023 16:07:23'!
readCommands: aCommand 
	aCommand ifEmpty:[^self].
	
	(direction = North) ifTrue: [
		(aCommand includesSubString:'f') ifTrue: [
		|timesToMoveFoward|
		timesToMoveFoward := aCommand size. 
		position := position + (0@timesToMoveFoward).
		].
		(aCommand includesSubString:'b') ifTrue: [
		|timesToMoveBackwards|
		timesToMoveBackwards := aCommand size. 
		position := position - (0@timesToMoveBackwards).
		].
	].
	direction = West ifTrue: [
		(aCommand includesSubString:'f') ifTrue: [
		|timesToMoveFoward|
		timesToMoveFoward := aCommand size. 
		position := position + (timesToMoveFoward@0).
		].
		(aCommand includesSubString:'b') ifTrue: [
		|timesToMoveBackwards|
		timesToMoveBackwards := aCommand size. 
		position := position - (timesToMoveBackwards@0).
		].

	].
	direction = South ifTrue: [
		(aCommand includesSubString:'f') ifTrue: [
		|timesToMoveFoward|
		timesToMoveFoward := aCommand size. 
		position := position - (0@timesToMoveFoward).
		].
		(aCommand includesSubString:'b') ifTrue: [
		|timesToMoveBackwards|
		timesToMoveBackwards := aCommand size. 
		position := position  + (0@timesToMoveBackwards).
		]
	].
	direction = East ifTrue: [
		(aCommand includesSubString:'f') ifTrue: [
		|timesToMoveFoward|
		timesToMoveFoward := aCommand size. 
		position := position - (timesToMoveFoward@0).
		].
		(aCommand includesSubString:'b') ifTrue: [
		|timesToMoveBackwards|
		timesToMoveBackwards := aCommand size. 
		position := position  + (timesToMoveBackwards@0).
		].
	].
	(aCommand includesSubString:'r') ifTrue: [
		|timesToRotate|
		timesToRotate := aCommand size. 
		timesToRotate timesRepeat:[direction := direction right].
		^direction
	].
	(aCommand includesSubString:'l') ifTrue: [
		|timesToRotate|
		timesToRotate := aCommand size. 
		timesToRotate timesRepeat:[direction := direction left].
		^direction
	].
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'NH 5/13/2023 11:52:22'!
landsAt: aPosition facing: aDirection 

	^self new initializeLandsAt: aPosition facing: aDirection ! !

North initializeAfterFileIn!