function n {
  nvim @args
}

function nh {
  nvim . @args
}

function nc {
  Set-Location (Join-Path $HOME ".config/nvim")
  nvim . @args
}

# Creates a new file in ~/scratches of the specified file type.
function ns {
  if ($args.Count -ne 1) {
    Write-Error "Must provide exactly one argument.`nUsage: ns <filetype>"
    return
  }

  $directory = Join-Path $HOME "scratches"
  $extension = $args[0]

  New-Item -ItemType Directory -Path $directory -Force | Out-Null

  $index = 0
  do {
    $fileName = Join-Path $directory "scratch_${index}.${extension}"
    $index++
  } while (Test-Path -LiteralPath $fileName)

  nvim $fileName
}
