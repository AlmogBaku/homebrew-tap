class Dap < Formula
  desc "CLI debugging tool for AI agents using the Debug Adapter Protocol"
  homepage "https://github.com/AlmogBaku/debug-skill"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-arm64"
      sha256 "57ed35f27870f94511c2b062eae71616200fcbde87f65e8252f56898fd821891"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-amd64"
      sha256 "592dda4031666b29a8c816761476ae1b9b4464f473d60b186ee48e4b680b843b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-arm64"
      sha256 "9de06fbe1bafd7d4fd0110d7e8e8a2fe641c4e44a0d5d87108f510a54ddd6964"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-amd64"
      sha256 "29627be1f61da7911454af77007faa1b6d2cf83e788b77cf8d686ffd1ce055a2"
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
