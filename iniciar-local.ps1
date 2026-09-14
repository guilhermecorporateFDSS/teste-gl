$ErrorActionPreference = 'Stop'
$nodeLocal = Get-ChildItem -Path "$PSScriptRoot/.local/node-*-win-x64/node.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($nodeLocal) {
    & $nodeLocal.FullName "$PSScriptRoot/scripts/serve.cjs"
} else {
    & node "$PSScriptRoot/scripts/serve.cjs"
}
