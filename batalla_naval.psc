SubProceso crear_tablero (matriz, simbolo)  												// el nombre lo dice
	definir i Como Entero
	definir j Como Entero

	para i = 1 Hasta 10 Hacer
		para j = 1 Hasta 10 Hacer
			matriz[i,j] = simbolo
		FinPara
	FinPara
FinSubProceso

SubProceso mostrar_tablero(matriz) 														// Proceso para crear la matriz que usamos de tablero, a todos se le asigna un _
	Definir i Como Entero
	definir j como entero 
	
	Mostrar "*_______________________________________________________________*"
	para i = 1 Hasta 10 Hacer
		si (i < 10) entonces
			Mostrar sin saltar "  ", i
		FinSi
		si (i = 10) Entonces
			Mostrar Sin Saltar " ", i, ""
		FinSi
		para j = 1 Hasta 10 Hacer
			Mostrar Sin Saltar " |"
			Mostrar Sin Saltar " ",matriz[i,j], ""
			Mostrar Sin Saltar " |"
		FinPara
		Mostrar ""
	FinPara
	Mostrar " X/Y  1     2     3     4     5     6     7     8     9    10"
	Mostrar "*_______________________________________________________________*"	
FinSubProceso


SubProceso Bienvenida 																													// menu bienvenida
	Mostrar "Bienvenido a la batalla naval Jugador 1"
	Mostrar "INFORMACION IMPORTANTE"
	Mostrar ""
	Mostrar " | _ | -----> Asi se mostraran al inicio los espacios del tablero"
	Mostrar " Los espacios que hayas disparado tomaran una nueva forma:"
	Mostrar " | O | -----> Agua"
	Mostrar " | X | -----> Tocado"
	Mostrar " | # | -----> Hundido"
	Mostrar ""
	Mostrar "*Si le quedo claro presione una tecla para borrar este mensaje de su pantalla para pasar a explicarle como jugar*"
	Esperar Tecla
	Borrar Pantalla 
	Mostrar ""
	Mostrar "Explicacion breve"
	Mostrar "Usted dispone de 10 Flotas:"
	Mostrar " 1 portaaviones (4x1) ---> | P || P || P || P |"
	Mostrar " 2 cruceros (3x1)     ---> | C || C || C |"
	Mostrar " 3 destructores (2x1) ---> | D || D |"
	Mostrar " 4 submarinos (1x1)   ---> | S |"
	Mostrar "Y de un tablero de 10x10"
	Mostrar "Para poder ponerlos necesitamos que usted decida la orientacion de cada barco ya sea horizontal o vertical"
	Mostrar "Luego de colocarlos, usted debera mediante turnos disparar al tablero enemigo para hundir la flota enemiga"
	Mostrar "*Si le quedo claro presione una tecla para borrar este mensaje de su pantalla para pasar a jugar*"
	Esperar Tecla
	Borrar Pantalla 
FinSubProceso

SubProceso Asignacion (vector, N, iniciales)											// la uso para crear vectores con las letras de los barcos
	definir i Como Entero
	
	para i = 1 Hasta N Hacer
		vector[i] = iniciales
	FinPara	
FinSubProceso

Funcion VoH = orientacion 																// para elegir la orientacion 
	repetir
		Mostrar "Orientacion"
		Mostrar "H = Horizontal"
		Mostrar "V = Vertical"
		Leer VoH
		si (VoH= "h") Entonces
			VoH = "H"
		FinSi
		si (VoH = "v") Entonces
			VoH = "V"
		FinSi
		si (VoH <> "H" Y VoH <> "V") Entonces
			Mostrar " "
			Mostrar "Ingrese V o H, otra opcion no es correcta"
		FinSi
	Hasta Que (VoH = "H" o VoH = "V")
FinFuncion

SubProceso coordenadas(a Por Referencia, b Por Referencia)  // para tomar las dos coordenadas (y se fija que sean validas)
	Repetir
		Mostrar "Elija la posicion X:"
		Leer a
		si (a > 10 o a < 1) Entonces
			Mostrar "Ingrese una coordenada valida"
		FinSi
	Hasta Que (a >= 1 y a <= 10)
	
	Repetir
		Mostrar "Elija la posicion Y:"
		Leer b
		si (b > 10 o b < 1) Entonces
			Mostrar "Ingrese una coordenada valida"
		FinSi
	Hasta Que (b >= 1 y b <= 10)
