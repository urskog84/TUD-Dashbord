Import-Module UniversalDashboard.Community


$NavBarLinks = @((New-UDLink -Text "Buy Universal Dashboard" -Url "https://ironmansoftware.com/universal-dashboard/" -Icon heart_o),
    (New-UDLink -Text "Documentation" -Url "https://www.gitbook.com/book/adamdriscoll/powershell-universal-dashboard/details" -Icon book))


$Colors = @{
    BackgroundColor = "#252525"
    FontColor       = "#FFFFFF"
}

$AlternateColors = @{
    BackgroundColor = "#4081C9"
    FontColor       = "#FFFFFF"
}


# Load pagees Arry
$pageArray = @()
$pagesPath = Join-Path -Path $PSScriptRoot\pages\ -ChildPath *.ps1 -Resolve
foreach ($page in $pagesPath) {
    $pageArray += . $page
}

# Load Internal Funtion
$functionPath = Join-Path -Path $PSScriptRoot\functions\ -ChildPath *.ps1 -Resolve
foreach ($function in $functionPath) {
    . $function
}

# Load Fotter
$Footer = . (Join-Path $PSScriptRoot "footer.ps1")



$EndpointInitialization = New-UDEndpointInitialization -Function @() -Module @()


$Dashbord = New-UDDashboard -Title TUD-Dashbord -Pages $pageArray -NavbarLinks $NavBarLinks -Footer $Footer -EndpointInitialization $EndpointInitialization


Get-UDDashboard | Stop-UDDashboard

Start-UDDashboard -Dashboard $Dashbord -Port 8080