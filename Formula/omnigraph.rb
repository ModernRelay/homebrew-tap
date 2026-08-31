class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.10.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.10.0/omnigraph-macos-arm64.tar.gz"
      sha256 "7c3b8fadbe590486a192c734d8c3d38cce0e4da1f02940e6ac306c1ada67f171"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.10.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "05d3ce4ec0ab51a876befd89b643c3e7f2d5489be0398a38cef6fb3a0d257fc1"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.10.0/omnigraph-linux-arm64.tar.gz"
      sha256 "dd3ac09123a68882454db7e689da4c306c41677826237098df4e76b0f73d8d5e"
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
