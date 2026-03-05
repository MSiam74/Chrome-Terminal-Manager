# ==========================================================
# CHROME PROFILE LAUNCHER & LISTER
# ==========================================================

# 1. THE LISTER: Shows your folder names vs emails
# Use this to find which folder (Profile 1, etc.) matches your email.
function mail-profile {
    $localState = "$env:LOCALAPPDATA\Google\Chrome\User Data\Local State"
    if (Test-Path $localState) {
        $data = Get-Content $localState -Raw | ConvertFrom-Json
        $profiles = $data.profile.info_cache
        foreach ($p in $profiles.PSObject.Properties) {
            # Folder Name : Email Address (Account Nickname)
            Write-Host "$($p.Name): $($p.Value.user_name) ($($p.Value.name))" -ForegroundColor Cyan
        }
    }
}

# 2. THE LAUNCHER: Opens specific profiles and sites
function chrome {
    param(
        [string]$identity, # The profile nickname
        [string]$site = $null # Optional website or shortcut
    )
    $chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    
    # --- EDIT SITE SHORTCUTS HERE ---
    $url = switch ($site) {
        "fb"      { "https://facebook.com" }
        "gemini"  { "https://gemini.google.com" }
        "yt"      { "https://youtube.com" }
        Default   { $site } # Uses full URL if no shortcut matches
    }

    # --- EDIT PROFILE FOLDERS HERE ---
    # Run 'mail-profile' first to see your folder names!
    switch ($identity) {
        "work"    { & $chromePath --profile-directory="Default" $url }
        "social"  { & $chromePath --profile-directory="Profile 1" $url }
        "dev"     { & $chromePath --profile-directory="Profile 2" $url }
        
        Default { 
            Write-Host "Profile not found. Use 'mail-profile' to check." -ForegroundColor Yellow 
        }
    }
}