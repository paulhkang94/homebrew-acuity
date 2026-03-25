cask "acuity" do
  version "0.1.0"
  sha256 :no_check # updated automatically by tap-update.yml on each release

  url "https://github.com/paulhkang94/acuity/releases/download/v#{version}/Acuity-#{version}.zip"
  name "Acuity"
  desc "Native macOS HiDPI scaling for external monitors — no SIP, no private entitlements"
  homepage "https://github.com/paulhkang94/acuity"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Acuity.app"

  # CLI binary is inside the app bundle
  binary "#{appdir}/Acuity.app/Contents/MacOS/acuity", target: "acuity"

  zap trash: [
    "~/Library/Preferences/com.paulkang.acuity.plist",
    "~/Library/Caches/com.paulkang.acuity",
    "~/Library/Logs/acuity.log",
    "/Library/LaunchAgents/com.acuity.agent.plist",
  ]
end