FinSubProceso

SubProceso acomodarH (matriz, vector, coordenada1, coordenada2, tamaño)				// procedimiento que acomoda en horizontal el barco
	definir j Como Entero
	
		para j = coordenada2 Hasta coordenada2+tamaño-1 Hacer
			matriz[coordenada1,j] = vector[1]
		FinPara
	
FinSubProceso

SubProceso acomodarV (matriz, vector, coordenada1, coordenada2, tamaño)				//procedimiento que acomoda en vertical el barco
	definir i Como Entero
	
	para i = coordenada1 Hasta coordenada1+tamaño-1 Hacer
		matriz[i,coordenada2] = vector[1]
	FinPara
	
FinSubProceso

subproceso elige_flota (opc Por Referencia)
	Mostrar "Ingrese la inicial de la flota que quiere colocar"
	
	repetir
		Mostrar "P - Portaaviones"
		Mostrar "C - Crucero"
		Mostrar "D - Destructutor"
		Mostrar "S - Submarino"
		Leer opc
		
		Segun opc Hacer
			"p":
				opc = "P"
			"c":
				opc = "C"
			"d":
				opc = "D"
			"s":
				opc = "S"
		FinSegun
		
		Si No(opc = "P" o opc = "C" o opc = "D" o opc = "S") Entonces
			Mostrar ""
			Mostrar "Ingrese una letra valida"
		FinSi
		
	hasta que (opc = "P" o opc = "C" o opc = "D" o opc = "S")
	
FinSubProceso

subproceso quedan_flotas (contador Por Referencia)
	si contador > 0 Entonces
		contador = contador - 1
	FinSi
FinSubProceso

Funcion Ocupado = Ocupado_O_No (matriz, coordenada1, coordenada2, tamaño, or1)
	definir i Como Entero
	definir j Como Entero
	
	Ocupado = Falso
	si (or1 = "V") entonces
		para i = coordenada1 Hasta (coordenada1+tamaño-1) Hacer
			si (matriz[i,coordenada2] <> "_") Entonces
				Ocupado = Verdadero
			FinSi
		FinPara
	SiNo
		para j = coordenada2 Hasta (coordenada2+tamaño-1) Hacer
			si (matriz[coordenada1,j] <> "_") Entonces
				Ocupado = Verdadero
			FinSi
		FinPara
	Finsi
	
FinFuncion

Funcion separadito = verificar_separacion (matriz, a, b, tamaño, or1)
	definir i Como Entero
	definir j Como Entero
	
	separadito = Verdadero
	
	Si or1 = "H" Entonces
		Para i = a - 1 Hasta a + 1 Hacer 										// necesito que si fije la coordenada anterior y la posterior
			Para j = b - 1 Hasta b + tamaño Hacer							 	// antes le restaba 1 para q no se pase, ahora lo necesito
				Si i >= 1 Y i <= 10 Y j >= 1 Y j <= 10 Entonces
					// Evita revisar las casillas exactas donde va el barco
					Si No(a = i Y j >= b Y j < b + tamaño) Entonces
						Si matriz[i, j] <> "_" Entonces
							separadito = Falso
						FinSi
					FinSi
				FinSi
			FinPara
		FinPara
	Sino
		Para i = a - 1 Hasta a + tamaño Hacer
			Para j = b - 1 Hasta b + 1 Hacer
				Si i >= 1 Y i <= 10 Y j >= 1 Y j <= 10 Entonces
					// Evita revisar las casillas exactas donde va el barco
					Si No(b = j Y i >= a Y i < a + tamaño) Entonces
						Si matriz[i, j] <> "_" Entonces
							separadito = Falso
						FinSi
					FinSi
				FinSi
			FinPara
		FinPara
	FinSi
FinFuncion

