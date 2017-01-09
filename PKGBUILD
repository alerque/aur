# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=gitlab
pkgname=gitlab-ee
pkgver=8.15.3
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-ce/tree/master#README"
license=('MIT')
conflicts=('gitlab')
provides=('gitlab')
depends=('ruby' 'git' 'ruby-bundler' 'gitlab-workhorse' 'openssh' 'redis' 'libxslt' 'icu' 'nodejs')
makedepends=('cmake' 'postgresql' 'mariadb')
optdepends=('postgresql: database backend'
            'mysql: database backend'
            'python2-docutils: reStructuredText markup language support'
            'smtp-server: mail server in order to receive mail notifications')
backup=("etc/webapps/${_pkgname}/application.rb"
        "etc/webapps/${_pkgname}/gitlab.yml"
        "etc/webapps/${_pkgname}/resque.yml"
        "etc/webapps/${_pkgname}/unicorn.rb"
        "etc/logrotate.d/${_pkgname}")
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/gitlab-org/gitlab-ee/repository/archive.tar.bz2?ref=v${pkgver}-ee"
        gitlab-unicorn.service
        gitlab-sidekiq.service
        gitlab-backup.service
        gitlab-mailroom.service
        gitlab-backup.timer
        gitlab.target
        gitlab.tmpfiles.d
        gitlab.logrotate
        apache.conf.example
        apache-ssl.conf.example
        apache2.2.conf.example
        apache2.2-ssl.conf.example
        nginx.conf.example
        nginx-ssl.conf.example
        lighttpd.conf.example)
install='gitlab.install'
sha512sums=('8e425200d0b9005157c7f717c81c1bb64ad386a6e092f8809d5de69d6f83f969237a21a4650196b1494be1b3cf038a4352096a269dd7eb764b0ab696f9a93b89'
            '1464ca9399b627bb8bd286608b4ad93feca6bc54c7e63c98180744e710295508a89a1a34c412b82e3eaad9308a82b2ea2483ae0f0b1e1149c24b17ab0d126f69'
            '9844b8e42e8d50e6eac54711fb8c9745d506560676e0b8d5f1c42fb5177b9b4bac5c0d3c6a673d9e54f4b5e21056627db1d434c5c76d4f3ede8cc15a109f3cb6'
            'e74f54224e7fd5f24c3459f34649ce5fddc70886faf7eb8520513d8715b3c17452aab62676b779c136ba576193a09ae3a5471abe51013d7ecd8b37d6e0acd393'
            '97b566751405ad46204f9d42e835a20aa330436929674913acfb35a2a1fdce06975f15db4f83708ec5d1ab4509b6d34f1bc23e43f0db1bf28073c4bd865cb007'
            'c11d2c59da8325551a465227096e8d39b0e4bcd5b1db21565cf3439e431838c04bc00aa6f07f4d493f3f47fd6b4e25aeb0fe0fc1a05756064706bf5708c960ec'
            'c519a51d31300074ea12594fbcc8e9610d991ef04b1dac94d93a2b201df3465999cc7c6ac7f3896e02b117c2366d61dea1ef2f6b9cd7b18998385a7f26e5700f'
            'abacbff0d7be918337a17b56481c84e6bf3eddd9551efe78ba9fb74337179e95c9b60f41c49f275e05074a4074a616be36fa208a48fc12d5b940f0554fbd89c3'
            '20b93eab504e82cc4401685b59e6311b4d2c0285bc594d47ce4106d3f418a3e2ba92c4f49732748c0ba913aa3e3299126166e37d2a2d5b4d327d66bae4b8abda'
            '441585489fb992d5e893f14bf0770df04ada95ffdbfcc80bb98a44eda7db520d12c985f600d003d80a196562654d2231598f8481ff9bf664bb5889f564e897e7'
            '99f31439d348e21f764875b6207db8663b47f3224ad6a9f35b89c8a2ed29a9e831a974aa6b9429a3882fb74c1c9d42ed5c38b2d16ae122b5d55d5873a0c57cd3'
            '624eb1f13e0265522290faa8c22b4150e6081ca2580391c9dfd871f1ee1b9c1c745c95d3d8f7fdbf85038990060141b844c3d8097c577ab68e5506bfa2d2dddb'
            '248d47b44fa5ed65e2a940f2b60d0482c481b3a438357ca510848221370367ffbc0d83ce046d688bebbbc75d4e321b140f6a5ce1a9d7ec0b034fafcf92dee107'
            '53a9d6d6f87874b29e48a8fb2e207094ebc1a80af478562ec4b591926d59e135a3166c20966704aa948ca7063ba63c1ec4ac290a343832fa18025ec3d85081ba'
            '6d3006da591acefcc534c6e3f1da8e812d0b3b21fc416bfaa8678b8e2d922be6b17d1c92b0d7164de3b8ad864139253707107ca082f78e823d23f3b65fcb5914'
            'c78b6f46abcf603d8db6e38cf50868e14145928422ddfe17c88e2f006b5b910dddf456ec5d6d724b250994530643963809688a98f7e12ebd5b5dabf7f96f0e06')

_datadir="/usr/share/webapps/${_pkgname}"
_etcdir="/etc/webapps/${_pkgname}"
_homedir="/var/lib/${_pkgname}"
_logdir="/var/log/${_pkgname}"
_srcdir="${_pkgname}-ee-v${pkgver/_/-}-ee-"

