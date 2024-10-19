function flac2mp3() {
    find . -name "*.flac" |
        while read -r file; do
            store_path=$(echo "$file" |
                sed -e "s/^.\///" -e "s/\.flac$//" |
                awk -F '\n' '{print "./mp3/"$1".mp3"}')
            mkdir -p "$(dirname "$store_path")"
            ffmpeg -i "$file" -ab 320k -map_metadata 0 -id3v2_version 3 "$store_path" &
        done
}

function png2eps() {
    # check input
    if [ $# -ne 1 ]; then
        echo "Exchange png to eps as same name"
        echo "Usage: png2eps.sh <png file>"
        exit 0
    fi

    # check input file
    if [ ! -f $1 ]; then
        echo "Error: $1 does not exist"
        exit 1
    fi

    # check input file extension is png
    if [ ${1##*.} != "png" ]; then
        echo "Error: $1 is not png file"
        exit 1
    fi

    # check magick command
    if ! command -v magick &>/dev/null; then
        echo "Error: magick command not found"
        exit 1
    fi

    # convert png to eps
    magick convert $1 ${1%.*}.eps
}

# Fuzzy finder for Makefile targets
function fmake() {
    if [ ! -e "Makefile" ]; then
        echo "Makefile not found in the current directory."
        exit 0
    fi

    targets=$(awk -F: '/^[a-zA-Z0-9_-]+:/{print $1}' Makefile)

    if [ -z "$targets" ]; then
        echo "No targets found in Makefile."
        exit 0
    fi

    selected_target=$(echo "$targets" | fzf --prompt="Target: make " --preview="cat Makefile | grep -E --color=always '\$|{}'")

    if [ -n "$selected_target" ]; then
        make "$selected_target"
    else
        echo "No target selected."
    fi
}

# Fuzzy finder for npm scripts
function fyarn() {
    if [ ! -e "package.json" ]; then
        echo "package.json not found in the current directory."
        exit 1
    fi

    scripts=$(jq -r '.scripts | keys | .[]' package.json)

    if [ -z "$scripts" ]; then
        echo "No scripts found in package.json."
        exit 1
    fi

    selected_script=$(echo "$scripts" | fzf --prompt="Target: yarn " --preview="jq '.scripts.{}' package.json")

    if [ -n "$selected_script" ]; then
        yarn "$selected_script"
    else
        echo "No script selected."
    fi
}

function sort-img-by-date() {
    destination_folder="$(pwd)/renamed"

    if [ ! -d "$destination_folder" ]; then
        mkdir "$destination_folder"
    fi

    for file in "$(pwd)"/*.jpeg; do
        date_info=$(sips -g creation "$file" | grep "creation:" | awk '{print $2}' | tr ":" "-")
        new_name="${date_info}.jpeg"

        if [ -e "$destination_folder/$new_name" ]; then
            if cmp -s "$file" "$destination_folder/$new_name"; then
                echo "Skipped: $file and $destination_folder/$new_name are identical."
            else
                i=1
                while [ -e "$destination_folder/${date_info}_${i}.jpeg" ]; do
                    i=$((i + 1))
                done
                new_name="${date_info}_${i}.jpeg"
                mv "$file" "$destination_folder/$new_name"
            fi
        else
            mv "$file" "$destination_folder/$new_name"
        fi
    done
}
