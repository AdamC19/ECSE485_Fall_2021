#!  /bin/bash

if ! [ -d "_trash" ]; then
    echo "Creating _trash directory..."
    mkdir _trash
fi

FILES_TO_TRASH=("system.v" "clkgen.v")

for FILE in ${FILES_TO_TRASH[@]}; do
    if [ -f "$FILE" ]; then
        echo "Moving $FILE to _trash..."
        mv $FILE _trash
    fi
done

vlog ./*.v
