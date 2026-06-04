class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.6.1"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.6.1/omnigraph-macos-arm64.tar.gz"
      sha256 "6fb9e22b6432762af58c60e05fff7910245c49f21b716d6529bbed0d966bcddb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.6.1/omnigraph-linux-x86_64.tar.gz"
      sha256 "e9d909b3844956cfd8f89fb2da775d9ae72cfc22ce3d2c3f0f40a17cbc5f2dad"
    end
  end

  def install
    bin.install "omnigraph", "omnigraph-server"
  end

  test do
    assert_match "omnigraph ", shell_output("#{bin}/omnigraph version")
    assert_match "HTTP server for the Omnigraph graph database", shell_output("#{bin}/omnigraph-server --help")
  end
end
