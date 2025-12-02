function ocal
    set ocaldir ~/Documents/script/o365
    # Activate virtualenv
    source $ocaldir/.venv/bin/activate.fish
    cd $ocaldir
    python3 ocal.py 2> /dev/null
    deactivate
    cd -
end
