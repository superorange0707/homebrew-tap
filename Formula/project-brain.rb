class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.33/project-brain-v1.0.33-macos-arm64.tar.gz"
      sha256 "a08a1e306b7d424c15b7e580ca4b2d5181f0d1442a27e281d199384e60040edf"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.33/project-brain-v1.0.33-macos-amd64.tar.gz"
      sha256 "b816d8bfbb295a213c9541679817a242731d037faf58d3b61b1b671c8a187055"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.33/project-brain-v1.0.33-linux-arm64.tar.gz"
      sha256 "c5dee26d590b6d2d2b13c94b0bb42bd1c4a3e35fd1b7061495feab54f07a1492"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.33/project-brain-v1.0.33-linux-amd64.tar.gz"
      sha256 "2c9f501e0cf2734e717f141bbd29f0d9acaea04dad57485e32502771ac864a66"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.33", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
