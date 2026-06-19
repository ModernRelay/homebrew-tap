class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.7.1"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.7.1/omnigraph-macos-arm64.tar.gz"
      sha256 "8bf3f3feba3776c9f2075dbed0a60fc64deecd56e738de35cfa68609d87285ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.7.1/omnigraph-linux-x86_64.tar.gz"
      sha256 "52b17e05d1fa7b91b25914a982683dd9f28404166b10b7f0b9cc3ec580ffb76f"
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
