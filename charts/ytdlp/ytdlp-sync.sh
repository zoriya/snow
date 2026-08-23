#!/bin/sh

if [ ! -f /state/cookies.txt ] || [ /app/secrets/cookies.txt -nt /state/cookies.txt ]; then
	cp /app/secrets/cookies.txt /state/cookies.txt
fi

yt-dlp "$LIVES_URL" -o "$LIVES_OUT/%(title)s.%(ext)s" \
	--embed-thumbnail --embed-metadata --embed-chapters \
	--download-archive "$LIVES_OUT/ytdlp-archive.txt" \
	--cookies /state/cookies.txt \
	--cache-dir "$(pwd)" \
	--ignore-errors

yt-dlp "$URL" -o "$OUT/%(artist)s - %(title)s.%(ext)s" \
	--extract-audio \
	--embed-thumbnail --embed-metadata --embed-chapters \
	--download-archive "$OUT/ytdlp-archive.txt" \
	--cookies /state/cookies.txt \
	--cache-dir "$(pwd)" \
	--ignore-errors
exit 0
