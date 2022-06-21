# README - Enterprise Architect Lite

Enterprise Architect Lite es un visor gratuito para archivos de Enterprise Architect.


Este software funciona solamente sobre MS Windows, y por eso en este repo 
se crea una VM mediante Virtualbox y Vagrant para instalar Wine como emulador de MS Windows.

Puede ejecutarlo desde dentro de la VM mediante el mandato:

```bash
wine  'C:/Program Files (x86)/Sparx Systems/EA LITE/EA.exe'

```

# Cómo utilizar la VM para correr Enterprise Architect Lite

## Requisitos

Debe tener instalados:

* Oracle Virtualbox y Oracle VM VirtualBox Extension Pack
* Vagrant
* Plugins de Vagrant:
  * vagrant-proxyconf y su configuracion si requiere de un Proxy para salir a Internet
  * vagrant-cachier
  * vagrant-disksize
  * vagrant-share
  * vagrant-vbguest
* Git

## Clone el repositorio

```bash
git clone https://github.com/CesarBallardini/enterprise-architect-lite
cd enterprise-architect-lite/
```

## Ejecute Vagrant


* levantamos la VM

```bash
time vagrant up
```

* obtenemos un shell dentro de la VM

```bash
vagrant ssh
```

* ejecutamos EA Lite

```bash
wine  'C:/Program Files (x86)/Sparx Systems/EA LITE/EA.exe'
```

* detenemos la VM

```bash
vagrant halt
```

Si ya no desea usar la VM, puede destruirla completamente con:

```bash
vagrant destroy
```

