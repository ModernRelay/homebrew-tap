class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  version "0.4.1"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.4.1/omnigraph-macos-arm64.tar.gz"
    sha256 "250a3b5d38ddd484a1a189d80d3074ba5fc4e6e9dd844dfe4ee1918dd987a50e"
  end

  on_linux do
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.4.1/omnigraph-linux-x86_64.tar.gz"
    sha256 "a690fcd85251bd20e9506a479e06f5d140bf04db4eeabe8a0b83bb0afb7084a9"
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
