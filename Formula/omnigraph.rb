class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.14.0/omnigraph-macos-arm64.tar.gz"
      sha256 "91c8af54b859f023c42e2d3db37a2f3a361def0d6bb093530d53d3357986db83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.14.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "02bde3e3a2c6c8cf50dc9739a8b1041df87cfeaa6ab59f620e1d8e32acffd4d9"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.14.0/omnigraph-linux-arm64.tar.gz"
      sha256 "f7e731cbd1d6c1e13548d5995c0abff74a86b0efdd4367b457ada9a884b855ff"
    end
  end

  def install
    bin.install "omnigraph", "omnigraph-server", "omnigraph-azure-admission"
  end

  test do
    assert_match "omnigraph ", shell_output("#{bin}/omnigraph version")
    assert_match "HTTP server for the Omnigraph graph database", shell_output("#{bin}/omnigraph-server --help")
    assert_match "Azure Blob lease admission", shell_output("#{bin}/omnigraph-azure-admission --help")
  end
end
