class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.17/project-brain-v1.0.17-macos-arm64.tar.gz"
      sha256 "123968838caeff433af40a8de3d69dd3425de5132a8d6e2232ee0ed8c25e82cb"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.17/project-brain-v1.0.17-macos-amd64.tar.gz"
      sha256 "95755b760f5837e81b2ddca2918b503a95c789cef8ebf113517b7081276e8ccd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.17/project-brain-v1.0.17-linux-arm64.tar.gz"
      sha256 "e96d703e67ac15842e52ee2ab509eef2a3b33f1d97093dbafa776dd2f5b3df90"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.17/project-brain-v1.0.17-linux-amd64.tar.gz"
      sha256 "c5f438347c7c180f035acc5251e00223b85469480b559b84ef663d5d2fab25aa"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.17", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
