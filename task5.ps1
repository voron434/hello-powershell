function Sort-Processes {
    get-process | where-object handles -gt 500 | select-object handles,name,description | sort-object handles
}

Sort-Processes