class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.10.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "e5f8946d8b9bc45d2f57a8b73ab6d1792cd67f7f4f8da369167c07e0a0c7655a"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "83ed67f648cc99821b13e378d5ff58ffce3f39e9d7dca933a187930d8e84fa1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "428ad19c5c9678370d13293c1ab3cfe1bb10d6a8d06c57f50ef7a99ce8b5904a"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "c448a7aa370ab37c7f0a6a8b272983ddd17fe53d1e5a1f93b4c0b06d889bb91b"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
