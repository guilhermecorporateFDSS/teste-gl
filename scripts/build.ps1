param([string]$SiteUrl = '')
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$outputDirectory = Join-Path $projectRoot 'dist'
New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
foreach ($item in @('index.html','css','js','assets','robots.txt','sitemap.xml')) {
  Copy-Item -LiteralPath (Join-Path $projectRoot $item) -Destination $outputDirectory -Recurse -Force
}
if ($SiteUrl) {
  $parsedUrl = [Uri]$SiteUrl
  if ($parsedUrl.Scheme -ne 'https' -or -not $parsedUrl.Host) { throw 'Use o domínio HTTPS real.' }
  $baseUrl = $SiteUrl.TrimEnd('/')
  $escapedUrl = [System.Security.SecurityElement]::Escape($baseUrl)
  Set-Content -LiteralPath (Join-Path $outputDirectory 'sitemap.xml') -Encoding UTF8 -Value "<?xml version=`"1.0`" encoding=`"UTF-8`"?><urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`"><url><loc>$escapedUrl/</loc></url></urlset>"
  Set-Content -LiteralPath (Join-Path $outputDirectory 'robots.txt') -Encoding UTF8 -Value "User-agent: *`nAllow: /`nSitemap: $baseUrl/sitemap.xml"
  $indexPath = Join-Path $outputDirectory 'index.html'
  $html = Get-Content -Raw -LiteralPath $indexPath
  $html = $html.Replace('</head>', "<link rel=`"canonical`" href=`"$escapedUrl/`"><meta property=`"og:url`" content=`"$escapedUrl/`"></head>")
  Set-Content -LiteralPath $indexPath -Encoding UTF8 -Value $html
}
Write-Output 'Build estático pronto em dist.'
