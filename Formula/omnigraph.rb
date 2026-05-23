class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  license "MIT"
  version "0.5.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.5.0/omnigraph-macos-arm64.tar.gz"
    sha256 "67ad86f847fcd78ce57f755180b0908261f9886601acd3d1b70f6e9998709930"
  end

  on_linux do
    url "https://github.com/ModernRelay/omnigraph/releases/download/v0.5.0/omnigraph-linux-x86_64.tar.gz"
    sha256 "830a97fcd593ceb0018e0a329bfa1eca5dd9e01bf0421e60e09b5129508bea8f"
  end

  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "omnigraph", "omnigraph-server"
  end

  test do
    assert_match "omnigraph ", shell_output("#{bin}/omnigraph version")
    assert_match "HTTP server for the Omnigraph graph database", shell_output("#{bin}/omnigraph-server --help")
  end
end
