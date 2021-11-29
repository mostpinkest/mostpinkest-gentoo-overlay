EAPI=6

DESCRIPTION="A greeter for LightDM using web technologies"
HOMEPAGE="https://github.com/JezerM/web-greeter"
if [[ ${PV} == 9999 ]]; then
  inherit git-r3
  EGIT_REPO_URI="https://github.com/jezerM/web-greeter.git"
else
  SRC_URI="https://github.com/JezerM/web-greeter/archive/refs/tags/${PV}.tar.gz"
  S="${WORKDIR}/web-greeter-${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-amd64 -x86"

RDEPEND="dev-libs/gobject-introspection
  dev-qt/qtwebengine
  dev-python/PyQt5
  dev-python/PyQtWebEngine
  dev-python/python-xlib
  dev-python/ruamel-yaml
  dev-python/pygobject
  x11-misc/lightdm"
DEPEND="${RDEPEND}
  net-misc/rsync
  app-arch/zip
  sys-devel/make"

src_install() {
  set +f
  if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
    emake DESTDIR="${D}" install
  fi

  if ! declare -p DOCS >/dev/null 2>&1 ; then
    local d
    for d in README* ChangeLog AUTHORS NEWS TODO CHANGES THANKS BUGS \
        FAQ CREDITS CHANGELOG ; do
      [[ -s "${d}" ]] && dodoc "${d}"
    done
  elif [[ $(declare -p DOCS) == "declare -a"* ]] ; then
    dodoc "${DOCS[@]}"
  else
    dodoc ${DOCS}
  fi
}

