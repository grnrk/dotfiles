function gpvpn

    set GPIF /proc/sys/net/ipv4/conf/gpd0
    set PROXY_VARS HTTP_PROXY HTTPS_PROXY http_proxy https_proxy
    set HELP "Usage: gpvpn up [gui]

        Brings up the globalprotect vpn interface.
        Provided as a fish function"
    
    if ! count $argv > /dev/null
        echo $HELP
        return
    end

    switch $argv[1]
    case up
        if ! test -e $GPIF
            if test (count $argv) -eq 2
                if test "$argv[2]" = "gui"
                    set CMD /usr/bin/globalprotect launch-ui
                else
                    echo $HELP
                    return
                end
            else
                set CMD /usr/bin/globalprotect connect -p vpncloud.axis.com
            end

            for PROXY_VAR in $PROXY_VARS
                set --erase $PROXY_VAR
            end
            # Start the globalprotect client
            $CMD
        else
            echo GlobalProtect already running: $GPIF exists.
        end
    case down
        echo Function not provided. Disconnect using the GlobalProtect application.
    case '*'
        echo $HELP
    end
end
