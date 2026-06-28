class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.2.1/shardloom-19e9a3da28be-source.tar.gz"
  version "0.2.1"
  sha256 "b8dca86a3dd3ebe72ae2a81444673811607a33eba5d0c7ab78ca03e8160598c4"
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
