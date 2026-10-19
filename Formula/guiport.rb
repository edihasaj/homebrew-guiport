class Guiport < Formula
  desc "Playwright for desktop apps, built for coding agents"
  homepage "https://guiport.dev"
  url "https://github.com/edihasaj/guiport/releases/download/v0.1.76/guiport-0.1.76-macos-universal.tar.gz"
  sha256 "46dab46cfaeb2a8d8073dc9e116f65e6d91a12f3cd7e2b35572bdf1ea6081a6f"
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

      Homebrew already runs guiport from its signed app bundle, so this enrolls
      one stable guiport identity in the permission lists.

      Then verify:

        guiport doctor
    EOS
  end

  test do
    assert_match "0.1.76", shell_output("#{bin}/guiport --version")
  end
end
