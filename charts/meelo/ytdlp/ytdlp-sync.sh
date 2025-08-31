#!/usr/bin/env bash

while true; do
	yt-dlp "$LIVES_URL" -o "$LIVES_OUT/%(title)s.%(ext)s" \
		--embed-thumbnail --embed-metadata --embed-chapters \
		--download-archive "$LIVES_OUT/ytdlp-archive.txt" \
		--cookies /app/secrets/cookies.txt \
		--cache-dir "$(pwd)"

	yt-dlp "$URL" -o "$OUT/%(artist)s - %(title)s.%(ext)s" \
		--extract-audio \
		--embed-thumbnail --embed-metadata --embed-chapters \
		--download-archive "$OUT/ytdlp-archive.txt" \
		--cookies /app/secrets/cookies.txt \
		--cache-dir "$(pwd)"
	sleep 6h
done
