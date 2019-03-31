$Excel = New-Object -ComObject Excel.Application
$Excel.Visible = $true
$WorkBook = $Excel.Workbooks.Add()
$Sheet = $WorkBook.Worksheets.Item(1)
$Sheet.Name = 'My Worksheet'
$Sheet.Cells.Item(1,1) = 'Ilya'
$Sheet.Cells.Item(1,2) = 'Osipov'
$Sheet.Cells.Item(1,3) = '+ 7 (968) 443-05-42'