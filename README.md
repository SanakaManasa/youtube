# YouTube Downloader & Merger

This project provides a simple script to download videos from YouTube and merge audio and video files using `yt-dlp` and `ffmpeg`. It allows users to download media and combine them into a single output file in a variety of formats.

## Features
- **Download YouTube Videos**: Download YouTube videos using the `yt-dlp` tool.
- **Audio Extraction**: Extract audio from video files in various formats (e.g., `.webm` to `.mp3`).
- **Video Merging**: Merge audio and video files into a single video file.

## Requirements
- **yt-dlp**: A more feature-rich fork of `youtube-dl` used for downloading videos.
- **ffmpeg**: A multimedia framework used to handle audio and video files for conversion and merging.
- **Git LFS** (Optional): For handling large files (e.g., `ffmpeg.exe`).

### Installation

1. **Install Dependencies**:
   - You will need `yt-dlp` and `ffmpeg`. To install `yt-dlp`, run the following:
     ```bash
     pip install yt-dlp
     ```
   - For `ffmpeg`, download it from the [official website](https://ffmpeg.org/download.html) or install it via a package manager.

2. **Clone the Repository**:
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/SanakaManasa/youtube.git
Install Git LFS (if needed): If you are dealing with large files like ffmpeg.exe, you may need to use Git LFS. Follow the instructions on the site to install and configure it.

Usage
Download Video: Use the download_merge.sh script to download a video. You can specify the URL of the YouTube video to be downloaded.
./download_merge.sh https://www.youtube.com/watch?v=VIDEO_ID

Extract Audio: After downloading the video, you can extract the audio using ffmpeg:
./youtube.sh audio.webm

Merge Audio and Video: To merge the audio and video files into a single output, run:
./download_merge.sh

This will generate a merged video file.

File Structure
.

├── audio.mp3                # Extracted audio file

├── audio.webm               # Original audio file from video

├── download_merge.sh        # Script to download and merge audio & video

├── ffmpeg.exe               # FFmpeg executable (Large File)

├── file_list.txt            # List of files for processing

├── output.mp4.webm          # Video file output in webm format

├── output_merged.mp4        # Final merged video output

├── youtube.sh               # Script to handle audio extraction

└── yt-dlp.exe               # yt-dlp executable (for downloading videos)

Troubleshooting
Error: 'ffmpeg' command not found: Ensure that ffmpeg is properly installed and its path is added to your system’s environment variables.

Large Files Warning (GitHub): If you receive a warning about large files like ffmpeg.exe, consider using Git LFS to store them outside the repository.
