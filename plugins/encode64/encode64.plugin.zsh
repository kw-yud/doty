function encode64() {
    if [[ $# -eq 0 ]]; then
        cat - | base64
    else
        echo $1 | base64
    fi
}

function encodefile64() {
    if [[ $# -eq 0 ]]; then
        echo "You must provide a filename"
    else
        base64 -i $1 -o $1.txt
        echo "${1}'s content encoded in base64 and saved as ${1}.txt"
    fi
}

function decode64() {
    if [[ $# -eq 0 ]]; then
        cat - | base64 --decode
    else
        echo $1 | base64 --decode
    fi
}
