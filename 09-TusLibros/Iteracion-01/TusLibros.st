!classDefinition: #CarritoTest category: 'TusLibros'!
TestCase subclass: #CarritoTest
	instanceVariableNames: 'catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'set up' stamp: 'NH 6/8/2023 12:29:53'!
setUp

	catalogo := Catalogo new.
	catalogo agregarLibro: '0201113716'. 
	catalogo agregarLibro: '0201113717'. ! !


!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:34:39'!
test01CrearCarritoConCredencialesYaValidadasDevuelveCarritoVacio
	|carrito|
	
	carrito := Carrito con: catalogo.
	
	self assert: 0 equals: carrito cantidadProductos .
	
	! !

!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:40:11'!
test02AgregarAlCarritoDosCopiasDelMismoLibroEnCatalogoAlCarrito
	|carrito|
	carrito := Carrito con: catalogo.
	carrito agregarISBN: '0201113716' conCantidad: 2.
	
	
	self assert: 2 equals: carrito cantidadProductos.
	
	! !

!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:15:00'!
test03AgregarAlCarritoUnaCantidadNegativaDeCopiasDelMismoLibroEnCatalogoAlCarritoArrojaErrorDeCantidadInvalida
	
	|carrito|
	
	carrito := Carrito con: catalogo.
	
	self 
		should: [ carrito agregarISBN: '0201113716' conCantidad: -1]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Carrito descripcionDeCantidadInvalidaParaAgregarAlCarrito 
			equals: anError messageText].! !

!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:15:11'!
test04AgregarAlCarritoUnaCopiaDeLibroNoEnCatalogoAlCarritoArrojaErrorDeLibroNoEnCatalogo
	|carrito |

	
	carrito := Carrito con: catalogo.
	
	self 
		should: [ carrito agregarISBN: '9781506466781' conCantidad: 1]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Carrito descripcionDeLibroNoEnCatalogo 
			equals: anError messageText].! !

!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 13:12:25'!
test05VerificaQueProductoEstaEnCarritoConLaCantidadDeseada
	|carrito |

	carrito := Carrito con: catalogo.
	carrito agregarISBN: '0201113716' conCantidad: 1.
	carrito agregarISBN: '0201113717' conCantidad: 2.
	carrito agregarISBN: '0201113716' conCantidad: 2.

	
	self assert: 3 equals: (carrito cantidadDeCopiasDe: '0201113716'). 
	! !

!CarritoTest methodsFor: 'test' stamp: 'NH 6/8/2023 13:16:16'!
test06VerificaQueProductoQueNoFueAgregadoNoEstaEnCarrito
	|carrito |

	carrito := Carrito con: catalogo.
	carrito agregarISBN: '0201113716' conCantidad: 1.
	carrito agregarISBN: '0201113716' conCantidad: 2.
	
	self assert: 0 equals: (carrito cantidadDeCopiasDe: '0201113717'). 
	! !


!classDefinition: #CatalogoTest category: 'TusLibros'!
TestCase subclass: #CatalogoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CatalogoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:04:18'!
test01CrearUnNuevoCatalogoConTresLibros
	
	|catalogo|
	catalogo := Catalogo new.
	catalogo agregarLibro: '123456'.
	catalogo agregarLibro: '123457'.
	catalogo agregarLibro: '123458'.
	
	self assert: 3 equals: catalogo cantidad.! !

!CatalogoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:08:58'!
test02ConsultarLibroEnCatalogoDevuelveFalsoSiNoEsta
	
	|catalogo|
	catalogo := Catalogo new.
	catalogo agregarLibro: '123456'.
	catalogo agregarLibro: '123457'.
	catalogo agregarLibro: '123458'.
	
	self assert: false equals: (catalogo contiene: '123450').! !

