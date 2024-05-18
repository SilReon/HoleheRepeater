# HoleheRepeater

Una herramienta que automatiza la búsqueda OSINT de correos registrados en dominios populares.
Esta herramienta utiliza la red TOR para evitar posibles bloqueos o interferencias al enviar multiples consultas.

## Tabla de Contenidos
- [Requerimientos](#requerimientos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Créditos](#créditos)

## Requerimientos

Para su uso se necesita la instalación de:


```bash
holehe
proxychains
tor
curl
```

## Instalacion

Instalar por consola

```bash
sudo apt install proxychains tor
```

Clonar e instalar el repositorio [Holehe](https://github.com/megadose/holehe)

## Uso

En un archivo colocar todos los correos a los cuales realizar la búsqueda
```bash
./HoleheRepeater.sh Filecorreo
Filecorreo= Archivo que contiene los correos
```

## Créditos
- Diego Cabrera - SilReon
- Megadose - Holehe - https://github.com/megadose
