# Maintainer: kaiman <kaisfm at sohu dot com>
 
pkgname=mauikit
pkgver=git
pkgrel=0
pkgdesc='Tiny Qt Music Player to keep your favorite songs at hand'
arch=(x86_64)
url='https://vvave.kde.org/'
license=(GPL3)
depends=(ki18n knotifications qt5-webengine qt5-websockets taglib)
makedepends=(git python)
#optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
#source=('git+git://anongit.kde.org/mauikit.git')
source=(mauikit-git.zip)
sha256sums=('SKIP')

#pkgver() {
#  ln -s mauikit mauikit-git
#}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd build
  make DESTDIR="$pkgdir" install
  pwd
  mv ../../pkg/$pkgname/usr/lib64/* ../../pkg/$pkgname/usr/lib/
  rm -rf ../../pkg/$pkgname/usr/lib64
}
