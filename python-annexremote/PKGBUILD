# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.6.5
pkgrel=1
pkgdesc='git annex special remotes made easy'
url="https://github.com/Lykos153/$_pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('da3c70d00a7ae75d11a672b1e6a263a1fec01aff664552dba04cdee5e14d2179')

build() {
	cd "$_pkgname"
	python -m build -wn
}

package() {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
