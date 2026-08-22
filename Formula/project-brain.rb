class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.4/project-brain-v0.6.4-macos-arm64.tar.gz"
      sha256 "b1d50321ff81bbdb4d478ce377ac103487b63fc283a4d83e4f8bf572d73fac47"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.4/project-brain-v0.6.4-macos-amd64.tar.gz"
      sha256 "05a3fcb1ad98a3d70e447e522d7c258338f03f9c202743c6d3522922b3b6bbf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.4/project-brain-v0.6.4-linux-arm64.tar.gz"
      sha256 "be79b9621347b47946a5adb967d41a0580f42dbb65f3a0e6984aec35e6342480"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.4/project-brain-v0.6.4-linux-amd64.tar.gz"
      sha256 "0df4f4ae408a7ece69d6927ef593160aff28cc10a5be7efe04ca076c54a3c0ed"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.4", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
