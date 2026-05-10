class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.0/guiport-0.1.0-macos-universal.tar.gz"
  sha256 "04842517eb0adfbdf3daefd5d3750c64cbaeda06d0f1c8a8dc940c76daae643b"
  version "0.1.0"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "guiport"
  end

  def caveats
    <<~EOS
      guiport needs two macOS permissions to function:

        1. Accessibility    — System Settings > Privacy & Security > Accessibility
        2. Screen Recording — System Settings > Privacy & Security > Screen Recording

      Add the terminal app you'll run guiport from (Terminal, iTerm, Ghostty, etc.).

      Trigger the prompts and open the right panes with:

        guiport doctor --fix

      Then verify:

        guiport doctor
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/guiport --version")
  end
end
