function CPU-Handles($fromHandles) {
    get-process | where Handles -gt $fromHandles |
    select-object handles, name, description |
    sort -property Handles
}

CPU-Handles 2000