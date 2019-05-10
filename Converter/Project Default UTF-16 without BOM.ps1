Get-ChildItem *.reg -Recurse | ForEach-Object {
$content = $_ | Get-Content

Set-Content -PassThru $_.Fullname $content -Encoding Unicode -Force}