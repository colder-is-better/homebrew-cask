cask "megasync" do
  arch arm: "Arm64"

  version "5.14.0.2"
  sha256 :no_check

  url "https://mega.nz/MEGAsyncSetup#{arch}.dmg"
  name "MEGAsync"
  desc "Syncs files between computers and MEGA Cloud drives"
  homepage "https://mega.nz/sync"

  livecheck do
    url "https://github.com/meganz/MEGAsync"
    regex(/^v?(\d+(?:\.\d+)+)[._-]OSX$/i)
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "MEGAsync.app"

  uninstall launchctl:  "mega.mac.megaupdater",
            quit:       "mega.mac",
            login_item: "MEGAsync"

  zap trash: [
    "~/Library/Application Scripts/mega.mac.MEGAShellExtFinder",
    "~/Library/Caches/mega.mac",
    "~/Library/Containers/mega.mac.MEGAShellExtFinder",
    "~/Library/LaunchAgents/mega.mac.megaupdater.plist",
    "~/Library/Preferences/mega.mac.plist",
  ]
end