SubProceso colocar_flota (nombre, matriz, vector, tamaño, contador Por Referencia, esCpu)
    definir or como Caracter				// variable para la orientacion
    definir PosX como Entero				// posicion a
	definir PosY como entero				// posicion b
	definir valido como logico			// validador logico para saber si se sale o no del mapa
	definir okupa Como logico 			// validador logico para saber si esta ocupado o no
	definir separacion Como Logico		// validador logico para saber si esta separado por un bloque

    Si contador > 0 Entonces
        Repetir								// verificador si es correcta la posicion y esta desocupado
            valido = Verdadero					// inicializo segun me convenga
			okupa = Falso 						//
			separadito = Verdadero				//
			
			Si No(esCpu) entonces
				or = orientacion					// solicito la orientacion
				coordenadas(PosX, PosY)				// solicito las coordenadas y empiezo a trabajar con ellas
			SiNo
				si azar(2) = 0 Entonces			// le pido al aleatorio que elija la orientacion de los barcos de la cpu
					or = "H"						// si es 0 es Horizontal
				SiNo
					or = "V"						// si es 1 es Vertical
				FinSi
				PosX = azar(10) + 1
                PosY = azar(10) + 1
			FinSi 
			
            //  Verificación de límites 
            Si or = "H" Entonces								// SI ES HORIZONTAL 
                Si PosY + tamaño - 1 > 10 Entonces							// se fija que no se exceda la suma de la segunda coordenada hasta la suma del tamaño menos 1 es decir hasta donde llega
					si No(esCpu) Entonces
						Mostrar " El barco se sale del mapa horizontalmente. Elija otra posición."
					FinSi
                    valido = Falso											// si se sale mi operador hace q se repita el ciclo y saltea las siguientes verificaciones
                FinSi
            Sino
                Si PosX + tamaño - 1 > 10 Entonces							// se fija que no se exceda la suma de la primera coordenada hasta la suma del tamaño menos 1 es decir hasta donde llega
                    si No(esCpu) Entonces
						Mostrar " El barco se sale del mapa verticalmente. Elija otra posición."
					FinSi
                    valido = Falso											// idem
                FinSi
            FinSi
			
			//  Verificación de superposición 
			Si valido = Verdadero Entonces
				okupa = Ocupado_O_No (matriz, PosX, PosY, tamaño, or)
				Si okupa = Verdadero Entonces
					si No(esCpu) Entonces 
						Mostrar "Esa posición ya está ocupada por otro barco. Intente otra vez."
					FinSi
					valido = Falso
				FinSi
			FinSi
			
			//  Verificación de separación mínima 
            Si valido = Verdadero Entonces
               separacion = verificar_separacion(matriz, PosX, PosY, tamaño, or)
				
                Si separacion = Falso Entonces
                    si No(esCpu) Entonces 
						Mostrar "Los barcos deben estar separados por al menos una casilla."
					FinSi
                    valido <- Falso
                FinSi
            FinSi
        Hasta Que (valido = Verdadero)
		
        //  Colocación del barco (solo si todo fue válido) 
        Si or = "H" Entonces
            acomodarH(matriz, vector, PosX, PosY, tamaño)
        Sino
            acomodarV(matriz, vector, PosX, PosY, tamaño)
        FinSi
		si No(esCpu) Entonces							//solo necesito que muestre si es mi tablero donde van los barcos y eso
			mostrar_tablero(matriz)      
			quedan_flotas(contador)
		SiNo											// pero si es cpu no quiero, solo quiero que se descuente
			quedan_flotas(contador)
		FinSi
		
    Sino
		si No(esCpu) Entonces
			Mostrar ""
			Mostrar sin saltar "*NO QUEDAN "
			Segun nombre Hacer
				"P": Mostrar "PORTAAVIONES*"
				"C": Mostrar "CRUCEROS*"
				"D": Mostrar "DESTRUCTORES*"
				"S": Mostrar "SUBMARINOS*"
			FinSegun
			Mostrar ""
		FinSi
    FinSi
FinSubProceso

