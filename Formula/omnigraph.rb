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
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.13.0/omnigraph-macos-arm64.tar.gz"
      sha256 "0a1c7f013e18465254fb925dc177f3089bf6e0cfe4a0ecfc9908a180ab84cc72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.13.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "0123daa64f0f2db9860284200bd71c79a22a6ad2c6f5501b6fca24cac86a7a30"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.13.0/omnigraph-linux-arm64.tar.gz"
      sha256 "e61e7379131a05056bfeace206c8c5bcdf185d169d1ce86bc192d52f13693f96"
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
