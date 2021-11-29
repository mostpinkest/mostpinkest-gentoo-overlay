EAPI=6

DESCRIPTION="A WebKit-based theme for LightDM"
HOMEPAGE="https://github.com/NoiSek/Aether"
if [[ ${PV} == 9999 ]]; then
  inherit git-r3
  EGIT_REPO_URI="https://github.com/NoiSek/Aether.git"
else
  SRC_URI="https://github.com/JezerM/web-greeter/archive/refs/tags/${PV}.tar.bz2"
  KEYWORDS="~amd64 ~x86"
  S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-misc/lightdm-web-greeter"

src_install() {
  insinto /usr/share/web-greeter/themes/Aether
  doins -r . || die "Install failed!"
}

pkg_postinst() {
  ewarn "To apply the theme:"
  ewarn "1. Set 'theme' to 'Aether' in /etc/lightdm/web-greeter.yml"
  ewarn "2. Set 'greeter-session' to 'web-greeter' in /etc/lightdm/lightdm.conf"
}
