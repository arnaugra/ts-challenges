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

# count the number of directories
COUNT=$(find "$CHALLENGES_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l)
# add 1 to that count
COUNT=$((COUNT + 1))
# 2 digit format
COUNT=$(printf "%02d" "$COUNT")

# new dir name
NEW_DIR="$CHALLENGES_DIR/${COUNT}_${NAME_SNAKECASE}"

# create the directory
mkdir -p "$NEW_DIR"

# create the files from the templates if they are found
if [[ -f "$EXERCISE_TEMPLATE_FILE" ]]; then
    sed -e "s/{{CHALLENGE_TITLE}}/$1/g" -e "s/{{FUNCTION_NAME}}/$NAME_CAMELCASE/g" "$EXERCISE_TEMPLATE_FILE" > "$NEW_DIR/exercise.md"
else
    echo "⚠️  Template `exercise_template.txt` not found. Creating empty file."
    touch "$NEW_DIR/exercise.md"
fi

if [[ -f "$FUNCTION_TEMPLATE_FILE" ]]; then
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$FUNCTION_TEMPLATE_FILE" > "$NEW_DIR/index.base.ts"
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$FUNCTION_TEMPLATE_FILE" > "$NEW_DIR/index.ts"
else
    echo "⚠️  Template `function_template` not found. Creating empty file."
    touch "$NEW_DIR/index.base.ts"
    touch "$NEW_DIR/index.ts"
fi

if [[ -f "$TEST_TEMPLATE_FILE" ]]; then
    sed "s/{{FUNCTION_NAME}}/${NAME_CAMELCASE}/g" "$TEST_TEMPLATE_FILE" > "$NEW_DIR/index.test.ts"
else
    echo "⚠️  Template `test_template` not found. Creating empty file."
    touch "$NEW_DIR/index.test.ts"
fi


echo "Challange location: $NEW_DIR"