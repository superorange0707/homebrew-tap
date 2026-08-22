class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.7/project-brain-v0.6.7-macos-arm64.tar.gz"
      sha256 "1592471fc593342d0fe229d6d706d1f03b945a27f7d24a9fce3767349ba11897"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.7/project-brain-v0.6.7-macos-amd64.tar.gz"
      sha256 "ad31f809fd8fdd17cbb15c133ab1c0d31221888353180eacd3609e587cc12933"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.7/project-brain-v0.6.7-linux-arm64.tar.gz"
      sha256 "db42ca06f170e2592a598d316203c2722fe19872775ef4811301bab3169525b6"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.7/project-brain-v0.6.7-linux-amd64.tar.gz"
      sha256 "74a08ecd9fd4ea3ffd32d97bbd05264364c8366e4a704a7940b8cb3172e25125"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.7", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
