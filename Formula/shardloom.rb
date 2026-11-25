class Shardloom < Formula
  desc "Unified data processing engine technical preview"
  homepage "https://shardloom.io"
  url "https://github.com/depsilon/shardloom/releases/download/v1.3.0/shardloom-9c6b6f55e727-source.tar.gz"
  sha256 "41bf90afd0e5e870fce9afc060b2c895c2c0fa1f966b43214e447a6222b50e53"
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
