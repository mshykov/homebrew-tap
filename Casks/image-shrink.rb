cask "image-shrink" do
  version "1.3.0"
  sha256 "e5bae6fe89cea41eca08aea128a06a6d4e10a364b2f5bd9205e3f3654faf9ce2"

  url "https://github.com/mshykov/image-shrink/releases/download/v#{version}/ImageShrink-#{version}.dmg"
  name "Image Shrink"
  desc "Converts images to a JPEG under a size limit, from a hot key or Finder's right-click menu"
  homepage "https://github.com/mshykov/image-shrink"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  # The app ships Sparkle and updates itself, so brew should not fight it over the same bundle:
  # `brew upgrade` leaves it alone, and `--greedy` is there for anyone who wants brew to win.
  auto_updates true

  app "Image Shrink.app"

  # The app installs its own Finder Quick Actions on first launch, so open it once.
  caveats <<~EOS
    Open Image Shrink once after installing: the first launch adds its Quick Actions to
    Finder's right-click menu, binds ⌃⌘J to the instant one and reloads Finder.
  EOS

  uninstall quit: "dev.shykov.imageshrink"

  zap trash: [
    "~/Library/Logs/ImageShrink.log",
    "~/Library/Preferences/dev.shykov.imageshrink.plist",
    "~/Library/Services/Convert to JPEG Now.workflow",
    "~/Library/Services/Convert to JPEG….workflow",
    "~/Library/Services/Convert to JPEG · Email 2 MB.workflow",
    "~/Library/Services/Convert to JPEG · Messenger 500 KB.workflow",
    "~/Library/Services/Convert to JPEG · Web 1 MB.workflow",
  ]
end
