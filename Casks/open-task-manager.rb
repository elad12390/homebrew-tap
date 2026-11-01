cask "open-task-manager" do
  version "0.2.1"
  sha256 "ce7a3dcc70e2abbfed24b1113baed8e15b0cbd4d453594be33bc25230e95d2f2"

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
