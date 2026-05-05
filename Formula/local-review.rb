class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "070d185c538fbc63dc351daac38e9ac7c3046ed6397d23d5b6a9268aa6d3be15"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "fa53743213ba5caf4496b02065f3223d19f397c198916899a4bcd6b3f5b1aad4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "676d8f5ddbf5d669213d28b7648ea0aba7ceca3c27e64fbf341b81c94692b383"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "c4d3d1ec803fe79ff50aacdf71a19f72aa1ede1d19982627ced2428e050c85e8"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
