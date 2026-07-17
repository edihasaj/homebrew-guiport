class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.49/guiport-0.1.49-macos-universal.tar.gz"
  sha256 "d800838db6ee64dc43619b48c95b376dbfdcbc0865b5bf795fc105728a096f3e"
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

      Trigger the prompts and open the right panes with:

        guiport doctor --fix

      This also registers ~/Applications/guiport.app so macOS shows a real
      guiport app entry in the permission lists.

      Then verify:

        guiport doctor
    EOS
  end

  test do
    assert_match "0.1.49", shell_output("#{bin}/guiport --version")
  end
end
