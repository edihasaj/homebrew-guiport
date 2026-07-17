class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.47/guiport-0.1.47-macos-universal.tar.gz"
  sha256 "f7000861b3588cb5392a1cfe8e7f012313aec14216c3d6981d6ea7fb60132333"
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
    assert_match "0.1.47", shell_output("#{bin}/guiport --version")
  end
end
