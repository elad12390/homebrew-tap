cask "open-task-manager" do
  version "0.1.0"
  sha256 "b16f4985a61e68e44a141ddb521406434996985c0303b22040612dd2d80fc13a"

  url "https://github.com/elad12390/open-task-manager/releases/download/v#{version}/OpenTaskManager-#{version}.dmg"
  name "Open Task Manager"
  desc "Native, open-source system monitor for macOS"
  homepage "https://elad12390.github.io/open-task-manager/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Open Task Manager.app"

  # Releases are ad-hoc signed but not notarized; clear the download flag so the app opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Open Task Manager.app"],
                   sudo: false
  end

  zap trash: "~/Library/Application Support/OpenTaskManager"
end
