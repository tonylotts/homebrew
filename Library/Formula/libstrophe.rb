require "formula"

class Libstrophe < Formula
  homepage "http://strophe.im/libstrophe"
  url "https://github.com/strophe/libstrophe.git"
  sha1 "d408eaf2bbfe5ff5c56eab01463c278f9891c08e"
  version "current"

  option "with-libxml2", "Use libxml2 (default expat)"

  depends_on :autoconf
  depends_on :automake
  depends_on "libxml2" => :optional

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --mandir=#{man}
    ]
    if build.with? "libxml2"
      args.push(--with-libxml2)
    end

    man.mkpath
    system "./bootstrap.sh"
    system "./configure", *args
    system "make install"
  end
end
