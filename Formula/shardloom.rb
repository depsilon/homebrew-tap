class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.2.2/shardloom-3b5903672c38-source.tar.gz"
  version "0.2.2"
  sha256 "791270357492e85d90b2097cfd15aa7c6ef39f1e6c3de2cd195a7e6fb6563d56"
  license "Apache-2.0"
  head "https://github.com/depsilon/shardloom.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "shardloom-cli"), "--features", "release-user-surfaces"
  end

  test do
    assert_match "fallback execution: disabled", shell_output("#{bin}/shardloom status")
  end
end
