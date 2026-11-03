class Shardloom < Formula
  desc "Unified data processing engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v1.1.0/shardloom-4d11d4e9c234-source.tar.gz"
  sha256 "0bfaf34e69cf5462667e3494f19a0cedc9e47e5c77dffdcdda980e9cd1bae5d2"
  license "Apache-2.0"
  head "https://github.com/depsilon/shardloom.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "shardloom-cli"), "--features", "release-user-surfaces"
  end

  test do
    assert_match "shardloom #{version}", shell_output("#{bin}/shardloom --version")
    assert_match "fallback execution: disabled", shell_output("#{bin}/shardloom status")
  end
end
