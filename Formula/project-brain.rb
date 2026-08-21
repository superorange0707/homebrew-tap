class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.1/project-brain-v0.6.1-macos-arm64.tar.gz"
      sha256 "d8d7447707c7f89de7783ab3a077b620a7001920a48b138c4976bf694c1dcf99"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.1/project-brain-v0.6.1-macos-amd64.tar.gz"
      sha256 "27f3f718dd9e8cffbe90b84aea2ef1701141d083c7ec5926a4177af45a557a4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.1/project-brain-v0.6.1-linux-arm64.tar.gz"
      sha256 "3bb262c0db5b3e17d98442c2f0f9f35bf65558b73f7192f3cdf6f994e69e477d"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.1/project-brain-v0.6.1-linux-amd64.tar.gz"
      sha256 "9816c530da1cc35908ea6cd62a326dbd17c6412eb650ccb9d96410ddace823ab"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
