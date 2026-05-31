class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.6.0"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.6.0/omnigraph-macos-arm64.tar.gz"
      sha256 "58c3d6099bfba4e589ca31f8e98a4e9d346248a70e77268007e866fe2338f020"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.6.0/omnigraph-linux-x86_64.tar.gz"
      sha256 "f92f884a3d3bf0276c971c5d6bc01299ce288a2d028e9cee0f6d828d548ea55e"
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
