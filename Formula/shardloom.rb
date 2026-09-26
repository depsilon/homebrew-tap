class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.3.0/shardloom-751126027d3a-source.tar.gz"
  sha256 "bcf7078ae0ce8843c2e8bafeb4fdce21b3ee21ffd4feda336662dd4c13d791da"
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
