function axproxy

    set PROXY "http://wwwproxy.se.axis.com:3128"
    set NO_PROXY "localhost,127.0.0.1,localaddress,.localdomain.com,.se.axis.com,seconnect2.axis.com,connect2.axis.com"
    set PROXY_VARS HTTP_PROXY HTTPS_PROXY http_proxy https_proxy
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
        set -U -x no_proxy $NO_PROXY
    case disable
        for PROXY_VAR in $PROXY_VARS
            set -U -e $PROXY_VAR
        end
        set -U -e no_proxy
    case status
        for PROXY_VAR in $PROXY_VARS
            set -S $PROXY_VAR
        end
        set -S no_proxy
    case '*'
        echo $HELP
    end

end
