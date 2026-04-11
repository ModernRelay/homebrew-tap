class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.1.0/omnigraph-macos-arm64.tar.gz"
      sha256 "96aadeb1a5c9b556ee2311225bb2beb5b5bf6fb7d817d959aca856dc57fd6f07"
    else
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.1.0/omnigraph-macos-x86_64.tar.gz"
      sha256 "8a83ddd9675760e4e224810b437dbcd8fd0675f4399d21f6e9fe31f59491edd7"
    end
  end

  on_linux do
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.1.0/omnigraph-linux-x86_64.tar.gz"
    sha256 "34f73bcf12f38f9f08e413986714e9ae66116d56646e173c52b8be205c869b8d"
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
