
command! -nargs=1 FirefoxRemoteReload       silent call firefoxremote#AtualizarFirefox(<args>)
command! -nargs=1 FirefoxRemoteGoTo         silent call firefoxremote#Redirecionar(<args>)
command! -nargs=1 FirefoxRemoteHttpRedirect silent call firefoxremote#Redirecionar("http://" . <args>)
