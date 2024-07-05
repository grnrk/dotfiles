#!/bin/bash

swaymsg -t get_tree |
    jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | select(.type == "con") | ((.id | tostring) + ": " + .app_id + " - " + .name)' |
    wofi --show dmenu | {
        read -r id name
        swaymsg "[con_id=$id]" focus
    }
