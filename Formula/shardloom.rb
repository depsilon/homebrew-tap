class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.1.10/shardloom-7464854a0b40-source.tar.gz"
  version "0.1.10"
  sha256 "cb40dbb085f9e2e554df81c2d8a3fd8b4489990cd2dbf2df278b138797e540d2"
  license "Apache-2.0"
  head "https://github.com/depsilon/shardloom.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "shardloom-cli")
  end

  test do
    assert_match "fallback execution: disabled", shell_output("#{bin}/shardloom status")
  end
end
