class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.1.8/shardloom-7fad4188e9d6-source.tar.gz"
  version "0.1.8"
  sha256 "809cdd78b93bb47e7a85f322a0e811c18452f3bcccb91c5f4dc36bcb9dce9c98"
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
