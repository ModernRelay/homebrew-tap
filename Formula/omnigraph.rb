class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.11.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.11.0/omnigraph-macos-arm64.tar.gz"
      sha256 "64ed446169e01d2aceb9e8635b73a593681d71414e73dc0d67b0f6700048e4c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.11.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "da192e1a050875a93ee642b9df485203a00d8c0d44ca39204439463ad41a766d"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.11.0/omnigraph-linux-arm64.tar.gz"
      sha256 "af6be5f1069d7591985285871450bc0d68d4dc363bf7c2c0a7cca33915a8f4bb"
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
