#!/bin/bash

# URL of the YouTube video or Shorts
url=$1

# Download the best video and audio separately using yt-dlp
./yt-dlp.exe -f bestvideo+bestaudio --merge-output-format mp4 -o "C:/Users/manas/Downloads/Youtube/%(title)s.%(ext)s" "$url"

# Check if the video file and audio file are downloaded
video_file=$(ls C:/Users/manas/Downloads/Youtube/*.mp4 | head -n 1)
audio_file=$(ls C:/Users/manas/Downloads/Youtube/*.webm | head -n 1)

# If both video and audio files exist, merge them using ffmpeg
if [[ -f "$video_file" && -f "$audio_file" ]]; then
    video_filename=$(basename "$video_file" .mp4)
    audio_filename=$(basename "$audio_file" .webm)

    # Merge video and audio into a single MP4 file
    ./ffmpeg.exe -i "$video_file" -i "$audio_file" -c:v copy -c:a aac -strict experimental "C:/Users/manas/Downloads/Youtube/${video_filename}_merged.mp4"

    # Optional: Remove the separate video and audio files after merging
    rm "$video_file" "$audio_file"
    
    echo "Download and merge complete: ${video_filename}_merged.mp4"
else
    echo "Video or audio file not found. Merge skipped."
fi
