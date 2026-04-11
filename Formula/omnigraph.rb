class Omnigraph < Formula
  desc "Typed property graph database with Git-style workflows"
  homepage "https://github.com/ModernRelay/omnigraph"
  url "https://codeload.github.com/ModernRelay/omnigraph/tar.gz/816b24d05ed1aa4e33435f62e7ec993aba6e0572"
  version "0.4.0"
  sha256 "4ab243ea6ae99ff36ea709b08a3c433744c6514dafde1287163c4db8234eca35"
  license "MIT"
  head "https://github.com/ModernRelay/omnigraph.git", branch: "main"

  livecheck do
    skip "Versioned public tags are not published yet."
  end

  depends_on "protobuf" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked", "-p", "omnigraph-cli", "-p", "omnigraph-server"
    bin.install "target/release/omnigraph", "target/release/omnigraph-server"
  end

  test do
    assert_match "omnigraph ", shell_output("#{bin}/omnigraph version")
    assert_match "HTTP server for the Omnigraph graph database", shell_output("#{bin}/omnigraph-server --help")
  end
end
