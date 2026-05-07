class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "46ff370051f8ee09778b05a536f12f1adac461b566e9b03d05e22efbfe8901f3"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "cf9b0ac96ab3c0488dfe0323c916338a6a1f16a5fc73bd8e519c773d8dafd634"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "2e29ff4d82df8dee1a385341f9f6a4406a4afa37195b3708cb0ea5f2c612a729"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "95d8ca3c479f2c493dde59f356b19bf29fdd499d0aac56d36bd89fc26a2f6168"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
