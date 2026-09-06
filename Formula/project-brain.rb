class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.12/project-brain-v1.0.12-macos-arm64.tar.gz"
      sha256 "9b43db15f321a839142294ed841ef4a468d14d57080880b6805a3e6e62f59e61"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.12/project-brain-v1.0.12-macos-amd64.tar.gz"
      sha256 "b8c9daf49db473d6f3942efa54de561de77fde7be5d9ff0f67be18ed5479f67a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.12/project-brain-v1.0.12-linux-arm64.tar.gz"
      sha256 "88f59b1058ded03c0bc2c41371955a4eb053e73be9b187ffb8d1462dcfc9f42d"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.12/project-brain-v1.0.12-linux-amd64.tar.gz"
      sha256 "64821ca35e2f750c9cf1abcf32813d90d5e7ca0318c51cb65f76e0199035317b"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.12", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
