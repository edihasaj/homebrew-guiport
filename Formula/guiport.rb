class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.48/guiport-0.1.48-macos-universal.tar.gz"
  sha256 "fcca43cf887e4ba56a2bf58f4686f50b7e8163c47726e51a069db7ac085ae43e"
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
    assert_match "0.1.48", shell_output("#{bin}/guiport --version")
  end
end
