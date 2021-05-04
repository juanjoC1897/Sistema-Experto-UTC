:-use_module(library(pce)). % libreria para que se muestre la interfaz
:-use_module(library(pce_style_item)).% se ocupa para estilos de letra y colores
:-pce_image_directory('./imagen1'). % acceso a donde se tiene guardada la carpeta de la imagen
:- dynamic color/2. %Numero de colores que se utilizan
resource(pizarronutc, image, image('pizarronutc.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('li.jpg')).

imagen_portada(Pantalla, Imagen) :- new(Figura, figure),                  %variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(0,0)).


inicio:- %Inicio de nuestro programa, creando el objeto de dialogo con la variable D



 new(D,dialog('SISTEMA EXPERTO UTC',size(800,2350))),% inicio de nuestra interfaz principal


new(Label1,label(text,'..........................UNIVERSIDAD TRES CULTURAS.......................')),% muestra texto dentro de los label

	send(Label1,colour,red), %sirve para poner los colores en las letras
new(Label2,label(text,'................................SISTEMAS EXPERTOS...............................')),
	send(Label2,colour,red),
new(Label3,label(text,'.')),
	send(Label3,colour,blue),
new(Label4,label(text,'                          Bienvenido al sistema experto UTC')),
	send(Label4,colour,blue),
new(Label5,label(text,'Sistema de orientación sobre las carreras que se imparten en la UTC.')),
	send(Label5,colour,blue),
new(Label6,label(text,'                       Suerte con las preguntas que te hare!!!')),
	send(Label6,colour,blue),
new(Label7,label(text,'')),
	send(Label7,colour,blue),
new(Label8,label(text,'Integrantes del equipo : David Ramirez Gomez')),
	send(Label8,colour,red),
new(Label9,label(text,'                                  Juan Jose Solano Fragoso')),
	send(Label9,colour,red),
new(Label10,label(text,'                                  Jesus Perez Monroy')),
	send(Label10,colour,red),
	new(Label12,label(text,'')),
	send(Label12,colour,blue),


 %llama a los label y los adjunta para mostrarlos en la ventana principal
imagen_portada(D, li),
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

%crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
 new(Boton1,button('Iniciar',and(message(@prolog,principal),
 and(message(D,open),message(D,free))))),
 send(Boton1,colour,blue),
 new(Bcancelar,button('Anular',and(message(D,destroy),message(D,free)))),
 send(Bcancelar,colour,blue),

 new(Boton2,button('Ayuda',and(message(@prolog,main1),
 and(message(D,open),message(D,free))))),
 send(Boton2,colour,blue),
%llamada de los botones para que se muestren en la interfaz
 send(D,append(Boton1)),
 send(D,append(Bcancelar)),
 send(D,append(Boton2)),
  send(D,open_centered).
