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
            if not set -q $PROXY_VAR
                set -U -x $PROXY_VAR $PROXY
            end
        end
        if not set -q no_proxy
            set -U -x no_proxy $NO_PROXY
        end
    case disable
        for PROXY_VAR in $PROXY_VARS
            set -U -e $PROXY_VAR
        end
    case '*'
        echo $HELP
    end

end
