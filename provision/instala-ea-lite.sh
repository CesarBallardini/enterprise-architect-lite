#!/usr/bin/bash -x
#!/usr/bin/env bash

[ -d /vagrant/tmp/ ] || mkdir /vagrant/tmp/
[ -f /vagrant/tmp/EALite.msi ] || wget --no-verbose https://sparxsystems.com/bin/EALite.msi

cd /vagrant/tmp/
[ -f ~/.wine/drive_c/Program\ Files\ \(x86\)/Sparx\ Systems/EA\ LITE/EA.exe ] || wineconsole  msiexec /i EALite.msi /qn -- --backend=curses
# con pantalla grafica, usa el backend "user" y abre ventanas, necesita X11 corriendo: wine msiexec /i EALite.msi /qn

#wine --version=windows8.1 'C:\Program Files (x86)\Sparx Systems\EA LITE\EA.exe'

