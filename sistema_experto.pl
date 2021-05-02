:-use_module(library(pce)). % libreria para trabajar modo gráfico
:-use_module(library(pce_style_item)).%activa los estilos de la libreria
:-pce_image_directory('./imagen1'). % Indica directorio donde se tiene la imagen para el programa
:- dynamic color/2.
resource(utc, image, image('utc.jpg')). % cargue de imagen
resource(li, image, image('li.jpg')).

mostrar_imagen(Pantalla, Imagen) :- new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(0,0)).
%interfaz principal
%
inicio:-


 new(D,dialog('SISTEMA EXPERTO UTC',size(800,2350))),% crea la ventana principal


new(Label1,label(text,'........................UNIVERSIDAD TRES CULTURAS.......................')),% label contenido texto información inicial
	send(Label1,colour,orange),
new(Label2,label(text,'.............................SISTEMAS EXPERTOS...............................')),
	send(Label2,colour,orange),
new(Label3,label(text,'.')),
	send(Label3,colour,blue),
new(Label4,label(text,'Bienvenido al sistema experto UTC')),
	send(Label4,colour,blue),
new(Label5,label(text,'para la orientacion sobre las carreras que se imparten en la institucion')),
	send(Label5,colour,blue),
new(Label6,label(text,'como "Sistemas" "Derecho" "turismo" "pedagogia".')),
	send(Label6,colour,blue),
new(Label7,label(text,'')),
	send(Label7,colour,blue),
new(Label8,label(text,'Creado por : David ramirez gomez')),
	send(Label8,colour,orange),
new(Label9,label(text,'                   Juan jose solano fragoso')),
	send(Label9,colour,orange),
new(Label10,label(text,'                   Jesus perez monroy')),
	send(Label10,colour,orange),
	new(Label12,label(text,'')),
	send(Label12,colour,blue),


 %llamada a los label declarados anteriorente
mostrar_imagen(D, li),
 send(D,append(Label1)),
 send(D,append(Label2)),
 send(D,append(Label3)),
 send(D,append(Label4)),
 send(D,append(Label5)),
 send(D,append(Label6)),
 send(D,append(Label7)),
 send(D,append(Label8)),
 send(D,append(Label9)),
 send(D,append(Label10)),
 send(D,append(Label12)),


 % declaracion de botones ventana principal

 new(Boton1,button('COMENZAR',and(message(@prolog,main),
 and(message(D,open),message(D,free))))),
 send(Boton1,colour,blue),
 new(Bcancelar,button('CANCELAR',and(message(D,destroy),message(D,free)))),

 

 send(Bcancelar,colour,blue),
 send(D,append(Boton1)),
 send(D,append(Bcancelar)),

 send(D,open_centered).
 :-inicio.

%llamada al metodo principal


main:-
	new(D2, dialog('SISTEMA EXPERTO UTC',size(500,400))),
	new(Label10, label(nombre,'')),send(Label10,colour,red),

        mostrar_imagen(D2, utc),


	new(@texto,label(text,'Una vez finalizado el TEST podras ver los resultados:')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),





%creación del boton para dar inicio al TEST.

	new(@boton,button('Da click si estas listo',message(@prolog,botones))),

	send(D2, append(Label10)),
	new(@btncarrera,button('¿diagnostica?')),
	send(D2, display,Label10,point(10,20)),
	send(D2, display,@boton,point(100,80)),
	send(D2, display,@texto,point(50,40)),
	send(D2, display,Salir,point(150,150)),
	send(D2, display,@respl,point(70,90)),
	send(D2,open_centered).


% Aqui se especifican las hipotesis de las vocaciones, se etsa haciendo
% uso del corte (!.) para que una vez validad una hipotesis se detenga y
%el resultado.
mostrar_imagen(D, li),
resultado(ingenieria_de_sistemas):-ingenieria_de_sistemas,!.
resultado(turismo):-turismo,!.
resultado(contabilidad):-contabilidad,!.
resultado(administracion):-administracion,!.
resultado(diseño):-diseño,!.
resultado(derecho):-derecho,!.
resultado(pedagogia):-pedagogia,!.
resultado(desconocido).  /* no existe */