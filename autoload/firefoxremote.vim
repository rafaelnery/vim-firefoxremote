
function! firefoxremote#EnviarComando( sCommand )

  if !exists("g:FirefoxRemotePort") 
    let g:FirefoxRemotePort=4242
  endif
  
  echo a:sCommand
  let l:sStringEnvio  =' " ' . a:sCommand . '; repl.quit();" |'
  let l:sStringEnvio .=' nc -w 1 localhost ' . g:FirefoxRemotePort " . ' 2>&1 > /dev/null '
  let x = system("echo " . l:sStringEnvio)
endfunction


function! firefoxremote#AtualizarFirefox()

" if !&modified
"   return 1
" endif

  let l:sComando =";"
  let l:sComando.="var iBrowserX = content.window.pageXOffset;"
  let l:sComando.="var iBrowserY = content.window.pageYOffset;"
  let l:sComando.="content.window.location.reload();"
  let l:sComando.="content.window.scrollTo(iBrowserX, iBrowserY);"
  call  firefoxremote#EnviarComando( l:sComando )
endfunction

function! firefoxremote#Redirecionar( sUrl )
 
  let l:sEnvio = ";"
  let l:sEnvio.= "repl.home();"
  let l:sEnvio.= "content.location.href = '" . a:sUrl . "';"
  let l:sEnvio.= "repl.enter(content);"
  call  firefoxremote#EnviarComando( l:sEnvio )
endfunction
