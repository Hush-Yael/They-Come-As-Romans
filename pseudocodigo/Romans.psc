Funcion crearArregloChars(listaChars,char1,char2,char3,char4,listaIndex)
	Dimension chars[4];
	chars[1] = char1; chars[2] = char2; chars[3] = char3; chars[4] = char4;
	Para i = 1 Hasta 4 Hacer listaChars[listaIndex,i] = chars[i]; Fin Para
Fin Funcion
	
Funcion crearArregloNums(listaNums,numChars,length)
	Para i = 1 Hasta length Hacer 
		Si i = length Entonces listaNums[i] = Subcadena(numchars,0,1);
		SiNo listaNums[i] = Subcadena(numchars,length - i + 1, length - i + 1); Fin Si
	Fin Para
Fin Funcion

Funcion res <- convertirArabigos(num,char1,char2,char3,char4)
	res = '';
	numInt = ConvertirANumero(num);
	si numInt > 0
		Para i = 1 Hasta numInt hacer
			Si i < 4 Entonces res = Concatenar(res,char1);
			SiNo
				Si i >= 4 & i < 9 entonces si i = 4 Entonces res = char2;
					sino
						si i = 5 entonces res = char3;
						sino res = concatenar(res,char1); finSi
					FinSi
				FinSi
				si i = 9 Entonces res = char4; FinSi
			Fin Si
		Fin Para
	FinSi
Fin Funcion

Funcion res <- concatenarResultados(numChars,length,listaChars)
	Dimension listaNums[length];
	crearArregloNums(listaNums,numChars,length);
	res = '';
	Para i = 1 Hasta length Hacer
		char = convertirArabigos(listaNums[i],listaChars[i,1],listaChars[i,2],listaChars[i,3],listaChars[i,4]);
		res = Concatenar(char,res);
	Fin Para
Fin Funcion

Funcion res <- returnRomanos(numChars,listaChars)
	res = '';
	length = Longitud(numChars);
	si numChars = '0' Entonces Escribir 'EL NÚMERO CERO NO EXISTE.'; fin si
	si length = 0 Entonces Escribir 'No se ha ingresado ningún número.'; fin si
	si length < 8 
		Si length = 7 Entonces
			Para i = 1 Hasta ConvertirANumero(Subcadena(numChars,0,1)) Hacer res = Concatenar(res,'M'); Fin Para
			newNumChars = Subcadena(numchars,2,length-1);
			Escribir newnumChars;
			res = Concatenar(res,'^');
			res = Concatenar(res,concatenarResultados(newNumChars,length-1,listaChars));
		SiNo res = concatenarResultados(numChars,length,listaChars); Fin Si
	sino
		Escribir 'Por motivos de flojera, y a falta de muchas funcionalidades que';
		Escribir 'los lenguajes de programación reales sí poseen, el autor de este';
		Escribir 'algoritmo no lo programó para retornar valores mayores a 9 millones.';
	FinSi
Fin Funcion

Funcion inicio(listaChars)
	Escribir 'Ingrese un número arábigo para convertirlo en romano.';
	Definir  numChar Como Caracter;
	Leer  numChars;
	res = returnRomanos(numChars,listaChars);
	Escribir res;
	Escribir '';
	Esperar 1 Segundos;
	Escribir '¿Otra vez?';
	Escribir 'Presione «Enter» para sí.';
	Definir tecla Como Caracter;
	Leer tecla;
	Limpiar Pantalla;
	Si tecla = '' Entonces inicio(listaChars);
	SiNo Escribir 'Vuelva pronto.'; Fin Si
Fin Funcion

Algoritmo Romans
	Dimension listaChars[6,4];
	crearArregloChars(listaChars,'I','IV','V','IX',1); crearArregloChars(listaChars,'X','XL','L','XC',2);
	crearArregloChars(listaChars,'C','CD','D','CM',3); crearArregloChars(listaChars,'M','IV^','V^','IX^',4);
	crearArregloChars(listaChars,'X^','XL^','L^','XC^',5); crearArregloChars(listaChars,'C^','CD^','D^','CM^',6);
	
	inicio(listaChars);
FinAlgoritmo