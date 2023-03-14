$Applications = Get-AzureADApplication -all $true

$Days = 30
$now = get-date

    foreach ($app in $Applications) {
        $AppName = $app.DisplayName
        $AppID = $app.objectid 
        $ApplID = $app.AppId
        $secret = $App.PasswordCredentials
        # $cert = $AppCreds.KeyCredentials
             foreach ($s in $secret) {
             $StartDate = $s.StartDate
             $EndDate = $s.EndDate
             $operation = $EndDate - $now
             $ODays = $operation.Days
             
               if ($ODays -gt $Days)
                {
                #Renew Secret
                     Remove-AzADAppCredential -ObjectId $AppID
                      $newCredential = New-AzADAppCredential -ObjectId $AppID
                     $newCredential
                                                
                }

                else
                {
                    write-host "No need to renew" $AppName
                }

               }
               }
               


             
        