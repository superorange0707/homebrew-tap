class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.3/project-brain-v0.5.3-macos-arm64.tar.gz"
      sha256 "d28c0b8ad7834fa22a86f554224bcab6ec7de223409541d83a3c9aa137312da3"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.3/project-brain-v0.5.3-macos-amd64.tar.gz"
      sha256 "78bef586a8fb1bce68e51b9bc002e7082fb9510cbbe53f62a6e2177680a8b949"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.3/project-brain-v0.5.3-linux-arm64.tar.gz"
      sha256 "1ef9459a0a6e0bf9fabcc15b9e363a2f459c9c84b97ecda889c6d10799e13668"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.3/project-brain-v0.5.3-linux-amd64.tar.gz"
      sha256 "f64e81ea4cd29a52c7bad39e08a50a4d1cef635cfb10876d14d809eeef072da0"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.5.3", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
