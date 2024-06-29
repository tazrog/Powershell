$filePath = Read-Host "Enter the path of the file:"

if (Test-Path $filePath) {
  $fileContent = Get-Content -Path $filePath -Raw
  $sha256 = [System.Security.Cryptography.SHA256]::Create()
  $hash = [System.BitConverter]::ToString($sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($fileContent))).Replace("-", "")
  Write-Host "SHA256 checksum of the file is: $hash"
  $fileName = Split-Path $FilePath -Leaf
  "$fileName`n$hash" | Out-File -FilePath $outputFilePath -Encoding ASCII
  
  Write-Host "Checksum saved to $outputFilePath"
} else {
  Write-Host "File not found!"
  if (Test-Path $filePath) {    $fileContent = Get-Content -Path $filePath -Raw
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hash = [System.BitConverter]::ToString($sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($fileContent))).Replace("-", "")
    
    Write-Host "SHA256 checksum of the file is: $hash"    
    
  } else {
    Write-Host "File not found!"
  }
}