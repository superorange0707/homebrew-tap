class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.0/project-brain-v0.5.0-macos-arm64.tar.gz"
      sha256 "bc6dfd451226c58a96bc7adb69835c0d2720cc12b3b378f4946a5d063993e976"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.0/project-brain-v0.5.0-macos-amd64.tar.gz"
      sha256 "63a9fcd658b4486d9dc7a9c767c497bc6f551f03f40ee41e1f190172664cab91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.0/project-brain-v0.5.0-linux-arm64.tar.gz"
      sha256 "f7592b5e69a03f082a8d0edb6b47e7ef9363fe1844a0a92a18ca2f0a25bc265c"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.0/project-brain-v0.5.0-linux-amd64.tar.gz"
      sha256 "b0885dad6bd6d26a35ec3d7ddb4851a0aa8bad2a0fdbf0059852d467fb70e413"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.5.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
