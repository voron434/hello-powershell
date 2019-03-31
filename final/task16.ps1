$Word = New-Object -ComObject Word.Application
$Word.Visible = $True
$Document = $Word.Documents.Add()
$Selection = $Word.Selection
$Selection.TypeText("Hello from powershell")