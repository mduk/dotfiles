alias ytdll="youtube-dl -F"
alias ytdla="youtube-dl -f m4a"
alias ytdlv="youtube-dl -f best"

function ytdlj() {
    youtube-dl -j $1 | jq .
}
