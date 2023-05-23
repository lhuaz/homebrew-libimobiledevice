# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libplist < Formula
  desc "Library with common system API code for libimobiledevice projects"
  homepage "https://www.libimobiledevice.org/"
  url "https://github.com/libimobiledevice/libplist/releases/download/2.3.0/libplist-2.3.0.tar.bz2"
  license "LGPL-2.1-or-later"

  depends_on "pkg-config" => :build

  def install
    system "./configure", *std_configure_args, '--without-cython'
    system "make", "install"
  end
end
