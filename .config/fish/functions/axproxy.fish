function axproxy

    set SCOPE -U
    set PROXY "http://wwwproxy.se.axis.com:3128"
    set NO_PROXY "localhost,127.0.0.1,localaddress,.localdomain.com,.se.axis.com,seconnect2.axis.com,connect2.axis.com"
    set PROXY_VARS HTTP_PROXY HTTPS_PROXY http_proxy https_proxy
    set HELP "Usage: axproxy enable|disable|status [SCOPE]

            SCOPES:
             global: This shell and childs only.
             universal: Everything in the current users session.

             See: man set for more info."
    
    if ! count $argv > /dev/null
        echo $HELP
        return
    end

	if count $argv[2] > /dev/null
	    switch $argv[2]
	    case global
	        set SCOPE -g
	    case universal
	        set SCOPE -U
	    case '*'
	        echo "Unknown scope. Options: global|universal"
	        return
	    end
	end

    switch $argv[1]
    case enable
        for PROXY_VAR in $PROXY_VARS
            set $SCOPE -x $PROXY_VAR $PROXY
        end
        set $SCOPE -x no_proxy $NO_PROXY
    case disable
        for PROXY_VAR in $PROXY_VARS
            set $SCOPE -e $PROXY_VAR
        end
        set $SCOPE -e no_proxy
    case status
        for PROXY_VAR in $PROXY_VARS
            set -S $PROXY_VAR
        end
        set -S no_proxy
    case '*'
        echo $HELP
    end

end
