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
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.15.0/omnigraph-macos-arm64.tar.gz"
      sha256 "c783dc9d0e3660b74a9c2e6c5591bf1e4df9a763ce322958526c0872e9ca1aec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.15.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "d7312ce49abca47a6bb47956b6987d32f650fa91678be1abd10e02824937bb15"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.15.0/omnigraph-linux-arm64.tar.gz"
      sha256 "fa1082636bb3927d61dcf9d22bb4e08eb0fb446d08e746738869e40c363b4755"
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
