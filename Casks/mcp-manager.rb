cask "mcp-manager" do
  # The release workflow rewrites these two lines from the tag and the built DMG's checksum, so
  # the placeholders below are only ever what a fresh clone starts with.
  version "0.1.0"
  sha256 "b3c8c6a8625f8345d6ad3e2f4c96789efc44360a0231e1512877d5402347ca74"

  url "https://github.com/31Carlton7/mcp-manager/releases/download/v#{version}/MCPManager-#{version}.dmg"
  name "MCP Manager"
  desc "One library of MCP servers, synced into every MCP client on your Mac"
  homepage "https://github.com/31Carlton7/mcp-manager"

  depends_on macos: ">= :tahoe"

  app "MCPManager.app"

  uninstall launchctl: "co.charmtechnologies.mcpmd",
            quit:      "co.charmtechnologies.mcpmanager"

  zap trash: [
    "~/.mcpm",
    "~/Library/Caches/co.charmtechnologies.mcpmanager",
  ]
end
