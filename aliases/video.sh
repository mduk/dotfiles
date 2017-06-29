stripaudio() {
  ffmpeg -i "$1" -an $(echo "$1" | sed 's/\./-noaudio./' )
}
