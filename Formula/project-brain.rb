class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.21/project-brain-v1.0.21-macos-arm64.tar.gz"
      sha256 "4204002bd887f9f1c47313f169a1a6489a9c3a72d1ebef45b530b0aac055a4cc"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.21/project-brain-v1.0.21-macos-amd64.tar.gz"
      sha256 "b3c846b9f009be788ac6950477447252c648ddfd9d04d2ea61cad71b05ef8e58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.21/project-brain-v1.0.21-linux-arm64.tar.gz"
      sha256 "2ff9a3657db3521857ef358f2e8ec9178bcd10efd852b026b204ba1d12221759"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.21/project-brain-v1.0.21-linux-amd64.tar.gz"
      sha256 "dc77cd22722a6399fa8f71829055947fbc7572a9c8200d5c5af3182d63bef80a"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.21", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
