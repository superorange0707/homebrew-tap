class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.32/project-brain-v1.0.32-macos-arm64.tar.gz"
      sha256 "07711b5b48ee87c5c3176f1d1da243fbd6a8556014c3aad6e37d741700b7bb26"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.32/project-brain-v1.0.32-macos-amd64.tar.gz"
      sha256 "ad27b1eb219314cd38b43902d5bdfaf1599a67e5f784594e166e7761d0be6dd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.32/project-brain-v1.0.32-linux-arm64.tar.gz"
      sha256 "6fb981278c845eb088318d761dc40c079cd8a76f249228d63b011575bdb6dd44"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.32/project-brain-v1.0.32-linux-amd64.tar.gz"
      sha256 "37a62e9df2db0efd6f2bed76aa986a5c696f7b6b1741b3bf3e508679caf740a4"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.32", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
