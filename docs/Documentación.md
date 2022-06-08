---
title: Documentación de la práctica 4
author:
    - Sergio Quijano Rey
    - Fernando Valdés Navarro
    - Carlos Corts Valdivia
    - Ignacio Carvajal Herrera
date: 08/06/2022
geometry: margin = 3.0cm
---

# Resumen global del sistema

Antes de comenzar con los detalles de la aplicación, pensamos que es adecuado hacer una introducción sobre los objetivos globales de esta.

Nuestra aplicación sirve como punto de venta para una hipotética marca de coches, o taller de coches. En la parte del móvil (*Flutter*), tendremos una *app* de compra de automóviles. En dicha compra, podremos personalizar las distintas partes del coche (llantas, color, tapicería y extras), lo que supondrá cierto aumento en el precio.

En la aplicación web, permitiremos a los dueños del taller, marca de coches o parecidos, administrar modelos de coches o ciertas partes de la personalización.

Además, la aplicación web escrita en *Ruby on Rails* expondrá una `API REST` que será consumida por la aplicación móvil. De esta forma, la administración realizada desde la web tendrá un impacto directo, sin tener que modificar el código, en el catálogo que los usuarios tienen disponible desde el móvil.

Por tanto, estaremos manejando dos bases de códigos. En ambas, hemos usado *Github* como sistema de control de versiones. Al tener dos bases de códigos claramente separadas, hemos trabajado en dos repositorios:

