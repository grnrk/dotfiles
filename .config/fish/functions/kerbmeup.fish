function kerbmeup --description 'Get a kereberos ticket and cache it'
    test -d ~/.kerb || mkdir ~/.kerb
    cd ~/.kerb
    kdestroy -A
    kinit -V -n -c FILE:armor.ccache
    kinit -V -T FILE:armor.ccache gorane_lt1
    cd -
end
