class Dap < Formula
  desc "CLI debugging tool for AI agents using the Debug Adapter Protocol"
  homepage "https://github.com/AlmogBaku/debug-skill"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-arm64"
      sha256 "6fe8b9f5a51815441dac0ab0fc20cb371b71fe98d4bc0dbc1405a59f785bf028"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-amd64"
      sha256 "eab7e0a8c68df4a519affa65936521704f4e1332d1d6410f7c9b85a7ded17897"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-arm64"
      sha256 "2808f880f64feac00c7462274f85124b6bdee004840d25626a9bfbd8b025129f"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-amd64"
      sha256 "e997dedc2eae47ecc2aab44205d214a4d775b6854b32cff2b5e49b8390312096"
    end
  end

  def install
    binary = Dir["dap-*"].first
    bin.install binary => "dap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dap --version")
  end
end
