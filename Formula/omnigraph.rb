class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.12.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.12.0/omnigraph-macos-arm64.tar.gz"
      sha256 "72b9ac379139c4dfe32fb75af5d976187a5e108c2c15169cf34231ab8cc34f5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.12.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "ef0e0772c9a74ea8979bb459d2f5b8ed00dbd1f2e06cc70eed91069ba87c9189"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.12.0/omnigraph-linux-arm64.tar.gz"
      sha256 "2f54cd9d7520f10a9b4b0c7e8974fa2d5175c87170f149749d471e96250e1a67"
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
