# Repositorio de ejercicios para Ingeniería de Software I - FCEyN, UBA

Integrantes: Cecilia Bolaños, Noé Hsueh

## Ejercicio 0: Números de peano

## Ejercicio 1: Código repetido

## Ejercicio 2: Números

<details>
  <summary>Consigna</summary>

### Ejercicio 2.1. Pre números

Abrir el ejercicio [pre-numeros-ejercicios.st](http://pre-numeros-ejercicios.st/) y utilizar los pasos para eliminar ifs para quitar los ifs de ese modelo y que sigan pasando los tests. Practiquen seguir los pasos todo lo que puedan utilizando ese modelo que es bastante sencillo de entender y seguir.

1. Crear una jerarquía polimórfica con una abstracción para cada condición de if (opcional).

2. Mover el cuerpo de cada if a cada abstracción correspondiente usando el mismo mensaje.

3. Nombrar las abstracciones de 1)

4. Nombrar el mensaje de 2)

5. Reemplazar ifs por envío de mensaje polimórfico.

6. Buscar objeto polimórfico (opcional).**

7. Verificar su solución con pre-numeros-ejercicios Solu.st (dentro de Ejercicio Numeros.zip) y sacar conclusiones del uso de la técnica...

### Ejercicio 2.2. Números

3. Leer consigna.txt (dentro de Ejercicio Numeros.zip) para repasar lo que les conté ayer en clase. Deben abrir el modelo de Numeros-Ejercicio.st (que es una versión bastante más avanzada de pre-números) y primero que nada intentar hacer pasar los tests que fallan escribiendo ifs (utilizando el mensaje isKindOf:). Una vez que pasen dichos tests, utilicen los pasos para sacar los ifs que uds. mismos escribieron, y que los tests sigan pasando. La idea es practicar quitar ifs, con lo que no hagan cosas para escribir menos ifs como restar usando la suma negada, o dividir multiplicando por el inverso, porque practican menos...

4. Sacar los ifs de Fibonacci.

5. Intentar sacar todos los otros ifs que encuentren (y no estén marcados como que no se deben sacar).

De 3 a 5 vamos a estar trabajando en clase el lunes. De todas formas todo lo que quieran/puedan avanzar en sus casas suma para tener mejores preguntas y dudas.

La entrega del ejercicio de Números es el jueves que viene.

En esta oportunidad la contraseña para abrir el zip en cuestión y obtener todos estos .st es: peaches,peaches

</details>

</details>



## Ejercicio 3: Stack

<details>
 <summary>Consigna</summary>
El ejercicio tiene dos partes:

a) El objetivo de la primera parte es encarar un primer modelado de un problema y seguir ejercitando reemplazar if por polimorfismo, en particular implementando un Stack.

Hay que hacer pasar todos los tests del ejercicio y la implementación del Stack no debe tener if.

No se pueden modificar los tests.

Ayudas:
1) Primero hagan pasar todos los tests usando if y después apliquen la técnica para sacar if que vimos.
2) Si les sirve, utilicen una metáfora. Una muy útil es la de representar el juego de los bebes donde se apilan platos en una especie de torre de Hanoi.

Importante: Tampoco se puede usar handleo de excepciones para ocultar lo que sería en definitiva un if.

b) El Stack de la primera parte es utilizado para almacenar oraciones de cualquier longitud. 

Se debe implementar el mensaje find (elección de nombre del mensaje y colaboradores externos es parte del ejercicio) 
de SentenceFinderByPrefix que dado un prefijo se encarga de devolver todas las oraciones almacenadas en el Stack que contengan dicho prefijo.

Por ej. si el prefijo es 'Wint', y las oraciones en el Stack son 'winter is coming', 'winning is everything', 'The winds of Winter' y 'Winter is here' sólo debería devolver la última.

El prefijo es case sensitive, no puede ser vacío, ni contener espacios vacíos y el Stack al terminar la operación de búsqueda debe de mantener las mismas oraciones en idéntico orden.

La implementación de find debe ser lo más declarativa posible.

Además de implementar find, se debe testear dicha funcionalidad. Para ello escriba todos los tests que crea necesario en SentenceFinderByPrefixTest.

Aclaración: No se pueden agregar mensajes adicionales a Stack y la idea es se trabaje sobre el stack original y no clonarlo, ni transformarlo en otro tipo de colección para utilizarlo. La respuesta del sentenceFinder podría ser una OrderedCollection con las oraciones encontradas.
</details>
