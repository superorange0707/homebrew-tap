class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.22/project-brain-v1.0.22-macos-arm64.tar.gz"
      sha256 "a2ddeb23a52081c94af3c82be996f5460e7134873c76cf84f7a6bf4453e90dd2"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.22/project-brain-v1.0.22-macos-amd64.tar.gz"
      sha256 "2ccbbd44dfca50e00d541be6fa77342501ed661e22447093470f081989ee2031"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.22/project-brain-v1.0.22-linux-arm64.tar.gz"
      sha256 "63c1a9f45c619bd1f3cbac368f5a25a051e63b084174a23cd52a6139d7dd3c79"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.22/project-brain-v1.0.22-linux-amd64.tar.gz"
      sha256 "6a1690ef36b3262f22c65d036a8c96d4c630bd345d9c730f77d6c56743a22d1a"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.22", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