1. Repositorio para la aplicación *Flutter* que se puede encontrar en [https://github.com/fervalnav/CarConfigurator](https://github.com/fervalnav/CarConfigurator)
2. Repositorio para la aplicación *web*, que se puede encontrar en [https://github.com/SergioQuijanoRey/CarConfiguratorWeb](https://github.com/SergioQuijanoRey/CarConfiguratorWeb)

En ambos repositorios hemos trabajado de la misma forma. Hemos usado *issues* para marcar las tareas pendientes. Hemos trabajado con distintas ramas, que hemos *mergeado* contra `master  | main` usando *pull requests*.

En esta práctica, se pedía que usáramos una herramienta como *Jira*. Sin embargo, optamos por los proyectos de *Github* por los siguientes motivos:

1. En las prácticas anteriores ya veníamos usando esta *feature* de *Github*, y por lo tanto, ya estábamos familiarizados con esta herramienta, como se puede comprobar en [https://github.com/fervalnav/CarConfigurator/projects/3](https://github.com/fervalnav/CarConfigurator/projects/3)
    - Notar que las antiguas *cards* ya no se encuentran en el proyecto, porque al empezar con la práctica 4 las hemos borrado, para partir desde cero
2. El uso de *issues* como tarjetas en el *Kanban* es directo, y por lo tanto, mucho más cómodo a nuestro parecer (desconociendo si otras herramientas como *Jira* permiten trabajar cómodamente con *issues*)
3. Al tener una lista de *checkboxes* en una *issue*, podemos convertir cada *checkbox* en una *issue* propia. Con esto podemos:
    - Dividir las tareas en subtareas, de forma que cuando estén en la columna *TO-DO* se puedan completar en menos de dos horas
    - Hacer un seguimiento del porcentaje de completado de tareas más complejas

Como se pide en el guión de la práctica, a continuación mostramos una captura de pantalla en la que se muestra el uso de esta herramienta:

![Ejemplo de uso de los proyectos de Github. Se puede ver claramente la ventaja de usar directamente esta herramienta, por su integración directa con las *issues* de Github, que ya veníamos usando para marcar tareas, definir las ramas que vamos a crear, ...](images/kanban.png)

Como se puede comprobar en los dos repositorios, los cuatro integrantes hemos trabajado en las dos bases de código. Así hemos podido avanzar más rápido, pues es claro que ambos proyectos son inter-dependientes (ie. para poder conectar *Flutter* con la API REST, primero necesitamos tener desarrollada dicha API).

Y en último lugar, como estamos trabajando con dos bases de código, que aunque estén conectadas, se han diseñado en paralelo (basta con tener en cuenta que la aplicación en *Flutter* la hemos diseñado y codificado, hasta cierto punto, mucho antes de diseñar la *app web* y *API REST*), deberemos mostrar los dos diseños por separado. Esto lo haremos en dos secciones claramente separadas, una para cada base de código.

\newpage

# Aplicación *Flutter*

## Notas iniciales

Como es lógico, hemos partido del código de la práctica anterior. Recordad que habíamos aplicado un patrón repositorio para los distintos elementos que necesitaban de persistencia, acompañado de una patrón *singleton* para hacer fácil su acceso sin tener que inyectar dependencias como parámetros en toda la cascada de métodos.

Es por esto que el cambio necesario para esta práctica es muy sencillo, basta con implementar los repositorios adecuados haciendo uso de la *API REST* desarrollada.

Además, los *tests* serán también sencillos, puesto que podemos usar los que ya teníamos en las clases que implementaban los repositorios en memoria. Podemos considerar estas clases como *mocks* de las clases que interactúan con la base de datos. Puesto que no nos interesa hacer las pruebas tocando directamente la base de datos que tenemos en producción (`clados.ugr.es` en nuestro caso).

Esto último se podría haber hecho usando una librería que *mockease* el acceso a la base de datos, pero como ya lo teníamos programado, consideramos que esto no es ni necesario ni interesante.

## Requisitos funcionales

A partir de los requisitos funcionales de la práctica pasada, desarrollamos estos en mayor detalle, en la siguiente tabla:

1. Gestión de configuraciones

|           |      |
| ---       | ---  |
| Nombre \| Id. RF | 1.1. Comenzar una configuración desde cero |
| Entrada      | Acción del usuario de crear una nueva configuración |
| Procesamiento | Se crea una configuración por defecto para mostrarla |
| Salida | Se muestra la vista con la nueva configuración por defecto. Se permite a partir de esta vista configurar el coche.|


|           |      |
| ---       | ---  |
| Nombre \| Id. RF | 1.2. Borrar una configuración creada |
| Entrada      | Identificador de la configuración a borrar. Debe existir ya en el sistema|
| Procesamiento | Se borra la configuración del sistema de persistencia de datos (en nuestro caso, base de datos `mysql`) |
| Salida | Mensaje de éxito o error según la operación se realice o no correctamente |

|           |      |
| ---       | ---  |
| Nombre \| Id. RF | 1.3 Modificar configuración ya existente |
| Entrada      | Identificador de la configuración existente y sus nuevos datos |
| Procesamiento | Se modifican los datos de la configuración en la persistencia de datos |
| Salida | Mensaje de error o éxito según como se haya desarrollado la operación |

|           |      |
| ---       | ---  |
| Nombre \| Id. RF | 1.4 Almacenar una configuración que se esté modificando actualmente |
| Entrada      | Identificador de la configuración que se está modificando, así como los datos seleccionados actualmente |
| Procesamiento | Se crea una nueva entrada en la base de datos si no hay una configuración con el identificador, o se modifican los datos de la configuración del mismo identificador |
| Salida | Mensaje de error o éxito según como se haya desarrollado la operación |

|           |      |
| ---       | ---  |
| Nombre \| Id. RF | 1.5 Previsualizar una configuración ya existente |
| Entrada      | Identificación de la configuración a visualizar |
| Procesamiento | Ninguno |
| Salida | Se muestran los datos, visualmente, de la configuración seleccionada, al usuario |

## Partes interesadas y sus preocupaciones

## Diagrama que muestra la arquitectura

### Diagramas de vistas

Como hacíamos en la práctica anterior, mostramos los diagramas de las vistas de la aplicación, para que sea más fácil comprender el funcionamiento de esta:

![Vista principal de la aplicación. Desde esta vista navegamos al resto de partes de la aplicación](images/flutter/main_view.drawio.png)

![Vista de selección de configuración](images/flutter/conf_view.drawio.png)

![Vista de selección de una componente](images/flutter/conf_componente_view.drawio.png)

### Diagramas de clases y de *Widgets*

Empezamos con el diagrama de clases:

<!-- TODO -- hay que cambiar esta imagen porque esta desactualizada -->

![Diagrama de clases de la aplicación](images/flutter/ds-diagramaclases.png)

Notar que es fácil la modificación, añadiendo las clases que implementan el patrón repositorio (que vienen dados por clases abstractas) usando la *API REST*.

Ahora mostramos el diagrama de *Widgets*:

![Diagrama de Widgets de la aplicación](images/flutter/ds-diagramaclases1.png)

## Criterios de calidad a partir de los requisitos no funcionales

\begin{itemize}
    \item \textbf{RNF 1. Seguro:} deben mantenerse protegidos los datos de los usuarios.
    \item \textbf{RNF 2. Evolutivo:} permitiendo añadir/eliminar/modificar partes configurables, opciones para una parte, métodos de pago, etc.
    \item \textbf{RNF 3. GUI amigable:} fácil de usar, intuitiva, destinada a un usuario medio.
\end{itemize}

## Diseño de las pruebas

\newpage

# Aplicación *Ruby on Rails*

## Notas iniciales

## Requisitos funcionales
    \item \textbf{RF 3. Gestión del catálogo:} este requisito queda pospuesto para futuras versiones, ya que sería necesario interactuar con una BD. Además, iría más destinado a un usuario con privilegios de administrador.
    \begin{itemize}
        \item \textbf{RF 3.1.} Añadir nueva parte configurable.
        \item \textbf{RF 3.2.} Eliminar parte configurable.
        \item \textbf{RF 3.3.} Modificar parte configurable (nombre, descripción, etc.).
        \item \textbf{RF 3.4.} Añadir nueva opción de una parte configurable.
        \item \textbf{RF 3.5.} Eliminar una opción de una parte configurable.
        \item \textbf{RF 3.6.} Modificar una opción de una parte configurable (nombre, descripción, fotos, etc.).
    \end{itemize}



|           |      |
| ---       | ---  |
| Nombre \| Id. RF | |
| Entrada      | |
| Procesamiento | |
| Salida | |


## Partes interesadas y sus preocupaciones

## Diagrama que muestra la arquitectura

A partir de estos diseños, ha sido fácil generar el código, usando principalmente la instrucción `rails generate scaffold` para escribir la cantidad mínima de código necesaria, siguiendo así un **Desarrollo Dirigido por Modelos** o *MDD* como hemos visto en teoría.

## Criterios de calidad a partir de los requisitos no funcionales

## Diseño de las pruebas

