class LocalReview < Formula
  desc "Local, BYOK AI code reviewer with multi-LLM support (no SaaS, no telemetry)"
  homepage "https://github.com/mshykov/local-review"
  version "0.10.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_arm64.tar.gz"
      sha256 "169256401dce2572c0eeabd0b7aecccc534bc427fb78580143a7c78c76d92116"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_darwin_amd64.tar.gz"
      sha256 "ce1a8834b65d7a11457deaf138f9767eead96f762103081e5e516c928a162f69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_arm64.tar.gz"
      sha256 "629538be800b3ed0374822dc51e92ad5b0ba1f764dcb7374350d406ceede053f"
    else
      url "https://github.com/mshykov/local-review/releases/download/v#{version}/local-review_linux_amd64.tar.gz"
      sha256 "159a943959bdb4e1b8e924ef275e898b6d5bce42c07e5e53d358a802af5087f7"
    end
  end

  def install
    bin.install "local-review"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-review version")
  end
end
