!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'cb 6/3/2023 11:28:56'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self. 
	observers := OrderedCollection new  ! !


!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:26:55'!
headEast
	
	head := MarsRoverHeadingEast for: self.
	observers do: [:aTracker | aTracker updatesDirectionEast] ! !

!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:26:46'!
headNorth
	
	head := MarsRoverHeadingNorth for: self. 
	observers do: [:aTracker | aTracker updatesDirectionNorth] ! !

!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:26:29'!
headSouth
	
	head := MarsRoverHeadingSouth for: self.
	observers do: [:aTracker | aTracker updatesDirectionSouth] ! !

!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:26:09'!
headWest
	
	head := MarsRoverHeadingWest for: self.
	observers do: [:aTracker | aTracker updatesDirectionWest] 
	! !

!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:25:58'!
rotateLeft
	
	head rotateLeft.
	! !

!MarsRover methodsFor: 'heading' stamp: 'cb 6/3/2023 15:26:16'!
rotateRight
	
	head rotateRight.
	! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'cb 6/3/2023 15:01:56'!
moveBackward
	
	head moveBackward.
	observers do: [:aTracker | aTracker updatesPosition]! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'cb 6/3/2023 15:02:05'!
moveForward
	
	head moveForward.
	observers do: [:aTracker | aTracker updatesPosition]! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'observers' stamp: 'cb 6/3/2023 11:29:23'!
beingTrackedBy: aTracker
        observers add: aTracker! !


!MarsRover methodsFor: 'accesing' stamp: 'cb 6/3/2023 13:34:20'!
head
    ^head! !

!MarsRover methodsFor: 'accesing' stamp: 'cb 6/3/2023 13:34:27'!
position
     ^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverDirectionAndPositionLog category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverDirectionAndPositionLog
	instanceVariableNames: 'changesLog marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverDirectionAndPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 15:27:39'!
updatesDirectionEast
        changesLog add: 'East'
	! !

!MarsRoverDirectionAndPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 15:27:53'!
updatesDirectionNorth
        changesLog add: 'North'
	! !

!MarsRoverDirectionAndPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 15:28:20'!
updatesDirectionSouth
        changesLog add: 'South'
	! !

!MarsRoverDirectionAndPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 15:28:03'!
updatesDirectionWest
        changesLog add: 'West'
	! !

!MarsRoverDirectionAndPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:12:52'!
updatesPosition
        changesLog add: marsRover position! !


!MarsRoverDirectionAndPositionLog methodsFor: 'accesing' stamp: 'cb 6/3/2023 12:14:55'!
show
     ^changesLog! !


!MarsRoverDirectionAndPositionLog methodsFor: 'initialization' stamp: 'cb 6/3/2023 13:29:47'!
initializeTracking: aMarsRover
	changesLog := OrderedCollection new.
	marsRover := aMarsRover.
	aMarsRover beingTrackedBy: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionAndPositionLog class' category: 'MarsRover-WithHeading'!
MarsRoverDirectionAndPositionLog class
	instanceVariableNames: ''!

!MarsRoverDirectionAndPositionLog class methodsFor: 'as yet unclassified' stamp: 'cb 6/3/2023 12:16:52'!
tracking: aMarsRover 
	^self new initializeTracking: aMarsRover ! !


!classDefinition: #MarsRoverDirectionLog category: 'MarsRover-WithHeading'!
MarsRoverDirectionAndPositionLog subclass: #MarsRoverDirectionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverDirectionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:30:31'!
updatesPosition
    
          ! !


!classDefinition: #MarsRoverPositionLog category: 'MarsRover-WithHeading'!
MarsRoverDirectionAndPositionLog subclass: #MarsRoverPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:17'!
updatesDirectionEast
      ! !

!MarsRoverPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:14'!
updatesDirectionNorth
      ! !

!MarsRoverPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:10'!
updatesDirectionSouth
      ! !

!MarsRoverPositionLog methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:06'!
updatesDirectionWest
      ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPositionLog class' category: 'MarsRover-WithHeading'!
