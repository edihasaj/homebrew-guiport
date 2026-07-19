class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.57/guiport-0.1.57-macos-universal.tar.gz"
  sha256 "61cf3456e1ae96a1aca9b7216d30206ddf28e4ce3e1c5a353673a67a3e5aa688"
  license "MIT"

  depends_on macos: :ventura

  def install
    # Ship + run from the signed guiport.app so macOS shows the real logo in
    # the Privacy panes and the TCC grant survives upgrades (guiport issue #4).
    prefix.install "guiport.app"
    bin.install_symlink prefix/"guiport.app/Contents/MacOS/guiport" => "guiport"
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
    assert_match "0.1.57", shell_output("#{bin}/guiport --version")
  end
end
