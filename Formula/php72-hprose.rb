require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Hprose < AbstractPhp72Extension
  init
  desc "High Performance Remote Object Service Engine"
  homepage "https://pecl.php.net/package/hprose"
  url "https://pecl.php.net/get/hprose-1.6.5.tgz"
  sha256 "a453053719dad6352d54543d708d8d09b62de28df7b29fd47b4b5a9fcf8025a7"
  head "https://github.com/hprose/hprose-pecl.git"

  def install
    Dir.chdir "hprose-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/hprose.so"
    write_config_file if build.with? "config-file"
  end
end
