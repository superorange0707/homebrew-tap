class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.2/project-brain-v0.3.2-macos-arm64.tar.gz"
      sha256 "b00982abe1af4926c9712c8de5a65705b0d4ac3f8179b2bbcbe176a58d4e423c"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.2/project-brain-v0.3.2-macos-amd64.tar.gz"
      sha256 "d38bb437258ae2fd352586d7dcf24e07d41a1dd182235f3b47e42fbe965774f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.2/project-brain-v0.3.2-linux-arm64.tar.gz"
      sha256 "d1d311504c3e5ed84a6dbbf29c3d78906d42b5d732e86310536d9688a25dbf00"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.2/project-brain-v0.3.2-linux-amd64.tar.gz"
      sha256 "298d35d0095b4228c0ac06db365717edf379ec91d1fc7f17c44d26677db9fa8b"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.3.2", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
