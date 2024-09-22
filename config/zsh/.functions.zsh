#!/bin/sh


# ================================================
# Spotdl
# ================================================
function getsongs() {
    spotdl "$1" --lyrics genius musixmatch azlyrics synced --output "$HOME/Music"
}

function getsongs_from_list() {
    LIST="$HOME/Music/lists.txt"

    [[ ! -f "$LIST" ]] && touch "$LIST"

    for item in $(cat "$LIST"); do
        spotdl "$item" --lyrics genius musixmatch azlyrics synced --output "$HOME/Music"
    done
}


# ================================================
# ClamAV
# ================================================
function scandir() {
    sudo freshclam
    clamscan -r "$1"
}


# ================================================
# Ffmpeg
# ================================================
function videotomp3() {
    filename=$(echo "$1" | cut -d '.' -f 1)

    ffmpeg -i "$1" -acodec libmp3lame "$filename.mp3"
}

