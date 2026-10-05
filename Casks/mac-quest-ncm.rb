cask "mac-quest-ncm" do
  version "0.1.0"
  sha256 "c4b3149e486359f0bae5cf495f9092f37607132f5b7cd06f6d8d5fc913a2d0f9"

  url "https://github.com/dingyifei/mac-quest-ncm/releases/download/v#{version}/Mac-Quest-NCM-#{version}.zip"
  name "Mac-Quest-NCM"
  desc "Direct USB network link (CDC-NCM) between a Meta Quest and a Mac"
  homepage "https://github.com/dingyifei/mac-quest-ncm"

  depends_on macos: ">= :sequoia"

  app "Mac-Quest-NCM.app"
  binary "#{appdir}/Mac-Quest-NCM.app/Contents/Resources/mqncm"

  uninstall quit: "com.dingyifei.MacQuestNCM"

  zap trash: [
    "/Library/Application Support/Mac-Quest-NCM",
    "~/Library/Preferences/com.dingyifei.MacQuestNCM.plist",
  ]

  caveats <<~EOS
    Needs adb (brew install --cask android-platform-tools) and a Quest in developer mode.
    The first time the Quest switches to NCM, click "Allow" on macOS's accessory prompt.
  EOS
end
