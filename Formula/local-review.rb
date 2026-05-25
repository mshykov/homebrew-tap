class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.10.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "ac84df05af051a1107c33a941f048c472f66aec9115b3915a82f7868324f5be2"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "0f2e07b66a30ec2160822f4cd4d79ec5f4f874f48ee51c2bd2d4cb1d0db3d97e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "93d704d1b3fa0362064097f0bc99ce83994a1fd16d0acea43c57d52b0e692573"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "b63eb4570f72b4fbd07831a1c6b614d36aace61f5aa7c69b0dd5d7c1c03f6d3e"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
