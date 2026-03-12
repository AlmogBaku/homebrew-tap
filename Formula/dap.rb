class Dap < Formula
  desc "CLI debugging tool for AI agents using the Debug Adapter Protocol"
  homepage "https://github.com/AlmogBaku/debug-skill"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-arm64"
      sha256 "0fd7ecb6692654c689ec1fd7ec6f8a7a9dd4a8252b6d6de1963df0b2817e4f59"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-darwin-amd64"
      sha256 "807156fd9e47bc8ca91bfcabf5f4c382109431f54c52aeb49bc721a6dd72d79c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-arm64"
      sha256 "d437e1b99a59698e9c2e3d5d512fe93690fb3f3f43ab2c8b7f72a2bd8d42f9c9"
    else
      url "https://github.com/AlmogBaku/debug-skill/releases/download/v#{version}/dap-linux-amd64"
      sha256 "92b925efbf8185ace09959cedc0bc23c8e74275b179f7e20287f328e39599426"
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
