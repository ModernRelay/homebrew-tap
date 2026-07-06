class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  version "0.8.1"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.1/omnigraph-macos-arm64.tar.gz"
      sha256 "866e92eda453ee30acbfcaaed4f5a59accf2ad602964d6076c01c8da2637e282"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.1/omnigraph-linux-x86_64.tar.gz"
      sha256 "c25e2bb5358887e64e33d3135370e80ea215a54608df723d97d9cac67b7f9e3e"
    end
    on_arm do
      url "https://github.com/ModernRelay/omnigraph/releases/download/v0.8.1/omnigraph-linux-arm64.tar.gz"
      sha256 "903750141ca449a386d6bc44949d6cb19e0965e6ebcbf6def2961d4841359a41"
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
