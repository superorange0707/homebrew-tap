class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.19/project-brain-v1.0.19-macos-arm64.tar.gz"
      sha256 "7bae415f86a4aa2b640c0271d541475ad472700898e8688664e545936270a58d"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.19/project-brain-v1.0.19-macos-amd64.tar.gz"
      sha256 "908927ec6c5c301ccf20354570506823e5bcbfae47a14aedfaa8a09dcb60c368"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.19/project-brain-v1.0.19-linux-arm64.tar.gz"
      sha256 "15cd4423132a4cb55e92be96875a86d92ceaf7c15a4380cd62353cd347014539"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.19/project-brain-v1.0.19-linux-amd64.tar.gz"
      sha256 "3b471f9eff9a501176e5688d53276e046879e628fa26d695b9055e4d6ec9d4c1"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.19", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
