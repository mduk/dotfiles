alias ytdll="youtube-dl -F"

function ytdla() {
    pushd ~/Music
    youtube-dl \
        -f m4a \
        --output "%(uploader)s/%(title)s.%(ext)s" \
        "${1}"
    popd
}

function ytdlapl() {
    pushd ~/Music
    youtube-dl \
        -f m4a \
        --output "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
        "${1}"
    popd
}



function ytdlv() {
    pushd ~/Videos
    youtube-dl \
        -f best \
        --output "%(uploader)s/%(release_date)s - %(title)s.%(ext)s" \
        --write-info-json \
        "${1}"
    popd
}

function ytdlvpl() {
    pushd ~/Videos
    youtube-dl \
        -f best \
        --output "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
        --write-info-json \
        "${1}"
    popd
}



function ytdlj() {
    youtube-dl -j $1 | jq .
}
