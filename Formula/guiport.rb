class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.22/guiport-0.1.22-macos-universal.tar.gz"
  sha256 "fcfdfb61b1fabb50f2b7b6e7665a3060a06b885ff838d5b9f0a6c82fb6b71e20"
  version "0.1.22"
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
    assert_match "0.1.22", shell_output("#{bin}/guiport --version")
  end
end
