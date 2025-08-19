#!/usr/bin/env bash
set -e

if [[ "$TR_TORRENT_DIR" != "/downloads" ]]; then
	echo "Ignoring $TR_TORRENT_NAME since it already has a dir set: $TR_TORRENT_DIR"
	exit
fi
echo "Running with $TR_TORRENT_NAME $TR_TORRENT_ID"

name=$TR_TORRENT_NAME
# guessit is not available in the container so we use shell2http to expose it in localhost:8080
# dir=$(guessit "$name" -P "title")
dir=$(curl "localhost:8080" -G --data-urlencode "title=$name")
echo "Guessed '$dir' for torrent '$name'"

export AUTH="$TRANSMISSION__RPC_USERNAME:$TRANSMISSION__RPC_PASSWORD"
transmission-remote --auth "$AUTH" -t "$TR_TORRENT_ID" --move "$TRANSMISSION__MEDIAS_DIR/$dir"