!CatalogoTest methodsFor: 'test' stamp: 'NH 6/8/2023 12:07:23'!
test02ConsultarLibroEnCatalogoDevuelveVerdaderoSiEsta
	
	|catalogo|
	catalogo := Catalogo new.
	catalogo agregarLibro: '123456'.
	catalogo agregarLibro: '123457'.
	catalogo agregarLibro: '123458'.
	
	self assert: true equals: (catalogo contiene: '123456').! !


!classDefinition: #Carrito category: 'TusLibros'!
Object subclass: #Carrito
	instanceVariableNames: 'items catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'agregar' stamp: 'NH 6/8/2023 13:20:54'!
agregarISBN: unISBN conCantidad: unaCantidadDeCopias 
	
	self verificaQueCantidadEsValida: unaCantidadDeCopias.
	self verificaQueLibroEstaEnCatalogo: unISBN.
	
	unaCantidadDeCopias timesRepeat: [items add: unISBN].! !


!Carrito methodsFor: 'agregar private' stamp: 'NH 6/8/2023 11:31:06'!
cantidadInvalidaParaAgregar

	^ self error: self class descripcionDeCantidadInvalidaParaAgregarAlCarrito! !

!Carrito methodsFor: 'agregar private' stamp: 'NH 6/8/2023 12:16:50'!
libroNoEnCatalogo

	^ self error: self class descripcionDeLibroNoEnCatalogo! !

!Carrito methodsFor: 'agregar private' stamp: 'NH 6/8/2023 13:20:32'!
verificaQueCantidadEsValida: unaCantidadDeCopias

	^ (unaCantidadDeCopias <1) ifTrue: [self cantidadInvalidaParaAgregar]! !

!Carrito methodsFor: 'agregar private' stamp: 'NH 6/8/2023 13:20:54'!
verificaQueLibroEstaEnCatalogo: unISBN

	^ (catalogo contiene: unISBN) ifFalse: [self libroNoEnCatalogo]! !


!Carrito methodsFor: 'informacion del carrito' stamp: 'NH 6/8/2023 13:15:09'!
cantidadDeCopiasDe: unISBN
	^items occurrencesOf: unISBN.! !

!Carrito methodsFor: 'informacion del carrito' stamp: 'NH 6/8/2023 13:14:13'!
cantidadProductos
	^ items size.	  ! !


!Carrito methodsFor: 'initializatin' stamp: 'NH 6/8/2023 13:13:38'!
initializeCon: unCatalogo
	catalogo := unCatalogo.
	items := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: 'TusLibros'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'instance creation' stamp: 'NH 6/8/2023 12:12:04'!
con: aCatalogo 

	^self new initializeCon: aCatalogo ! !


!Carrito class methodsFor: 'error description' stamp: 'NH 6/8/2023 11:35:31'!
descripcionDeCantidadInvalidaParaAgregarAlCarrito
	^'Debe agregar una cantidad mayor o igual que 1 del libro'! !

!Carrito class methodsFor: 'error description' stamp: 'NH 6/8/2023 11:42:44'!
descripcionDeLibroNoEnCatalogo
	^'Debe agregar un libro en Catalogo'! !


!classDefinition: #Catalogo category: 'TusLibros'!
Object subclass: #Catalogo
	instanceVariableNames: 'catalogoDeISBN'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Catalogo methodsFor: 'initialization' stamp: 'NH 6/8/2023 12:05:44'!
initialize
	catalogoDeISBN := OrderedCollection new.! !


!Catalogo methodsFor: 'testing' stamp: 'NH 6/8/2023 12:06:08'!
cantidad
	^catalogoDeISBN size ! !

!Catalogo methodsFor: 'testing' stamp: 'NH 6/8/2023 12:08:36'!
contiene: unISBN 
	^catalogoDeISBN includes: unISBN.! !


!Catalogo methodsFor: 'adding' stamp: 'NH 6/8/2023 12:05:10'!
agregarLibro: unISBN
	catalogoDeISBN add: unISBN.! !
