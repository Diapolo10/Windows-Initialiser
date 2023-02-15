
# Resolves the problem of getting the parent directory in both script and executable form
if ($MyInvocation.MyCommand.CommandType -eq "ExternalScript") {
    $ParentDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
} else {
    $ParentDir = Split-Path -Parent -Path ([Environment]::GetCommandLineArgs()[0]) 
    if (!$ParentDir){
        $ParentDir = "."
    }
}

$VERSION = "0.1.0"

Write-Output "Winit v$VERSION"

Write-Output $(winget -v)

$xml = [xml](Get-Content "$ParentDir\applications.xml")

foreach($group in $xml.ProgramGroups.ChildNodes) {
    Write-Output $group
}

Write-Output ""

foreach($program in ($xml.ProgramGroups.ProgramGroup|Where-Object {$_.Name -eq "Streaming"}).ChildNodes) {
    Write-Output $program.Id
    <# $(winget install $program.Id $program.InstallArgs) #>
}
