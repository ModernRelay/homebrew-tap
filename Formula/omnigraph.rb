class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.3.0/omnigraph-macos-arm64.tar.gz"
      sha256 "80f4851c7d2dd2e57a012338e3991f06ef39ff77944eb902cef8ad513cc6d2b4"
    else
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.3.0/omnigraph-macos-x86_64.tar.gz"
      sha256 "0527bfbbb433a8fdb71f2078171d3547a3368bdaa1f32ad9cd2cbf9cbe8b3efa"
    end
  end

  on_linux do
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.3.0/omnigraph-linux-x86_64.tar.gz"
    sha256 "6047f52b4287bc2f466e7aef6c4fbb9f9537c09e8c447d54707970a50dd224d3"
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
