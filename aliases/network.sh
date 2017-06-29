function tn() {
    host="$1"
    port="$2"

    telnet "$host" "$port"
}

function tns() {
    host="$1"
    port="$2"

    openssl s_client \
        -connect "${host}:${port}"
}
