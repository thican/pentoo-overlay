# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit python-single-r1 git-r3

DESCRIPTION="GyoiThon is a growing penetration test tool using Machine Learning"
HOMEPAGE="https://github.com/gyoisamurai/GyoiThon"
EGIT_REPO_URI="https://github.com/gyoisamurai/GyoiThon.git"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/faust-cchardet[${PYTHON_USEDEP}]
		dev-python/censys[${PYTHON_USEDEP}]
		dev-python/docopt[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/PySocks[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/Scrapy[${PYTHON_USEDEP}]
		>=dev-python/google-api-python-client-1.7.4[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/tldextract[${PYTHON_USEDEP}]
	')
"

DEPEND="${RDEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	#relax deps
	sed -e 's|==.*||' -i requirements.txt || die "sed failed"
	sed '/metplotlib/d' -i requirements.txt || die "sed failed"
	eapply_user
}

#src_install() {
#	insinto $(python_get_sitedir)
#	doins myparser.py
#	insinto $(python_get_sitedir)/discovery
#	doins -r discovery/*
#	insinto $(python_get_sitedir)/lib
#	doins lib/*.py
#	newbin theHarvester.py theharvester
#	dodoc README.md LICENSES
#}
