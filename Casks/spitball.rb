cask "spitball" do
  version "2.3.5"
  sha256 "1c075d62b73d159f7dfb9c76049c2626f02455686093088312916e64bf883aea"

  url "https://github.com/itsnicksimpson/spitball/releases/download/v#{version}/Spitball.zip"
  name "Spitball"
  desc "Free, open-source, on-device voice dictation: double-tap Command and talk"
  homepage "https://itsnicksimpson.github.io/spitball/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Spitball.app"

  zap trash: [
    "~/Library/Application Support/Spitball",
    "~/Library/Preferences/com.nicksimpson.spitball.plist",
  ]

  caveats <<~EOS
    Spitball isn't notarized yet. If macOS says it can't be opened, run:
      xattr -dr com.apple.quarantine /Applications/Spitball.app
    or right-click Spitball in Applications and choose Open.
  EOS
end