MarsRoverPositionLog class
	instanceVariableNames: ''!

!MarsRoverPositionLog class methodsFor: 'instance creation' stamp: 'cb 6/3/2023 11:26:11'!
tracking: aMarsRover 
	^self new initializeTracking: aMarsRover ! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #MarsRoverPositionAndDirectionWindow category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverPositionAndDirectionWindow
	instanceVariableNames: 'lastPositionChange lastDirectionChange marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionAndDirectionWindow methodsFor: 'initialization' stamp: 'cb 6/3/2023 13:32:32'!
initializeTracking: aMarsRover
      lastPositionChange := ''.
      lastDirectionChange := ''.
      marsRover := aMarsRover.
      aMarsRover beingTrackedBy: self.
     ! !


!MarsRoverPositionAndDirectionWindow methodsFor: 'accesing' stamp: 'cb 6/3/2023 13:03:02'!
show 
      |lastChanges|
      lastChanges := OrderedCollection new.
      lastChanges add: lastPositionChange.
      lastChanges add: lastDirectionChange.
      ^lastChanges
 
     ! !


!MarsRoverPositionAndDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 15:31:38'!
updatesDirectionEast
	lastDirectionChange := 'Apuntando al Este'
	! !

!MarsRoverPositionAndDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 15:32:25'!
updatesDirectionNorth
	lastDirectionChange := 'Apuntando al Norte'
	! !

!MarsRoverPositionAndDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 15:32:14'!
updatesDirectionSouth
	lastDirectionChange := 'Apuntando al Sur'
	! !

!MarsRoverPositionAndDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 15:31:50'!
updatesDirectionWest
	lastDirectionChange := 'Apuntando al Oeste'
	! !

!MarsRoverPositionAndDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:13:48'!
updatesPosition
       lastPositionChange := marsRover position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPositionAndDirectionWindow class' category: 'MarsRover-WithHeading'!
MarsRoverPositionAndDirectionWindow class
	instanceVariableNames: ''!

!MarsRoverPositionAndDirectionWindow class methodsFor: 'instance creation' stamp: 'cb 6/3/2023 12:56:02'!
tracking: aMarsRover
	^self new initializeTracking: aMarsRover ! !


!classDefinition: #MarsRoverDirectionWindow category: 'MarsRover-WithHeading'!
MarsRoverPositionAndDirectionWindow subclass: #MarsRoverDirectionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverDirectionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:27'!
updatesPosition
	! !


!MarsRoverDirectionWindow methodsFor: 'accesing' stamp: 'cb 6/3/2023 13:18:25'!
show
	^lastDirectionChange ! !


!classDefinition: #MarsRoverPositionWindow category: 'MarsRover-WithHeading'!
MarsRoverPositionAndDirectionWindow subclass: #MarsRoverPositionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:43'!
updatesDirectionEast
     ! !

!MarsRoverPositionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:39'!
updatesDirectionNorth
     ! !

!MarsRoverPositionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:35'!
updatesDirectionSouth
    ! !

!MarsRoverPositionWindow methodsFor: 'changes' stamp: 'cb 6/3/2023 20:32:32'!
updatesDirectionWest
  ! !


!MarsRoverPositionWindow methodsFor: 'accesing' stamp: 'cb 6/3/2023 13:18:39'!
show
	^lastPositionChange ! !
!classDefinition: #MarsRoverLogTest category: 'MarsRover-WithHeading-Test'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading-Test'!

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 11:44:01'!
test01MarsRoverTrackingPositionWithOneMovement
         |aMarsRover marsRoverLog theMarsRoverLog| 
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverPositionLog tracking: aMarsRover.
         aMarsRover process: 'f'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 1@2.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 11:44:15'!
test02MarsRoverTrackingPositionWithMoreThanOneMovement
         |aMarsRover marsRoverLog theMarsRoverLog| 
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverPositionLog tracking: aMarsRover.
         aMarsRover process: 'ff'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 1@2.
         theMarsRoverLog add: 1@3.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 11:52:10'!
