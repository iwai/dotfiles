
function fzf_change_directory -d 'fzf change directory'

    if [ $argv ]
        set -l path (string replace -r "~" "$HOME" -- $argv)
        set -l path (string replace -r '/$' '' -- $path)

        find $path -type d -name '.git' -prune -o -type d -print \
        | perl -pe "s#$HOME#~#" \
        | perl -pe "s#$PWD#.#" \
        | fzf-tmux --query "$argv" \
        | perl -pe 's/([ ()])/\\\\$1/g' \
        | read selected

        if [ $selected ]
            set -l buffer (commandline -b)
            commandline (string replace -r "$argv" "$selected" -- $buffer)
        end

    else
        set -l recent (z -l | awk '{print $2}' | grep -v '^/$' | grep -v '^/Users$')

        find $recent -maxdepth 2 -type d -name '.git' -prune -o -type d -print \
        | perl -pe "s#$HOME#~#" \
        | perl -pe "s#$PWD#.#" \
        | fzf-tmux \
        | perl -pe 's/([ ()])/\\\\$1/g' \
        | read selected

        if [ $selected ]
            commandline "cd $selected/"
        end
    end

    return 0
end

function fzf_select_history -d 'command history selector'

    history | awk '!a[$0]++' | fzf-tmux --query "$argv" | read selected

    if [ $selected ]
        commandline $selected
    end

    return 0
end

function fzf_file_open -d 'fzf file open'

    fzf-tmux --query "$argv" --preview "$XDG_CONFIG_HOME/fish/scripts/fzgrep-preview.sh {}" \
        | read selected

    if [ $selected ]
        set -l buffer (commandline -b)

        if [ $argv ]
            commandline (string replace -r "$argv" "$selected" -- $buffer)
        else
            commandline -i $selected
        end
    end

    return 0
end

function fzgrep -d 'ripgrep fuzzy find'
    set -q argv; or set argv "--files"

    # fzgrep-preview.sh: https://github.com/junegunn/fzf.vim/issues/732#issuecomment-436897445
    rg --column --line-number --no-heading --fixed-strings --ignore-case \
        --hidden --follow --glob "!.git/*" --color "never" $argv \
        | tr -d "\017" \
        | fzf-tmux --preview "$XDG_CONFIG_HOME/fish/scripts/fzgrep-preview.sh {}" \
        | read selected

    if [ $selected ]
        set parts (string split -m3 : $selected)
        commandline "e $parts[1] +$parts[2]:$parts[3]"
    end

    return 0
end
