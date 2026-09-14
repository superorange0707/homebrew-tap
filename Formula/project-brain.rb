class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.27/project-brain-v1.0.27-macos-arm64.tar.gz"
      sha256 "9ec87e8ba4fba329217f9eead3c3b49544a765fd581384bda9ea8b7477213cce"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.27/project-brain-v1.0.27-macos-amd64.tar.gz"
      sha256 "96c0f23b6e3051b6ccb31b937102186399792a44578fb5ba442276c98d493839"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.27/project-brain-v1.0.27-linux-arm64.tar.gz"
      sha256 "ffa3ae20d645cc49bad05e6b142737073022aaad11c3965f6c640ab19cca4b13"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.27/project-brain-v1.0.27-linux-amd64.tar.gz"
      sha256 "76206e62ccb6d4b7c54f7076a44580d044c8e68e849d35280e2e3627742bceb5"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.27", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
