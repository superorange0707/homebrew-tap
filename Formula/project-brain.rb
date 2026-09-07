class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-macos-arm64.tar.gz"
      sha256 "5bab0202cc6fa4455627c918efe6fb35b1554b8564cb4fe17a527b7047f4d262"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-macos-amd64.tar.gz"
      sha256 "5df25256fcb3ef6c795a59a33a62e4d9fd347a96d2255a185b0832f1aac92147"
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
    assert_match "brain #{version}", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
