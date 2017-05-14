alias ytdll="youtube-dl -F"

function ytdla() {
    pushd ~/Music
    youtube-dl \
        -f m4a \
        --output "%(uploader)s/%(title)s.%(ext)s" \
        "${1:-$(pbpaste)}"
    popd
}

function ytdlapl() {
    pushd ~/Music
    youtube-dl \
        -f m4a \
        --output "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
        "${1:-$(pbpaste)}"
    popd
}



function ytdlv() {
    pushd ~/Videos
    youtube-dl \
        -f best \
        --output "%(uploader)s/%(release_date)s - %(title)s.%(ext)s" \
        --write-info-json \
        "${1:-$(pbpaste)}"
    popd
}

function ytdlvpl() {
    pushd ~/Videos
    youtube-dl \
        -f best \
        --output "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
        --write-info-json \
        "${1:-$(pbpaste)}"
    popd
}

function ytdlj() {
    youtube-dl -j "${1:-$(pbpaste)}" | jq .
}
