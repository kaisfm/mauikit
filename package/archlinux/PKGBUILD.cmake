# Maintainer: kaiman <kaisfm at sohu dot com>
 
pkgname=mauikit
pkgver=git
pkgrel=0
pkgdesc='Multi-Adaptable UserInterfaces for Linux and Android Apps(Kit for developing MAUI Apps).'
arch=(x86_64)
url='https://mauikit.org/'
license=(GPL3)
depends=(ki18n knotifications qt5-webengine qt5-websockets taglib)
makedepends=(git python)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+git://anongit.kde.org/mauikit.git')
sha256sums=('SKIP')

#pkgver() {
#  ln -s mauikit mauikit-git
#}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd build
  make DESTDIR="$pkgdir" install
  pwd
  mv ../../pkg/$pkgname/usr/lib64/* ../../pkg/$pkgname/usr/lib/
  rm -rf ../../pkg/$pkgname/usr/lib64
}
