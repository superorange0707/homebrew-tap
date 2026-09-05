class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.11/project-brain-v1.0.11-macos-arm64.tar.gz"
      sha256 "66c1c4a5d085b90007e0ac5f1fcf9ffaaaed1b5abdb14e063945306a97140e46"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.11/project-brain-v1.0.11-macos-amd64.tar.gz"
      sha256 "79d65312a3d7a9194a7307c0611490612556b600d46a9c1bc7bd1fd0a3b45958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.11/project-brain-v1.0.11-linux-arm64.tar.gz"
      sha256 "9af54e04dc6db9b8c64a9a21f41bb6b91f1a74e4d2ebbc0f5470929b506d1266"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.11/project-brain-v1.0.11-linux-amd64.tar.gz"
      sha256 "558e8872981e38a9f9118f984ce98f33a03cdccb28608b9d09e8b53957688fca"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.11", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