SubProceso verificar_hundido(m1, m2, flota, a, b, contador Por Referencia)
    Definir i Como Entero
    Definir hundido Como Lógico
    
    hundido = Verdadero
    
    // Buscar ARRIBA desde donde disparé
    i = a - 1
    Mientras i >= 1 Y m1[i, b] = flota Hacer
        Si m2[i, b] <> "X" Y m2[i, b] <> "#" Entonces
            hundido = Falso
        FinSi
        i = i - 1
    FinMientras
    
    // Buscar ABAJO desde donde disparé
    i = a + 1
    Mientras i <= 10 Y m1[i, b] = flota Hacer
        Si m2[i, b] <> "X" Y m2[i, b] <> "#" Entonces
            hundido = Falso
        FinSi
        i = i + 1
    FinMientras
    
    // Buscar IZQUIERDA desde donde disparé
    i = b - 1
    Mientras i >= 1 Y m1[a, i] = flota Hacer
        Si m2[a, i] <> "X" Y m2[a, i] <> "#" Entonces
            hundido = Falso
        FinSi
        i = i - 1
    FinMientras
    
    // Buscar DERECHA desde donde disparé
    i = b + 1
    Mientras i <= 10 Y m1[a, i] = flota Hacer
        Si m2[a, i] <> "X" Y m2[a, i] <> "#" Entonces
            hundido = Falso
        FinSi
        i = i + 1
    FinMientras
    
    // Si está hundido, marcar TODO con "#"
    Si hundido Entonces
        // Marcar la posición actual
        m2[a, b] = "#"
        
        // Marcar ARRIBA
        i = a - 1
        Mientras i >= 1 Y m1[i, b] = flota Hacer
            m2[i, b] = "#"
            i = i - 1
        FinMientras
        
        // Marcar ABAJO
        i = a + 1
        Mientras i <= 10 Y m1[i, b] = flota Hacer
            m2[i, b] = "#"
            i = i + 1
        FinMientras
        
        // Marcar IZQUIERDA
        i = b - 1
        Mientras i >= 1 Y m1[a, i] = flota Hacer
            m2[a, i] = "#"
            i = i - 1
        FinMientras
        
        // Marcar DERECHA
        i = b + 1
        Mientras i <= 10 Y m1[a, i] = flota Hacer
            m2[a, i] = "#"
            i = i + 1
        FinMientras
        
        Mostrar "- Hundido -"
        contador = contador + 1
    FinSi
FinSubProceso

Funcion disparrow = juego_por_turnos (m1, m2, esCpu, contador Por Referencia, contador2 Por Referencia)
	definir DispX Como Entero
	definir DispY Como Entero

	
	disparrow = 0
	
	si No(esCpu) entonces
		Mostrar "Este es el tablero enemigo"
		mostrar_tablero(m2)
	SiNo
		Mostrar "Este es tu tablero"
		mostrar_tablero(m2)
	FinSi
	
	si No(esCpu) entonces
		repetir 
			Mostrar "Ponga las coordenadas donde quiere disparar"
				coordenadas(DispX,DispY) 
					Si No(m2[DispX,DispY] = "_") Entonces
						Mostrar "Ya disparaste en esta posicion, dispara nuevamente"
					FinSi
		Hasta Que (m2[DispX, DispY] = "_")
	SiNo
		repetir
			DispX = azar(10) + 1
			DispY = azar(10) + 1
		hasta que (m2[DispX, DispY] = "_")
	FinSi

	si (m1[DispX,DispY] = "_") Entonces
		m2[DispX, DispY] = "O"
		//Limpiar Pantalla
		Mostrar ""
		Mostrar "- Agua -"
	SiNo
		si (m1[DispX, DispY] = "P")  Entonces
			m2[DispX, DispY] = "X"
			Mostrar ""
			Mostrar "~ Tocado ~"
			verificar_hundido(m1, m2, "P", DispX, DispY, contador)
			disparrow = disparrow + 1
		FinSi
		
		si (m1[DispX, DispY] = "C") Entonces
			m2[DispX, DispY] = "X"
			Mostrar ""
			Mostrar "~ Tocado ~"
			verificar_hundido(m1, m2, "C", DispX, DispY, contador)
			disparrow = disparrow + 1
		FinSi
		
		si (m1[DispX, DispY] = "D") Entonces
			m2[DispX, DispY] = "X"
			Mostrar ""
			Mostrar "~ Tocado ~"
			verificar_hundido(m1, m2, "D", DispX, DispY, contador)
			disparrow = disparrow + 1
		FinSi
		
		si (m1[DispX, DispY] = "S") Entonces
			m2[DispX, DispY] = "#"
			Mostrar ""
			Mostrar "- Hundido -"
			verificar_hundido(m1, m2, "S", DispX, DispY, contador)
			disparrow = disparrow + 1
		FinSi
		
	FinSi
	contador2 = contador2 + 1
