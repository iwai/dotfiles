
function __confirm_die -d 'Exit with error message'
    echo $argv
    return 1
end

function confirm -d 'Get user confirmation helper function'
    argparse --ignore-unknown --name=confirm 'm/message=' -- $argv
    or return

    [ -z $_flag_message ]
    and echo $_: Missing required message
    and return 1

    while true
        read -l -P "$_flag_message [y/N]: " confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end
