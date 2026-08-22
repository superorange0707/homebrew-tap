class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.5/project-brain-v0.6.5-macos-arm64.tar.gz"
      sha256 "a9786da4c3528ac142107ff2444baae7ab45869a52133ddcc62bbb8aece2e89b"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.5/project-brain-v0.6.5-macos-amd64.tar.gz"
      sha256 "4d1673c778203dba9eed4c6dc356f786d681b6c1d767ce8867c1476006e2acd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.5/project-brain-v0.6.5-linux-arm64.tar.gz"
      sha256 "aed1084fc22f050aaf3382b5ff6d57c98fe88697b0393e03034cf4bd5eba5e70"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.5/project-brain-v0.6.5-linux-amd64.tar.gz"
      sha256 "1b2553b152e071e3cd57e45b6ddbc03899abffab0b831baf464a3f08c3d0628b"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.5", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
