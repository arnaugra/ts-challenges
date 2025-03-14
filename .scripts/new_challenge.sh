#!/bin/bash

# challenges directory
CHALLENGES_DIR="challenges"

# templates
EXERCISE_TEMPLATE_FILE=".scripts/exercise_template.txt"
FUNCTION_TEMPLATE_FILE=".scripts/function_template.txt"
TEST_TEMPLATE_FILE=".scripts/test_template.txt"

# normalize the given name to snakecase
NAME_SNAKECASE=$(echo "$1" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
NAME_CAMELCASE=$(echo "$1" | sed -r 's/[^a-zA-Z0-9]+(.)/\U\1/g' | sed 's/^[A-Z]/\L&/' | tr -d ' ')

# Cuenta cuántas carpetas hay en el directorio (ignora archivos sueltos)
COUNT=$(find "$CHALLENGES_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l)
# Suma 1 al número total de carpetas para asignarlo al nuevo desafío
COUNT=$((COUNT + 1))
# Formatea el número con dos dígitos
COUNT=$(printf "%02d" "$COUNT")

# Nombre del nuevo directorio
NEW_DIR="$CHALLENGES_DIR/${COUNT}_${NAME_SNAKECASE}"

# Crea el directorio
mkdir -p "$NEW_DIR"

# Si el archivo de plantilla existe, reemplaza {{CHALLENGE_TITLE}} con el nombre del desafío y lo copia a exercise.md
if [[ -f "$EXERCISE_TEMPLATE_FILE" ]]; then
    sed "s/{{CHALLENGE_TITLE}}/$1/g" "$EXERCISE_TEMPLATE_FILE" > "$NEW_DIR/exercise.md"
else
    echo "⚠️  Plantilla `exercise_template.txt` no encontrada. Creando un archivo vacío."
    touch "$NEW_DIR/exercise.md"
fi

if [[ -f "$FUNCTION_TEMPLATE_FILE" ]]; then
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$FUNCTION_TEMPLATE_FILE" > "$NEW_DIR/index.base.ts"
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$FUNCTION_TEMPLATE_FILE" > "$NEW_DIR/index.ts"
else
    echo "⚠️  Plantilla `function_template` no encontrada. Creando un archivo vacío."
    touch "$NEW_DIR/index.base.ts"
    touch "$NEW_DIR/index.ts"
fi

if [[ -f "$TEST_TEMPLATE_FILE" ]]; then
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$TEST_TEMPLATE_FILE" > "$NEW_DIR/index.test.ts"
else
    echo "⚠️  Plantilla `test_template` no encontrada. Creando un archivo vacío."
    touch "$NEW_DIR/index.test.ts"
fi


echo "Desafío creado en: $NEW_DIR"