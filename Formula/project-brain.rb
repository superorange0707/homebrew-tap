class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.4/project-brain-v0.5.4-macos-arm64.tar.gz"
      sha256 "1eed13eee196414446dd634ec1d40a8a4577c7891789ea6f8f80c6e023b72a12"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.4/project-brain-v0.5.4-macos-amd64.tar.gz"
      sha256 "cdb62cfa6b4bdc4c42a18a3fac5110e1c57d9491a47074424c7cb07fdaa5ac53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.4/project-brain-v0.5.4-linux-arm64.tar.gz"
      sha256 "574b56709db6e9e7d31930bfe6f797aad739444b3af37a0c28debb5d973a5194"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.4/project-brain-v0.5.4-linux-amd64.tar.gz"
      sha256 "38b737fe5de6ac62c1ac0c8fffdc181382782c973d49b9b82dd492bbdf90eefb"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.5.4", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
