class Mqncm < Formula
  desc "CLI for a direct USB network link (CDC-NCM) between a Meta Quest and a Mac"
  homepage "https://github.com/dingyifei/mac-quest-ncm"
  url "https://github.com/dingyifei/mac-quest-ncm/releases/download/v0.1.0/mqncm-0.1.0-macos.zip"
  sha256 "206a3bfbc883585b1a561a2bd9f2faf5e9f696cf793e612fb7d2233286c045d4"
  license "MIT"

  depends_on :macos

  def install
    bin.install "mqncm"
  end

  def caveats
    <<~EOS
      Needs adb: brew install --cask android-platform-tools
      The menu bar app is available as: brew install --cask dingyifei/tap/mac-quest-ncm
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mqncm --version")
  end
end
