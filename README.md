# EoloPlanner

Este proyecto es una aplicación distribuida formada por diferentes servicios que se comunican entre sí usando API REST, gRPC y RabbitMQ. La aplicación ofrece un interfaz web que se comunica con el servidor con API REST y WebSockets. 

Algunos servicios están implementados con Node.js/Express y otros con Java/Spring. Estas tecnologías deben estar instaladas en el host para poder construir y ejecutar los servicios. También se requiere Docker para ejecutar los servicios auxiliares (MySQL, MongoDB y RabbitMQ).

Para la construcción de los servicios y su ejecución, así como la ejecución de los servicios auxiliares requeridos se usan scripts implementados en Node.js. Posiblemente no sea el lenguaje de scripting más utilizado para este caso de uso, pero en este caso concreto facilita la interoperabilidad en varios SOs y es sencillo.

Esta solución está basada en el trabajo entregado por el alumno Miguel García Sanguino.

## Construir y publicar imagenes docker

Existe un script que construye y publica los servicios en dockerhub. Para esto es necesario tener Pack instalado en la maquina.
Para esto, solo ejecutar:

```bash
$ ./build-and-push.sh DOCKER_ID
```

## Ejecutar servicios

Una vez ejecutado el script, tendremos las imagenes creadas y publicadas en docker hub. Para ejecutar todos los servicios, es necesario utilizar el siguiente comando.

```
$ docker-compose -f docker-compose-prod.yml up en la carpeta raiz.
```

## Acceso servicios

Para el acceso a los servicios, se puede acceder al servidor en http://localhost:3000, y utilizar las ciudades ya creadas para ver que funciona todo correctamente.