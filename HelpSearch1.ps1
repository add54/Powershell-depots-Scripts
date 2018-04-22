Function Global:Search-Help{
	Param(
		$firstString,
		$secondString
		)
	Set-Location $PSHOME\En-Us
	If($secondString){
		Get-Childitem about* | 
		Select-String $firstString -list |
		Get-Childitem |
		Select-String $secondString -list |
		Select-Object filename
		}
	Else{
		Get-Childitem about* | 
		Select-String $firstString -list |
		Select-Object filename
		}
}