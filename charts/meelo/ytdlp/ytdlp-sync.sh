#!/usr/bin/env bash

# yt-dlp rewrites the cookie file on exit, and the secret mount is read-only
cp /app/secrets/cookies.txt "$(pwd)/cookies.txt"

yt-dlp "$LIVES_URL" -o "$LIVES_OUT/%(title)s.%(ext)s" \
	--embed-thumbnail --embed-metadata --embed-chapters \
	--download-archive "$LIVES_OUT/ytdlp-archive.txt" \
	--cookies "$(pwd)/cookies.txt" \
	--cache-dir "$(pwd)"

yt-dlp "$URL" -o "$OUT/%(artist)s - %(title)s.%(ext)s" \
	--extract-audio \
	--embed-thumbnail --embed-metadata --embed-chapters \
	--download-archive "$OUT/ytdlp-archive.txt" \
	--cookies "$(pwd)/cookies.txt" \
	--cache-dir "$(pwd)"
