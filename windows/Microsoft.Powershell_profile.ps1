# remove any existing aliases
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
Remove-Item Alias:ll -Force -ErrorAction SilentlyContinue
Remove-Item Alias:g -Force -ErrorAction SilentlyContinue
Remove-Item Alias:rm -Force -ErrorAction SilentlyContinue

# set the encoding
$OutputEncoding = [text.encoding]::utf8


# custom functions
function g {
   param($file)
   gvim --remote-tab-silent $file
}

function pro {
   gvim $profile
}   

function shorten-path([string] $path) { 
   $loc = $path.Replace($HOME, '~') 
   # remove prefix for UNC paths 
   $loc = $loc -replace '^[^:]+::', '' 
   # make path shorter like tabs in Vim, 
   # handle paths starting with \\ and . correctly 
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2') 
}

function prompt { 
   $green = [ConsoleColor]::Green 
   $blue = [ConsoleColor]::Blue

   write-host "$([char]0x1A9) " -n -f $green
   #write-host ([net.dns]::GetHostName()) -n -f $chost 
   write-host (shorten-path (pwd).Path) -n -f $blue
   write-host " $([char]0x0BB)" -n -f $green
   return ' ' 
}

function pp {
    cd C:\work\1953\e3\components\omt\bundles\oms\pOMS.main
}

function osp {
    cd C:\work\1953\e3\components\omt\services\OrderService\pOMS.main
}

function tp {
    cd C:\work\1953\e3\components\omt\products\test\TestProduct\pOMS.main
}

