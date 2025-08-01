cask "hwsensors" do
  version "6.26.1440"
  sha256 "1ea229bebb1cdfa3b6091cacfd7ab04da781cd6191db9ed08a73eb901aefa418"

  url "https://github.com/kozlekek/HWSensors/releases/download/#{version.major_minor}/HWSensors.#{version}.pkg.zip"
  name "HWSensors"
  desc "Tool to access information from available hardware sensors"
  homepage "https://github.com/kozlekek/HWSensors/"

  no_autobump! because: :requires_manual_review

  disable! date: "2024-12-16", because: :discontinued

  pkg "HWSensors.#{version}.pkg"

  uninstall quit:       "org.hwsensors.HWMonitor",
            login_item: "HWMonitor",
            pkgutil:    "org.hwsensors.HWMonitor"

  zap trash: [
    "~/Library/Application Support/HWMonitor",
    "~/Library/Preferences/org.hwsensors.HWMonitor.plist",
  ]
end
