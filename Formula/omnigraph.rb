class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.9.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.9.0/omnigraph-macos-arm64.tar.gz"
      sha256 "69f78c93e661e8ea2b92deafe6330650a0921a003c2099b75b226482a90dc03e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.9.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "507a36f385bea073e7f284fe476befbb4cd788b32bfa85d6f4cd5e943b663197"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.9.0/omnigraph-linux-arm64.tar.gz"
      sha256 "6742a7fcf2761cb5841a38990c38383d7a884da2c65e3e7cc884afbbf2b2d881"
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
