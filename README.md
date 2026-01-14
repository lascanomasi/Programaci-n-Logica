COLOQUIO 
    Ejercicio Práctico: Batalla Naval 
      Objetivo del trabajo 
        Desarrollar un programa en PSeInt que simule el juego Batalla Naval, aplicando el uso 
        de matrices, vectores, procedimientos y funciones para organizar el código y resolver 
        las distintas partes del problema. 
    Descripción del juego 
        La Batalla Naval es un juego de estrategia entre dos jugadores que colocan barcos en 
        un tablero y tratan de adivinar la ubicación de los barcos del adversario disparando 
        coordenadas. 
        
   Cada jugador dispone de: 
    • Un tablero de 10 x 10 posiciones. 
    • Una flota compuesta por: 
    o 1 Portaaviones (ocupa 4 casillas) 
    o 2 Cruceros (ocupan 3 casillas) 
    o 3 Destructores (ocupan 2 casillas) 
    o 4 Submarinos (ocupan 1 casilla) 
  Los barcos pueden colocarse en posición horizontal o vertical, sin superponerse ni 
  tocarse entre sí (deben dejar al menos una casilla de separación en todas direcciones). 
  El objetivo del juego es hundir todos los barcos del oponente antes de que él hunda los 
  tuyos. 
  
Requisitos del programa 
  1. Inicialización: 
    o Crear y llenar las matrices que representarán los tableros de cada 
    jugador. 
    o Cada casilla debe tener un valor que indique su estado (agua, barco, 
    tocado, hundido, disparo errado, etc.).
  2. Colocación de barcos: 
    o Permitir al jugador colocar manualmente sus barcos eligiendo: 
    § Fila y columna de inicio. 
    § Orientación (horizontal o vertical). 
    o El programa debe validar que la posición sea válida (sin superposición ni 
    salida del tablero). 
    o Los barcos del oponente (CPU) se colocarán de forma automática y 
    aleatoria cumpliendo las mismas reglas. 
  3. Desarrollo del juego: 
    o El juego se desarrolla por turnos alternados. 
    o En cada turno, el jugador elige una coordenada para disparar. 
    o El programa debe indicar si el disparo fue: 
    § Agua (no impacta ningún barco), 
    § Tocado (impacta una parte de un barco), 
    § Hundido (todas las partes de un barco fueron alcanzadas). 
    o El tablero del rival se muestra oculto, revelando únicamente los 
    resultados de los disparos realizados (no se muestran barcos intactos). 
  4. Finalización: 
    o El juego termina cuando uno de los dos jugadores hunde toda la flota 
    del contrario. 
    o El programa debe mostrar un mensaje con el ganador y un resumen final 
    con la cantidad de disparos realizados, aciertos y barcos hundidos.

  Estructuras sugeridas 
    • Dos matrices de 10x10: una para el jugador y otra para el oponente. 
    • Un vector con los tamaños de los barcos para facilitar la colocación. 
    • Variables auxiliares para contar disparos, aciertos, errores y barcos restantes.

  Modularización requerida 
    Deberán implementarse procedimientos y funciones para dividir el programa en partes 
    más pequeñas y reutilizables. 
    Por ejemplo: 
      • Procedimientos para inicializar, mostrar o colocar barcos. 
      • Funciones para validar posiciones, verificar disparos o determinar si un barco 
      fue hundido. 
      El uso correcto de procedimientos y funciones será evaluado como parte fundamental 
      del trabajo. 
      
  Condiciones de validación 
    • No se permiten coordenadas fuera del rango del tablero. 
    • No se pueden repetir disparos sobre una misma casilla. 
    • Los barcos no pueden colocarse en posiciones ocupadas ni adyacentes a otros 
    barcos. 
    • El programa debe controlar los mensajes de error y permitir volver a intentar las 
    entradas inválidas. 
  Requisitos opcionales (para quienes deseen ampliar) 
    • Implementar una versión Jugador vs Jugador. 
    • Incorporar niveles de dificultad en la CPU. 
    • Mostrar estadísticas del juego al finalizar (porcentaje de aciertos, cantidad de 
    turnos, etc.). 
    • Permitir elegir el tamaño del tablero o la cantidad de barcos. 
  Criterios de evaluación 
    • Correcto uso de procedimientos y funciones. 
    • Validaciones completas de posiciones, disparos y límites. 
    • Lógica clara en la secuencia de juego. 
    • Orden y claridad del código (nombres descriptivos, comentarios, sangrías). 
    • Presentación de resultados comprensible y ordenada.
      
