class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.0/project-brain-v0.9.0-macos-arm64.tar.gz"
      sha256 "14fbf2014ff18c0b56eee2fdc514a0aca2fb59e50b18c52db43783371f1c86f9"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.0/project-brain-v0.9.0-macos-amd64.tar.gz"
      sha256 "415e1810ce3150aa851d6a2a09311371e256fa9c5a1bdea2fad41338e998469d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.0/project-brain-v0.9.0-linux-arm64.tar.gz"
      sha256 "81c42573cd1a1b3e4bdfafc59e630c135d8495039222813a6832f8616e13e21f"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.0/project-brain-v0.9.0-linux-amd64.tar.gz"
      sha256 "5cf9f4a15e0e3d8b8b5f37bfdf4b18f38c645194437095ef9a1cd445366a3a06"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.9.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
