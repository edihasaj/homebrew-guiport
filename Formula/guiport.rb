class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.23/guiport-0.1.23-macos-universal.tar.gz"
  sha256 "e16bf2b857ada279f44be0a5649923cf4e6837316e4dae5c753619446efb18fe"
  version "0.1.23"
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
    assert_match "0.1.23", shell_output("#{bin}/guiport --version")
  end
end
