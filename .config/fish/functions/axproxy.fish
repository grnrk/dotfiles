function axproxy

    set PROXY "http://wwwproxy.se.axis.com:3128"
    set PROXY_VARS MOO_PROXY MOO_PROX
    set HELP "Missing required argument: enable|disable"
    
    if ! count $argv > /dev/null
        echo $HELP
        return
    end
    
    switch $argv[1]
    case enable
        for PROXY_VAR in $PROXY_VARS
            set -U -x $PROXY_VAR $PROXY
        end
    case disable
        for PROXY_VAR in $PROXY_VARS
            set -U -e $PROXY_VAR
        end
    case '*'
        echo $HELP
    end

end
