#!/bin/bash

echo "Start script."

OUTPUT_FILE="result.txt"
MATCHES=()

for arg in $@; do
    MATCH="$(grep -ilr --exclude=$OUTPUT_FILE $arg *)\n"

    if [ "$MATCH" == "\n" ]; then
        MATCH="no matches."
    fi

    MATCHES+="$arg: $MATCH"
done

echo -e $MATCHES > result.txt

echo -e "Result:\n$(cat $OUTPUT_FILE)"
echo "Stop script."