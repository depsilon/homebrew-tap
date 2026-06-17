class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.1.4/shardloom-184ce3161f3a-source.tar.gz"
  version "0.1.4"
  sha256 "47d9a0fa4e1deeb45d226beed01716420a1e9e58976824795bbea115b92fa5da"
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
