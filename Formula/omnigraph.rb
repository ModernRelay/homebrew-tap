class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.8.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.0/omnigraph-macos-arm64.tar.gz"
      sha256 "4c780033f74c2c85f9ea9980e8e013b6adf10d9159d57af087c2ebd97b49de5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "a3742277822985c5c3bb10a6331b2b14055420fe04de757d945aa048a719cdf7"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.0/omnigraph-linux-arm64.tar.gz"
      sha256 "1dbd559bb133937e2d10dcc796105bd845c5bd97d665a500fa37cbbe9dcf0915"
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
