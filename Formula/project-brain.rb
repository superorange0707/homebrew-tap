class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.28/project-brain-v1.0.28-macos-arm64.tar.gz"
      sha256 "05daa545caa90a7bceb37895a5340e0531c51433eee23d8e217940418aed9371"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.28/project-brain-v1.0.28-macos-amd64.tar.gz"
      sha256 "f2e875bfac0dc527f1832c3c8b66c5fb0f53f9daab984656b42e4e6fc78ce597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.28/project-brain-v1.0.28-linux-arm64.tar.gz"
      sha256 "970790f2cd506289ed4443a182b0b9971a6825fa1661645227acf8b226991fde"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.28/project-brain-v1.0.28-linux-amd64.tar.gz"
      sha256 "4c0173d802eab5e0107dad88998580378b143f3a410618434aefbfa0e407b1f2"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.28", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
