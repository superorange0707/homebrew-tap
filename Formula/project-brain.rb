class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.7.0/project-brain-v0.7.0-macos-arm64.tar.gz"
      sha256 "4627057876d757c5e8a9c72f74fb6b10075a21783f066c140a2564af0cb4a99e"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.7.0/project-brain-v0.7.0-macos-amd64.tar.gz"
      sha256 "8d27b59ace39a9fe501244113a6c6a631fae92bd0ccff974bfc08121434b4c3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.7.0/project-brain-v0.7.0-linux-arm64.tar.gz"
      sha256 "03b53667556588851ed3f21d48494d38ed8b1dd7cd0b2a14289f41eee4d45e9b"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.7.0/project-brain-v0.7.0-linux-amd64.tar.gz"
      sha256 "3e5551bfdfd415986a490666c6a70db7156759d3576a89fd8eff5f4efafd531f"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.7.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
