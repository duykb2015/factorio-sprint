$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$root = Split-Path $PSScriptRoot -Parent
$version = (Get-Content (Join-Path $root 'sprint\info.json') -Raw | ConvertFrom-Json).version
$archive = Join-Path $root "sprint_${version}.zip"
if (Test-Path -LiteralPath $archive) { Remove-Item -LiteralPath $archive }
$zip = [IO.Compression.ZipFile]::Open($archive, 'Create')
try {
    Get-ChildItem (Join-Path $root 'sprint') -File -Recurse | Where-Object { $_.FullName -notmatch '[\\/]scenarios[\\/]|thumbnail-small.png' } | ForEach-Object {
        $relative = $_.FullName.Substring((Join-Path $root 'sprint').Length + 1).Replace('\','/')
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, "sprint_${version}/$relative", 'Optimal') | Out-Null
    }
} finally { $zip.Dispose() }
Write-Output $archive
