require "formula"

class Profanity < Formula
  homepage "http://www.profanity.im"
  url "https://github.com/boothj5/profanity/archive/0.3.1.tar.gz"
  sha1 "c68d856eedfb1eec9aff453b72eab2565e35ba42"

  depends_on 'pkg-config' => :build
  depends_on "curl"       => :build
  depends_on "glib"       => :build
  depends_on "openssl"    => :build

  depends_on :autoconf
  depends_on :automake
  depends_on "ncurses"
  depends_on "libstrophe"

  def install
    system "./bootstrap.sh"
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
