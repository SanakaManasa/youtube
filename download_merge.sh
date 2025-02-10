#!/bin/bash

# Ensure yt-dlp is installed and in the PATH
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp not found. Please install yt-dlp or make sure it's in the PATH."
    exit 1
fi

# Ensure ffmpeg is installed and in the PATH
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg not found. Please install ffmpeg or make sure it's in the PATH."
    exit 1
fi

# URL from command line argument
URL="$1"

if [ -z "$URL" ]; then
    echo "No URL provided. Please provide a URL."
    exit 1
fi

# Define output directory
OUTPUT_DIR="C:/Users/manas/Downloads/Youtube"
mkdir -p "$OUTPUT_DIR"

# Download video and audio separately
echo "Downloading video..."
yt-dlp -f '400' -o "$OUTPUT_DIR/%(title)s.f400.mp4" "$URL"

echo "Downloading audio..."
yt-dlp -f '251' -o "$OUTPUT_DIR/%(title)s.f251.webm" "$URL"

# Extract the video title (replaces special characters with underscores for the filename)
VIDEO_TITLE=$(yt-dlp --get-title "$URL" | tr ' ' '_' | tr -d '[:punct:]')

# Define file paths with the actual video title
VIDEO_FILE="$OUTPUT_DIR/$VIDEO_TITLE.f400.mp4"
AUDIO_FILE="$OUTPUT_DIR/$VIDEO_TITLE.f251.webm"
OUTPUT_FILE="$OUTPUT_DIR/$VIDEO_TITLE.mp4"

# Merge video and audio if both files exist
if [ -f "$VIDEO_FILE" ] && [ -f "$AUDIO_FILE" ]; then
    echo "Merging video and audio..."
    C:/Users/manas/OneDrive/Desktop/youtube/ffmpeg.exe -i "$VIDEO_FILE" -i "$AUDIO_FILE" -c:v copy -c:a aac -strict experimental "$OUTPUT_FILE"
    
    # Clean up original files
    rm "$VIDEO_FILE" "$AUDIO_FILE"
    
    echo "Download and merge complete: $OUTPUT_FILE"
else
    echo "Video or audio file not found. Please check the downloads."
    exit 1
fi