prepare() {
  cd "${srcdir}/${_srcdir}"*

  export SKIP_STORAGE_VALIDATION='true'

  # Patching config files:
  msg2 "Patching paths in and username gitlab.yml..."
  sed -e "s|# user: git|user: gitlab|" \
      -e "s|/home/git/repositories|${_homedir}/repositories|" \
      -e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
      -e "s|# path: /mnt/gitlab|path: ${_homedir}/shared|" \
      -e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
      -e "s|tmp/backups|${_homedir}/backups|" \
      config/gitlab.yml.example > config/gitlab.yml

  msg2 "Patching paths and timeout in unicorn.rb..."
  sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
      -e "s|/var/run/|/run/|g" \
      -e "s|/home/git/gitlab|${_datadir}|g" \
      -e "s|timeout 30|timeout 300|" \
      -e "s|${_datadir}/log/|${_logdir}/|g" \
      config/unicorn.rb.example > config/unicorn.rb

  # We need this one untouched because otherwise assets will fail
  cp config/database.yml.postgresql config/database.yml.postgresql.orig

  msg2 "Patching username in database.yml.{mysql,postgresql}..."
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.mysql
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.postgresql

  msg2 "Patching redis connection in resque.yml"
  sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
      config/resque.yml.example > config/resque.yml.patched

  msg2 "Setting up systemd service files ..."
  for service_file in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab-backup.service gitlab-mailroom.service; do
    sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${service_file}"
    sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${service_file}"
    sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${service_file}"
  done
}

build() {
  cd "${srcdir}/${_srcdir}"*
  
  export SKIP_STORAGE_VALIDATION='true'

  msg "Fetching bundled gems..."
  # Gems will be installed into vendor/bundle

  bundle config build.nokogiri --use-system-libraries
  bundle install -j$(nproc) --no-cache --deployment --without development test aws

  # We'll temporarily stick this in here so we can build the assets
  cp config/database.yml.postgresql.orig config/database.yml
  cp config/resque.yml.example config/resque.yml
  sed -i 's/url.*/nope.sock/g' config/resque.yml

  bundle exec rake assets:precompile RAILS_ENV=production --trace

  # After building assets, clean this up again
  rm config/database.yml config/database.yml.postgresql.orig
  mv config/resque.yml.patched config/resque.yml
}

package() {
  cd "${srcdir}/${_srcdir}"*
  depends+=('gitlab-shell>=4.0.0')

  install -d "${pkgdir}/usr/share/webapps"

  cp -r "${srcdir}/${_srcdir}"* "${pkgdir}${_datadir}"
  chown -R root:root "${pkgdir}${_datadir}"
  chmod 755 "${pkgdir}${_datadir}"

  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/satellites"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/shared/"{,artifacts,lfs-objects}
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/builds"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/uploads"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/backups"
  install -dm750 -o 105 -g 105 "${pkgdir}${_etcdir}"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"

  ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"
  ln -fs /run/gitlab "${pkgdir}${_homedir}/sockets"
  ln -fs ${_datadir}/log "${pkgdir}${_homedir}/log"

  rm -rf "${pkgdir}${_datadir}/public/uploads" && ln -fs "${_homedir}/uploads" "${pkgdir}${_datadir}/public/uploads"
  rm -rf "${pkgdir}${_datadir}/builds" && ln -fs "${_homedir}/builds" "${pkgdir}${_datadir}/builds"
  rm -rf "${pkgdir}${_datadir}/tmp" && ln -fs /var/tmp "${pkgdir}${_datadir}/tmp"
  rm -rf "${pkgdir}${_datadir}/log" && ln -fs "${_logdir}" "${pkgdir}${_datadir}/log"

  mv "${pkgdir}${_datadir}/.gitlab_workhorse_secret" "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chmod 660 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chown root:105 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  ln -fs "${_etcdir}/gitlab_workhorse_secret" "${pkgdir}${_datadir}/.gitlab_workhorse_secret"

  ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

  sed -i "s|require_relative '../lib|require '${_datadir}/lib|" config/application.rb

  # Install config files
  for config_file in application.rb gitlab.yml unicorn.rb resque.yml; do
    mv "config/${config_file}" "${pkgdir}${_etcdir}/"
    [[ -f "${pkgdir}${_datadir}/config/${config_file}" ]] && rm "${pkgdir}${_datadir}/config/${config_file}"
    ln -fs "${_etcdir}/${config_file}" "${pkgdir}${_datadir}/config/"
  done

  # Install database symlink
  ln -fs "${_etcdir}/database.yml" "${pkgdir}${_datadir}/config/database.yml"

  # Install secrets symlink
  ln -fs "${_etcdir}/secrets.yml" "${pkgdir}${_datadir}/config/secrets.yml"

  # Install license and help files
  mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG.md PROCESS.md VERSION config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # https://gitlab.com/gitlab-org/gitlab-ce/issues/765
  cp -r "${pkgdir}${_datadir}/doc" "${pkgdir}${_datadir}/public/help"
  find "${pkgdir}${_datadir}/public/help" -name "*.md" -exec rm {} \;
  find "${pkgdir}${_datadir}/public/help/" -depth -type d -empty -exec rmdir {} \;

  chown 105:105 "${pkgdir}${_datadir}/db/schema.rb"

  # Install systemd service files
  for service_file in gitlab-unicorn.service gitlab-sidekiq.service gitlab-backup.service gitlab-backup.timer gitlab.target gitlab-mailroom.service; do
    install -Dm644 "${srcdir}/${service_file}" "${pkgdir}/usr/lib/systemd/system/${service_file}"
  done

  install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"
  install -Dm644 "${srcdir}/gitlab.logrotate" "${pkgdir}/etc/logrotate.d/gitlab"

  # Install webserver config templates
  for config_file in apache apache-ssl apache2.2 apache2.2-ssl nginx nginx-ssl lighttpd; do
    install -m644 "${srcdir}/${config_file}.conf.example" "${pkgdir}/usr/share/doc/${_pkgname}"
  done
}

# vim:set ts=2 sw=2 et:
