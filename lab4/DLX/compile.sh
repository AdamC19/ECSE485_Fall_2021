#!  /bin/bash

if ! [ -d "_trash" ]; then
    echo "Creating _trash directory..."
    mkdir _trash
fi

FILES_TO_TRASH=("system.v" "clkgen.v")

for FILE in ${FILES_TO_TRASH[@]}; do
    echo "Moving $FILE to _trash..."
    mv $FILE ./_trash
done

vlog ./*.v
