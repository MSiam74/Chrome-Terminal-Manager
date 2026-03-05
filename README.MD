# Chrome-Terminal-Manager
A cross-platform terminal utility to list, manage, and launch Google Chrome profiles with custom nicknames and site shortcuts.

This project provides a streamlined way for power users to manage multiple Google Chrome profiles directly from the command line. Inspired by Linux terminal workflows, this script bridges the gap for users who switch between Kali Linux and Windows 10. Instead of clicking through Chrome’s UI to switch accounts, you can simply type a nickname or email to launch a specific profile—with or without a target website.

It solves the common problem of identifying which Chrome folder (e.g., Profile 1, Profile 10) belongs to which email address by including a built-in "Lister" function.

💡 What’s Inside?
The Script Components

    The Lister (mail-profile): Deep-dives into Chrome’s Local State JSON file to pair folder names with user emails and nicknames.

    The Launcher (chrome): A logic-based function that accepts an "identity" and an optional "site".

    Smart Aliasing: Allows you to use short names (like siam112t) instead of typing long email addresses.

    Dynamic Shortcuts: Supports internal keyword mapping (e.g., typing fb to load facebook.com).

🛠️ Developer Focus

This repo is designed for users who:

    Use a large number of Chrome profiles for development, social media, or research.

    Prefer keyboard-centric navigation over mouse interaction.

    Want a consistent terminal experience across different operating systems.

📂 File Structure

    ChromeLauncher.ps1: The main PowerShell script for Windows 10.

    README.md: Setup instructions and usage examples.






⚙️ Setup Instructions



Step 1: Open your Terminal

Press Windows Key + X, then press A to open PowerShell (Admin). You must use PowerShell for this script to function.

Step 2: Enable Script Execution

By default, Windows blocks personal scripts. Run this command to allow your custom profile to load:

PowerShell

Set-ExecutionPolicy RemoteSigned -Force


Step 3: Create/Open your Profile Script

Run the following command to open your "Auto-run" terminal configuration in Notepad:

PowerShell

if (!(Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }; notepad $PROFILE


Step 4: Paste the Code

Copy the script and paste it into the Notepad window:


Step 5: Save and Refresh

    In Notepad, press Ctrl + S to save, then close it.

    In PowerShell, type: . $PROFILE to load your new commands.

🚀 Usage Examples

    See all profiles: Type mail-profile to see which folder is which.

    Open a profile: Type chrome example@gmail.com.

    Open a profile at a specific site: Type chrome example@gmail.com fb or chrome example@gmail.com gemini.

    Open any URL: Type chrome https://github.com.

📝 Customization Guide

    Adding Profiles: Run mail-profile, find the folder name, and add a new line to the switch ($identity) section of the script.

    Adding Sites: Add a new line to the $url = switch ($site) section following the existing format.