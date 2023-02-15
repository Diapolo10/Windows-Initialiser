# $scriptpath = $MyInvocation.MyCommand.Path
# $parentdir = Split-Path $scriptpath -Parent
$VERSION = "0.1.0"

Write-Output "Winit v$VERSION"

Write-Output $(winget -v)

# $xml = [xml](Get-Content "$parentdir\applications.xml")

# foreach($group in $xml.ProgramGroups.ChildNodes) {
#     Write-Output $group
# }

# Write-Output ""

# foreach($program in ($xml.ProgramGroups.ProgramGroup|Where-Object {$_.Name -eq "Streaming"}).ChildNodes) {
#     Write-Output $program.Id
    <# $(winget install $program.Id $program.InstallArgs) #>
# }
