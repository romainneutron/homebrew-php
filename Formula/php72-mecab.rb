require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Mecab < AbstractPhp72Extension
  init
  desc "MeCab binding for PHP"
  homepage "https://github.com/rsky/php-mecab"
  url "https://github.com/rsky/php-mecab/archive/v0.6.0.tar.gz"
  sha256 "8ec57164dd208f700ca16853f07fb62f111e16b025ca1ab5d4100aaaa9aa7c58"
  head "https://github.com/rsky/php-mecab.git"

  depends_on "mecab"

  def install
    Dir.chdir "mecab"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          "--with-mecab=#{HOMEBREW_PREFIX}/opt/mecab",
                          phpconfig
    system "make"
    prefix.install "modules/mecab.so"
    write_config_file if build.with? "config-file"
  end
end
