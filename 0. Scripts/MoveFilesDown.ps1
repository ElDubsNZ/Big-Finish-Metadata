# The following resolves a system issue where filepaths can only be 260 characters long, so if your filepath is quite long, this will resolve the issue by allowing filepaths to be longer.
# This can be removed if you're okay with manually fixing any that fail to move.
[System.AppContext]::SetSwitch('Switch.System.IO.UseLegacyPathHandling', $false)
[System.AppContext]::SetSwitch('Switch.System.IO.BlockLongPaths', $false)
[System.Type]::GetType('System.AppContextSwitches').GetField('_useLegacyPathHandling', [System.Reflection.BindingFlags]::Static -bor [System.Reflection.BindingFlags]::NonPublic).SetValue($null, 0)
[System.Type]::GetType('System.AppContextSwitches').GetField('_blockLongPaths', [System.Reflection.BindingFlags]::Static -bor [System.Reflection.BindingFlags]::NonPublic).SetValue($null, 0)

# Define the root directory to start the search
$rootDirectory = "\\dubNAS\Documents\Big Finish Test\Big Finish\1. Doctor Who"

# Get all files in the root directory and its subdirectories
$files = Get-ChildItem -Path $rootDirectory -Recurse -File

foreach ($file in $files) {
    # Check if the file name ends with an ellipsis and adjust the folder name accordingly
    $folderName = if ($file.BaseName -match "\.\.\.$") {
        # Remove the ellipsis for the folder name
        $file.BaseName.Substring(0, $file.BaseName.Length - 3)
    } else {
        $file.BaseName
    }
    # Same but for a two point elipses.
    $folderName = if ($file.BaseName -match "\.\.$") {
        # Remove the ellipsis for the folder name
        $file.BaseName.Substring(0, $file.BaseName.Length - 3)
    } else {
        $file.BaseName
    }

    # Create a new directory path
    $newDirectory = Join-Path $file.Directory.FullName $folderName
    
    # Create the directory if it doesn't exist
    if (-not (Test-Path -Path $newDirectory)) {
        New-Item -ItemType Directory -Path $newDirectory
    }

    # Move the file into the new directory
    Move-Item -Path $file.FullName -Destination $newDirectory
}
