cask "open-task-manager" do
  version "0.3.0"
  sha256 "64b466e68a269a7c5ff3969e5d75b2bffc316a8e0fc1eb0b43a062b71b6dc98c"

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
