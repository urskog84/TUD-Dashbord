New-UDPage -Name Home -Icon home -Content {
    New-UDCard -Title "Välkommen" -Text "till TUD-Dasbord"
    New-UDTable -Id table1 -Title Table -Headers  @("Name","Link") -Endpoint {
        $pages = Get-ChildItem .\src\pages | Select-Object Name, @{Label="Link"; Expression={New-UDLink -Text $_.Name -Url "/$($_.Name.split(".")[0])"}}
        $pages | Out-UDTableData -Property @("Name","Link")
    }
}