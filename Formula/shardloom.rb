class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.6.0/shardloom-936313473fed-source.tar.gz"
  sha256 "bcbabc313d6a54a5fba7ee553795c9f3b9898be3fe8db15517109550ee184bc3"
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
