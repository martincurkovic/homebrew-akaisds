cask "akaiutil-gui" do
  arch arm: "arm", intel: "intel"

  version "0.1.0"
  sha256 arm:   "aecd200dbf0a5da75105e13dd8738ca3aca86a6af0adc9485917850449898544",
         intel: "45b664e2595f7e26a502255418bdbaf22023b4991c43428fb3ddfb333343a64d"

  url "https://github.com/martincurkovic/akaiutil-gui/releases/download/v#{version}/akaiutil-GUI-macos-#{arch}.dmg"
  name "akaiutil-GUI"
  desc "GUI for browsing and editing Akai S900/S1000/S3000 sampler disk images"
  homepage "https://github.com/martincurkovic/akaiutil-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "akaiutil-GUI.app"

  caveats <<~EOS
    akaiutil-GUI is not code-signed or notarized by Apple, since it's a free,
    single-maintainer open-source project. macOS Gatekeeper will block it on
    first launch. To open it:

      1. Try to launch akaiutil-GUI from Applications (it will be blocked)
      2. Open System Settings > Privacy & Security
      3. Scroll down and click "Open Anyway" next to the akaiutil-GUI message
      4. Confirm with your password or Touch ID

    It needs macOS 14.4 or newer.

    See https://github.com/martincurkovic/akaiutil-gui#download--installation for details.
  EOS
end
