class Shardloom < Formula
  desc "Vortex-first no-fallback local compute engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v0.2.3/shardloom-79f1ad6d9634-source.tar.gz"
  sha256 "77979e2ef5cae19841706612eb0da71dd4274d17165ef7a74f0fe83bfd6c6b6d"
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
