function wsname
    if ! count $argv > /dev/null
        echo "Need new name."
        return
    else
        set ws_name $argv[1]
    end
    
    set cur_ws (i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
    # If workspace is already named, strip the name from ws to enable renaming using $ws_num.
    # The colon following ws num indicates a name is set.
    if string match --quiet --regex --ignore-case '^[0-9]+:' $cur_ws 
        set ws_num (echo $cur_ws | cut -d':' -f1)
        if string match --quiet --regex $ws_num $ws_name
            i3-msg "rename workspace \"$cur_ws\" to \"$ws_num\""
            return
        end
        i3-msg "rename workspace \"$cur_ws\" to \"$ws_num: $ws_name\""
    else
        i3-msg "rename workspace \"$cur_ws\" to \"$cur_ws: $ws_name\""
    end
end
