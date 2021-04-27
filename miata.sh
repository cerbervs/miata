#!/bin/bash

DIR="$(pwd)/*"
for f in ${DIR}
do
    # echo "converting $f"
    no_space="$(echo "$f" | sed -e 's/[^a-zA-Z0-9\.\/]//g' -e 's/\s//g')"
    # echo "$no_space"
    mv "$f" "${no_space%.*}"
done

for f in $DIR
do
    ffmpeg -i $f -vf scale=664:360 -c:v libx264 -crf 18 -preset medium -c:a copy "${f}.mp4"
done
