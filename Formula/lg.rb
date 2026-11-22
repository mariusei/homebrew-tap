# Homebrew Formula for lg
class Lg < Formula
  desc "Modern ls replacement with git status integration and full Unicode support"
  homepage "https://github.com/mariusei/lg"
  url "https://github.com/mariusei/lg/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f9cb2fcb41604a45368f863d36498a964d81176ca7bc23ca2b250ed8f86fdc0b"
  license "MIT"
  head "https://github.com/mariusei/lg.git", branch: "main"

  depends_on "zig" => :build

  def install
    # Build with Zig
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix

    # The binary is installed to prefix/bin/lg
    # Homebrew automatically adds this to PATH via symlinks
  end

  test do
    # Test that lg can run
    assert_match "Usage:", shell_output("#{bin}/lg --help")

    # Test basic functionality
    system bin/"lg"
  end
end
