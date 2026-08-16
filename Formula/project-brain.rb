class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.1/project-brain-v0.3.1-macos-arm64.tar.gz"
      sha256 "4cd7ed4e9b09f00e338d49133fb6003d08f564bb65fb628a64d65d1d4154c914"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.1/project-brain-v0.3.1-macos-amd64.tar.gz"
      sha256 "2c881d3eaa0aa04a21a2acf4d7e4d3d7bc198d2bd2d931f636f19a4b4dd1575e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.1/project-brain-v0.3.1-linux-arm64.tar.gz"
      sha256 "3353db3e02937dc9f4fb802663f09992b916d4c4cc7c13f255692df454c51110"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.1/project-brain-v0.3.1-linux-amd64.tar.gz"
      sha256 "d3279a30665f1f974c359a48af64f8f7eedf73c2a70a0d9c686519934646ea42"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.3.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
