
function __fish_complete_wd -d "Completions for the wd command"
    set -l git_toplevel (command git rev-parse --show-toplevel 2>/dev/null)

    set -l token (commandline -ct)

    if [ -z "$git_toplevel" ]
        for d in $WD_ROOT/$token*/
            test -x $d
            and printf "%s\n" (string replace -r "^$WD_ROOT/" "" -- $d)
            #and printf "%s\tWDROOT\n" (string replace -r "^$WD_ROOT/" "" -- $d)
        end
        return
    end

    for d in $git_toplevel/$token*/
        test -x $d
        and string replace -r "^$git_toplevel/" "" -- $d
    end
end

complete -ec wd
complete -xc wd -a "(__fish_complete_wd)"

