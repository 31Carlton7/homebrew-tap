cask "mcp-manager" do
  # The release workflow rewrites these two lines from the tag and the built DMG's checksum, so
  # the placeholders below are only ever what a fresh clone starts with.
  version "0.1.1"
  sha256 "2326ac6f964840fe3bb0ab728eb7245c2438d65fe0a90234dac885aafbd0252d"

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
