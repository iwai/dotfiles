
if status --is-login
    source $XDG_CONFIG_HOME/fish/env.fish

    for file in $XDG_CONFIG_HOME/fish/env.d/*.fish
        source $file
    end

    for file in /usr/local/share/fish/vendor_completions.d/*.fish
        source $file
    end
end

# loading source
for file in $XDG_CONFIG_HOME/fish/scripts/*.fish
    source $file
end

source $XDG_CONFIG_HOME/fish/keybindings.fish

if [ -e "$XDG_CONFIG_HOME/fish/extend" ]
    for file in $XDG_CONFIG_HOME/fish/extend/*.fish
        source $file
    end
end

# appearance
set theme_date_format "+%m/%d %H:%M:%S "


if test $SHLVL -eq 1 ; and test -z "$INSIDE_EMACS"
    command tmux
else
    function fish_title; true; end;
    function fish_right_prompt; true; end;
end


function fish_greeting -d "What's up, fish?"
    if ! test -z $TMUX
        return
    end

    set_color $fish_color_autosuggestion
    uname -nmsr

    # TODO: `command -q -s` only works on fish 2.5+, so hold off on that for now
    command -s uptime >/dev/null
    and uptime

    if command -q -s brew
        set -l clength (expr $COLUMNS / 3)
        set -l outdated (brew outdated | wc -l | tr -d [\:blank\:])
        set -l frequently_packages (brew outdated -v | grep -E '^(?:anyenv|docker|fish|fzf|hub|jq|packer|ranger|ripgrep|tig|tmux|ngrok|vagrant)' | lam -f -$clength - -f -$clength - -f -$clength - 2>/dev/null)

        echo -n "Homebrew outdated: "
        set_color yellow; echo -n $outdated
        set_color $fish_color_autosuggestion; echo " packages. more infomation `brew outdated`."
        echo $frequently_packages
    end

    set_color normal
end

