cask "mcp-manager" do
  # The release workflow rewrites these two lines from the tag and the built DMG's checksum, so
  # the placeholders below are only ever what a fresh clone starts with.
  version "0.1.2"
  sha256 "9c6ff8362b6d37258b488548af4c755c8e60f824cf91d9778bae197a2ff56c2a"

  url "https://github.com/31Carlton7/mcp-manager/releases/download/v#{version}/MCPManager-#{version}.dmg"
  name "MCP Manager"
  desc "One library of MCP servers, synced into every MCP client on your Mac"
  homepage "https://github.com/31Carlton7/mcp-manager"

  # A bare symbol already means "this version or newer"; the ">= :tahoe" string form is
  # deprecated and warns on every install.
  depends_on macos: :tahoe

  app "MCPManager.app"

  uninstall launchctl: "co.charmtechnologies.mcpmd",
            quit:      "co.charmtechnologies.mcpmanager"

  zap trash: [
    "~/.mcpm",
    "~/Library/Caches/co.charmtechnologies.mcpmanager",
  ]
end
