# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LibimobiledeviceGlue < Formula
  desc "Library with common system API code for libimobiledevice projects"
  homepage "https://www.libimobiledevice.org/"
  url "https://github.com/lhuaz/libimobiledevice-glue/releases/download/1.0.1/libimobiledevice-glue-1.0.1.tar.bz2"
  license "LGPL-2.1-or-later"

  depends_on "pkg-config" => :build
  depends_on "libplist"

  def install
    system "./configure", *std_configure_args
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include "libimobiledevice-glue/utils.h"
      #include <libimobiledevice-glue/tlv.h>
      int main(int argc, char* argv[]) {
        tlv_buf_new();
        char *uuid = generate_uuid();
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-limobiledevice-glue-1.0", "-o", "test"
    assert_equal 0, $CHILD_STATUS.exitstatus
    system "./test"
    assert_equal 0, $CHILD_STATUS.exitstatus
  end
end
