!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo negativeOneHalf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:08:06'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:48'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:15:37'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:16:19'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2020 02:23:47'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/24/2020 02:23:22'!
setUp

	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	negativeOneHalf := Numero with: negativeOne over: two
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:31:24'!
* aMultiplier 
	self subclassResponsibility 
	"(type = #Entero and: [aMultiplier type = #Entero]) ifTrue:	
		[ ^self class with: value * aMultiplier integerValue ].
		
	(type = #Fraccion and: [aMultiplier type = #Fraccion]) ifTrue:
		[ ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
		
	self error: 'Tipo de número no soportado'"
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:28:22'!
+ anAdder 
	self subclassResponsibility 
	"(type = #Entero and: [anAdder type = #Entero]) ifTrue:
		[ ^self class with: value + anAdder integerValue ].
	
	(type = #Fraccion and: [anAdder type = #Fraccion]) ifTrue:
		[ | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ].
	
	self error: 'Tipo de número no soportado'"
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:31:04'!
// aDivisor 
	self subclassResponsibility 
	"type = #Entero ifTrue:
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de número no soportado'"! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/9/2019 16:21:17'!
greatestCommonDivisorWith: anEntero 
	
	type = #Entero ifTrue:
		[^self class with: (value gcd: anEntero integerValue)].
		
	self error: 'Tipo de número no soportado'! !

!Numero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:34:44'!
negated
	self subclassResponsibility 
	"type = #Entero ifTrue:
		[ ^self * (self class with: -1) ].
	type = #Fraccion ifTrue:
		[ ^self class with: numerator * (self class with: -1) over: denominator ]."! !

!Numero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:36:55'!
printOn: aStream
	self subclassResponsibility 
	"type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ]."! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'testing' stamp: 'N 4/16/2023 21:31:58'!
isNegative
	self subclassResponsibility 
	"type = #Entero ifTrue:
		[ ^value < 0 ].
	type = #Fraccion ifTrue:
		[ ^denominator < 0 ]."! !

!Numero methodsFor: 'testing' stamp: 'N 4/16/2023 21:32:01'!
isOne
	self subclassResponsibility
	"type = #Entero ifTrue:
		[ ^value = 1 ].
	type = #Fraccion ifTrue:
		[ ^false ]."! !

!Numero methodsFor: 'testing' stamp: 'N 4/16/2023 21:32:05'!
isZero
	self subclassResponsibility
	"type = #Entero ifTrue:
		[ ^value = 0 ].
	type = #Fraccion ifTrue:
		[ ^false ]."! !


!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:14'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:23'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !


!Numero methodsFor: 'comparing' stamp: 'N 4/16/2023 21:31:34'!
= anObject
	self subclassResponsibility 
	"^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]"! !

!Numero methodsFor: 'comparing' stamp: 'N 4/16/2023 21:31:48'!
hash
	self subclassResponsibility 
	"type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ]."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:49:48'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !


!Numero class methodsFor: 'instance creation' stamp: 'N 4/16/2023 21:21:02'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^Entero new initializeWith: aValue
	"^self new initializeWith: aValue"! !

!Numero class methodsFor: 'instance creation' stamp: 'N 4/16/2023 21:21:27'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'testing' stamp: 'N 4/16/2023 20:52:41'!
isNegative
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'N 4/16/2023 20:55:08'!
isOne
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'N 4/16/2023 20:49:53'!
isZero
	^value = 0 ! !


!Entero methodsFor: 'comparing' stamp: 'N 4/16/2023 21:05:07'!
=anObject

^(anObject isKindOf: self class) and: [ type = anObject type and: [value = anObject integerValue]]
		! !

!Entero methodsFor: 'comparing' stamp: 'N 4/16/2023 20:58:29'!
hash
	^value hash! !


!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:45:14'!
*aMultiplier
	(aMultiplier class = self class) ifTrue:	
		[ ^Numero with: value * aMultiplier integerValue ].
	
	^self error: 'Tipo de número no soportado'! !

!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:43:37'!
+anAdder
	(anAdder class = self class) ifTrue:
		[ ^Numero with: value + anAdder integerValue ].
	self error: 'Tipo de número no soportado'! !

!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:37:56'!
//aDivisor 
	^Numero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:38:04'!
greatestCommonDivisorWith: anEntero 
	
	^Numero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:35:15'!
negated
	^self * (Numero with: -1) ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:36:11'!
printOn: aStream
	aStream print: value! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'testing' stamp: 'N 4/16/2023 20:53:08'!
isNegative
	^denominator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'N 4/16/2023 20:55:34'!
isOne
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'N 4/16/2023 20:51:16'!
isZero
	^false! !


!Fraccion methodsFor: 'comparing' stamp: 'N 4/16/2023 21:06:38'!
=anObject
	^(anObject isKindOf: self class) and: [ type = anObject type and: [(numerator * anObject denominator) = (denominator * anObject numerator)]]
	! !

!Fraccion methodsFor: 'comparing' stamp: 'N 4/16/2023 20:58:13'!
hash
	^(numerator hash / denominator hash) hash ! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:46:09'!
* aMultiplier 
	(aMultiplier class = self class) ifTrue:
		[ ^Numero with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
		
	self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:48:20'!
+anAdder

	(anAdder class = self class) ifTrue:
			[ | newNumerator newDenominator |
			
			newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
			newDenominator := denominator * anAdder denominator.
			
			^ Numero with: newNumerator over: newDenominator ].
		
		self error: 'Tipo de número no soportado'
		! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:33:58'!
// aDivisor 
		
	self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:33:40'!
greatestCommonDivisorWith: anEntero 
	
	self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:34:31'!
negated		
	^Numero with: numerator * (self class with: -1) over: denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'N 4/16/2023 21:36:44'!
printOn: aStream
	
	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !
