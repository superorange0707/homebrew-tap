class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.24/project-brain-v1.0.24-macos-arm64.tar.gz"
      sha256 "7281d6387a24292195f2519fd6e64e384be7da2886bbed8e317c29a52f011b29"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.24/project-brain-v1.0.24-macos-amd64.tar.gz"
      sha256 "15b3de6088328ba48cd018478919309e531260264d5abae49ceadd364e4d3243"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.24/project-brain-v1.0.24-linux-arm64.tar.gz"
      sha256 "2b8c8e3c0c21b54e8f5a4d3e4fc6b840ca8e1b2368a34962778a8b119773a8ee"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.24/project-brain-v1.0.24-linux-amd64.tar.gz"
      sha256 "f45673393c28ea8dff2217b38b88e180d67ccb9db332b37064c01f142515919f"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.24", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
