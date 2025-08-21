#!/usr/bin/env bash

while true; do
	yt-dlp "$URL" -o "$OUT/%(artist)s - %(title)s.%(ext)s" \
		--extract-audio \
		--embed-thumbnail --embed-metadata --embed-chapters \
		--download-archive "$OUT/ytdlp-archive.txt" \
		--cookies /app/secrets/cookies.txt \
		--cache-dir "$(pwd)"
	sleep 6h
done
