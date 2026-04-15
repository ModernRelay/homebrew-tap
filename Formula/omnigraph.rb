class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.2.2/omnigraph-macos-arm64.tar.gz"
      sha256 "53422374e91625ad23c3fdcacc703fda37aafe948f077cc05d45911f752d9e4c"
    else
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.2.2/omnigraph-macos-x86_64.tar.gz"
      sha256 "1cd3ae57efb0fddca3ed772a9d56045b8e6dba7f59914af07c74417e50d43d1e"
    end
  end

  on_linux do
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.2.2/omnigraph-linux-x86_64.tar.gz"
    sha256 "5c696fd217c18968a331545964d7b6082ba0a58487abf4c02ace7bc670b5e56d"
  end

  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "omnigraph", "omnigraph-server"
  end

  test do
    assert_match "omnigraph ", shell_output("#{bin}/omnigraph version")
    assert_match "HTTP server for the Omnigraph graph database", shell_output("#{bin}/omnigraph-server --help")
  end
end
