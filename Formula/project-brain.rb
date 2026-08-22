class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.6/project-brain-v0.6.6-macos-arm64.tar.gz"
      sha256 "3b1959f09ffa4221f1ee8d50cc1df2f10dff299159109ed350e66d5b4a257b7d"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.6/project-brain-v0.6.6-macos-amd64.tar.gz"
      sha256 "dd89286e6862a1431ad1b79c87fa125cd13aaf0e9c90e994b048741ce21fef9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.6/project-brain-v0.6.6-linux-arm64.tar.gz"
      sha256 "0ee27596bddce976570598c929364263221aac27f6896995147630709181fa7b"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.6/project-brain-v0.6.6-linux-amd64.tar.gz"
      sha256 "14c10ad577db8163228cf5e141964c7bb2716ff767e256472c12d298001c1534"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.6", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
