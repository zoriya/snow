#!/usr/bin/env bash
set -e
set -x

rsstail -f '{title}:{link}\n' "$URL" | while IFS=":" read -r title link; do
    name=$(guessit "$title" -P title | tr -d "[:punct:]")

    # shellcheck disable=SC2012
    if ls /medias | tr -d "[:punct:]" | grep -qix "$name"; then
        transmission-remote "$TRURL" --auth "$TRUSER:$TRPASS" -a "$link" -w "/medias/$name"
    fi
done
