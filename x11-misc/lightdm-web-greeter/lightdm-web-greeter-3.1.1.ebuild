EAPI=6

DESCRIPTION="A greeter for LightDM using web technologies"
HOMEPAGE="https://github.com/JezerM/web-greeter"
SRC_URI="https://github.com/JezerM/web-greeter/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/gobject-introspection
  dev-qt/qtwebengine
  dev-python/PyQt5
  dev-python/PyQtWebEngine
	dev-python/python-xlib
  dev-python/ruamel-yaml
  dev-python/pygobject"
DEPEND="${RDEPEND}
	net-misc/rsync
  app-arch/zip
  sys-devel/make"

S="${WORKDIR}/web-greeter-${PV}"
