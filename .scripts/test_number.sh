#!/bin/bash

export PATH=$PATH:./node_modules/.bin

# get the number parameter
NUMBER=$1

# if there is no parameter, show a warning and exit
if [ -z "$NUMBER" ]; then
    jest
    exit 1
fi

# if the parameter is not a number, show a warning and exit
if ! [[ $NUMBER =~ ^[0-9]+$ ]] || [ $NUMBER -lt 1 ]; then
    echo "⚠️  El número de desafío debe ser un número entero mayor a 0."
    exit 1
fi

# search for the directory
DIRECTORY=$(find challenges -mindepth 1 -maxdepth 1 -type d -name "${NUMBER}_*" | head -n 1)

# run test if the directory exists
if [[ -d "$DIRECTORY" ]]; then
    jest "$DIRECTORY/index.test.ts" 
else
    echo "⚠️  No se encontró el desafío $NUMBER."
    exit 1
fi