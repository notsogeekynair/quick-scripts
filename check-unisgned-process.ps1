Get-Process | ForEach-Object {
    try {
        $path = $_.MainModule.FileName
        if ($path -and (Test-Path $path)) {
            $sig = Get-AuthenticodeSignature $path
            $signedBy = $sig.SignerCertificate.Subject
            $isMicrosoft = $signedBy -like "*O=Microsoft Corporation*"
            if ($sig.Status -ne 'Valid' -or -not $isMicrosoft) {
                [PSCustomObject]@{
                    ProcessName = $_.ProcessName
                    Path        = $path
                    Signature   = $sig.Status
                    SignedBy    = $signedBy
                }
            }
        }
    } catch {
        # Skip inaccessible processes
    }
} | Sort-Object Signature | Format-Table -AutoSize
