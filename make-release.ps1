param(
    [string]$Version = "1.0.0",
    [string]$OutputDir = "release"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$exe = Join-Path $root "ToolMaHoa.exe"
$internal = Join-Path $root "_internal"
$readme = Join-Path $root "README.md"

if (-not (Test-Path $exe)) { throw "Khong tim thay ToolMaHoa.exe" }
if (-not (Test-Path $internal)) { throw "Khong tim thay thu muc _internal" }

$outDir = Join-Path $root $OutputDir
New-Item -ItemType Directory -Path $outDir -Force | Out-Null
$zipPath = Join-Path $outDir ("ToolMaHoa-v{0}-win64.zip" -f $Version)

$stageRoot = Join-Path ([IO.Path]::GetTempPath()) ("ToolMaHoa-release-" + [guid]::NewGuid().ToString("N"))
$stage = Join-Path $stageRoot "ToolMaHoa"

try {
    New-Item -ItemType Directory -Path $stage -Force | Out-Null
    Copy-Item $exe $stage
    if (Test-Path $readme) { Copy-Item $readme $stage }
    Copy-Item $internal $stage -Recurse

    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory(
        $stageRoot,
        $zipPath,
        [IO.Compression.CompressionLevel]::Optimal,
        $false
    )
}
finally {
    if (Test-Path $stageRoot) { Remove-Item $stageRoot -Recurse -Force }
}

$item = Get-Item $zipPath
Write-Host ("Da tao: {0}" -f $item.FullName)
Write-Host ("Kich thuoc: {0:N2} MB" -f ($item.Length / 1MB))