test03MarsRoverTrackingDirectionWithOneMovement
         |aMarsRover marsRoverLog theMarsRoverLog|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverDirectionLog tracking: aMarsRover.
         aMarsRover process: 'r'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 'East'.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 12:05:28'!
test04MarsRoverTrackingDirectionWithMoreThanOneMovement
         |aMarsRover marsRoverLog theMarsRoverLog|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverDirectionLog tracking: aMarsRover.
         aMarsRover process: 'rl'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 'East'.
         theMarsRoverLog add: 'North'.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 20:31:11'!
test05MarsRoverTrackingPositionAndDirection
         |aMarsRover marsRoverLog theMarsRoverLog|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverDirectionAndPositionLog tracking: aMarsRover.
         aMarsRover process: 'fr'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 1@2.
         theMarsRoverLog add: 'East'.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !

!MarsRoverLogTest methodsFor: 'tests' stamp: 'cb 6/3/2023 15:42:27'!
test06MarsRoverTrackingPositionWithMovementsInDirectionAndPosition
         |aMarsRover marsRoverLog theMarsRoverLog|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverLog := MarsRoverPositionLog tracking: aMarsRover.
         aMarsRover process: 'fr'.
         theMarsRoverLog := OrderedCollection new.
         theMarsRoverLog add: 1@2.
         self assert: theMarsRoverLog equals: marsRoverLog show ! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading-Test'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading-Test'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRoverWindowTest category: 'MarsRover-WithHeading-Test'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading-Test'!

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 12:36:58'!
test01MarsRoverWindowTrackingPositionWithNoMovement
         |aMarsRover marsRoverWindow |
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverPositionWindow tracking: aMarsRover.
  
         self assert: '' equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 12:40:28'!
test02MarsRoverWindowTrackingPositionWithMovement
         |aMarsRover marsRoverWindow |
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverPositionWindow tracking: aMarsRover.
         aMarsRover process: 'f'.
         self assert: 1@2 equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 12:47:35'!
test03MarsRoverWindowTrackingDirectionWithNoMovement
         |aMarsRover marsRoverWindow |
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverDirectionWindow tracking: aMarsRover.
         self assert: '' equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 12:50:02'!
test04MarsRoverWindowTrackingDirectionWithMovement
         |aMarsRover marsRoverWindow |
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverDirectionWindow tracking: aMarsRover.
         aMarsRover process: 'r'.
         self assert: 'Apuntando al Este' equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 20:31:54'!
test05MarsRoverWindowTrackingPositionAndDirectionWithNoMovement
         |aMarsRover marsRoverWindow theMarsRoverWindow|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverPositionAndDirectionWindow tracking: aMarsRover.
         theMarsRoverWindow := OrderedCollection new.
         theMarsRoverWindow add: ''.
         theMarsRoverWindow add: ''.
         self assert: theMarsRoverWindow equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 20:31:54'!
test06MarsRoverWindowTrackingPositionAndDirectionWithMovementInPosition
         |aMarsRover marsRoverWindow theMarsRoverWindow|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverPositionAndDirectionWindow tracking: aMarsRover.
         aMarsRover process: 'f'.
         theMarsRoverWindow := OrderedCollection new.
         theMarsRoverWindow add: 1@2.
         theMarsRoverWindow add: ''.
         self assert: theMarsRoverWindow equals: marsRoverWindow show ! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'cb 6/3/2023 20:31:54'!
test07MarsRoverWindowTrackingPositionAndDirectionWithMovementInDirection
         |aMarsRover marsRoverWindow theMarsRoverWindow|
         aMarsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
         marsRoverWindow := MarsRoverPositionAndDirectionWindow tracking: aMarsRover.
         aMarsRover process: 'fr'.
         theMarsRoverWindow := OrderedCollection new.
         theMarsRoverWindow add: 1@2.
         theMarsRoverWindow add: 'Apuntando al Este'.
         self assert: theMarsRoverWindow equals: marsRoverWindow show ! !
