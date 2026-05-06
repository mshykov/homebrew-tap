class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "2a273d09c92087d187a808435c7add0a223eeda64e48ef9b4c450aa0f3ce0838"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "cb51988f6709da5909730f209388c4c8eef3072c6ffcf3c1d14237afd77dc1f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "9bb47c83948dd2b116e63072a57c38e9a47151f43188e7353c4ec3fafc5f21f6"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "58e2c2df3a405d73b62ca2870bcf8db1e936fb16e210f097bdb296224b1bffd0"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