FinFuncion

SubProceso mostrar_victoria (m1, m2, cont1, cont2, cont3)
	Mostrar "Felicidades! Ganaste, destruiste toda la flota enemiga :D"
	mostrar_tablero(m1)
	mostrar_tablero(m2)
	Mostrar "Hiciste ", cont1, " disparos" 	
	Mostrar "De los cuales ", cont2, " fueron en el blanco ;)"
	mostrar "Y hundiste ", cont3, " flotas"
FinSubProceso

SubProceso mostrar_derrota (m1, m2, cont1, cont2, cont3)
	Mostrar "Lo lamento! Perdiste... la CPU destruyó toda tu flota  :,("
	mostrar_tablero(m1)
	mostrar_tablero(m2)
	Mostrar "La Cpu hizo ", cont1, " disparos" 	
	Mostrar "De los cuales ", cont2, " fueron en el blanco D:"
	mostrar "Y hundio ", cont3, " de tu flotas"
FinSubProceso



Algoritmo batalla_naval
	definir i Como Entero									// variables para recorrer los ciclos
	definir j Como Entero									// idem
	definir t1 Como Caracter								// matriz - tablero 1 J1
	definir t2 Como Caracter								// matriz - tablero 2 CPU
	definir t3 Como Caracter								// matriz - tablero 3 CPU (pero la que ve el jugador)
	definir t4 Como Caracter								// matriz auxiliar 
	definir portaaviones Como Caracter					// vector - flota 1
	definir crucero Como Caracter						// vector - flota 2
	definir destructor Como Caracter						// vector - flota 3
	definir submarino Como Caracter						// vector - flota 4
	definir flota Como Caracter							// variable para la flota elegida
	definir cant_p Como Entero							// las cantidades de cada flota
	definir cant_c Como Entero							//
	definir cant_d Como Entero							//
	definir cant_s Como Entero							//
	definir victoria Como Logico							// validador logico para saber cuando finaliza el juego
	definir derrota Como Logico							// validador logico para saber cuando finaliza el juego si pierde el J1
	definir disparos_efectivos Como Entero				// disparos del J1
	definir disparos_efectivos_CPU Como Entero			// disparos de la cpu
	Definir hundidos_J1 Como Entero						// contador de barcos hundidos del jugadir 1 
	Definir hundidos_CPU Como Entero						// contador de barcos hundidos de la cpu
	definir disparos_J1 Como Entero						// contador de disparos
	definir disparos_CPU Como Entero						// contador de disparos de la cpu
	
	//dimensiono todo en 10 x 10
	dimensionar t1[10,10]									// matriz del j1
	dimensionar t2[10,10]									// matriz que guarda la info del cpu
	Dimensionar t3[10,10]									// visual del cpu
	dimensionar t4[10,10]
	
	// necesito una tercera? si. UNA CUARTA?? si
	
	dimensionar portaaviones[4]							// dimensiono las flotas
	dimensionar crucero[3]									//
	dimensionar destructor[2]								//
	dimensionar submarino[1]								//
	
	Asignacion(portaaviones,4,"P")							// les asigno la inicial para que sepan cual es
	Asignacion(crucero,3,"C")								//
	Asignacion(destructor,2,"D")							//
	Asignacion(submarino,1,"S")								//
	
	Bienvenida												// Menu de bienvenida
	
	crear_tablero(t1, "_")									// creo el matriz tablero propio
	crear_tablero(t2, "_")									// y el del enemigo
	crear_tablero(t3, "_")									// este es el visual
	crear_tablero(t4, "_")									// auxiliar
	
	Mostrar "Este es su tablero 10 x 10"					// muestro el tablero al jugador
	mostrar_tablero(t1)										//
	
	cant_p = 1												// 1 portaaviones
	cant_c = 2												// 2 cruceros
	cant_d = 3												// 3 destructores
	cant_s = 4												// 4 submarinos
	
	repetir 
		elige_flota(flota)
		segun flota Hacer
			"P": 
				colocar_flota("P", t1, portaaviones, 4, cant_p, Falso)
            "C": 
				colocar_flota("C", t1, crucero, 3, cant_c, Falso)
            "D": 
				colocar_flota("D", t1, destructor, 2, cant_d, Falso)
            "S": 
				colocar_flota("S", t1, submarino, 1, cant_s, Falso)
		FinSegun
		
	hasta que (cant_p = 0 y cant_s = 0 y cant_d = 0 y cant_c = 0)
	
	
	cant_p = 1												// 1 portaaviones
	cant_c = 2												// 2 cruceros
	cant_d = 3												// 3 destructores
	cant_s = 4												// 4 submarinos
	
	// hasta aca coloco la flota del J1, ahora toca la de la cpu 
	
	Mostrar "Ahora la CPU esta colocando sus barcos"						// proceso de que la cpu ponga los barcos en Aleatorio
	
	colocar_flota("P", t2, portaaviones, 4, cant_p, Verdadero)
	Mostrar "."
	para i = 1 Hasta 2 Hacer
		colocar_flota("C", t2, crucero, 3, cant_c, Verdadero)
		Mostrar "."
	FinPara

	para i = 1 Hasta 3 Hacer
		colocar_flota("D", t2, destructor, 2, cant_d, Verdadero)
		Mostrar "."
	FinPara
	
	para i = 1 Hasta 4 Hacer
		colocar_flota("S", t2, submarino, 1, cant_s, Verdadero)
		Mostrar "."
	FinPara
	
	victoria = Falso
	derrota = Falso
	disparos_efectivos = 0
	disparos_efectivos_CPU = 0
	hundidos_J1 = 0
	hundidos_CPU = 0
	disparos_J1 = 0
	disparos_CPU = 0
	// ahora empiezan los cañonazos, que tengo que hacer ni idea pero bueno veremos dijo el ciego
	Repetir
		
		//primero va el jugador 1
		Mostrar ""
		Mostrar "Es tu turno!"
																													//mostrar_tablero(t2)   - ayuda para ver
		disparos_efectivos = disparos_efectivos + juego_por_turnos(t2,t3,Falso,hundidos_J1,disparos_J1)			// contador de los disparos, y la funcion que me devuelve +1 o 0 si le di o no
		Mostrar "Llevas ", disparos_efectivos, " disparos en el blanco ;)"		
		Mostrar ""
		mostrar_tablero(t3)
		
		// ahora va el enemigo 
		Mostrar "Ahora le toca al enemigo, presione una tecla para borrar pantalla"
		Esperar Tecla
		Limpiar Pantalla
		
		disparos_efectivos_CPU = disparos_efectivos_CPU + juego_por_turnos(t1,t4,Verdadero,hundidos_CPU,disparos_CPU)
		Mostrar "La cpu lleva ", disparos_efectivos_CPU, " disparos en tu balsa"
		mostrar_tablero(t4)
		
		Si(hundidos_J1 = 10) Entonces
			victoria = Verdadero
			Limpiar Pantalla
		FinSi
		
		Si (hundidos_CPU = 10) Entonces
			derrota = Verdadero
			Limpiar Pantalla
		FinSi
		
	Hasta Que (victoria = Verdadero o derrota = Verdadero)
	
	si (victoria = Verdadero) Entonces
		mostrar_victoria(t3,t2,disparos_J1,disparos_efectivos,hundidos_J1)
	FinSi
	
	si (derrota = Verdadero) Entonces
		mostrar_derrota(t4,t1,disparos_CPU, disparos_efectivos_CPU,hundidos_CPU)
	FinSi
	
FinAlgoritmo
