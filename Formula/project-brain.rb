class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.3/project-brain-v0.6.3-macos-arm64.tar.gz"
      sha256 "cc3ef6bfc8ff076dd9cb41e46ea34c17372feb569313a8b71eca1a0b1fe6af95"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.3/project-brain-v0.6.3-macos-amd64.tar.gz"
      sha256 "c89bdf1d3f70a53255038c76a35ebbe1d06e3bfb02a8a5f8cb9c543b17cbe01a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.3/project-brain-v0.6.3-linux-arm64.tar.gz"
      sha256 "a6f901e09d4cc0fa65758695f88853ac3c74f481401f363aa91e6f265daec32f"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.3/project-brain-v0.6.3-linux-amd64.tar.gz"
      sha256 "c876671300491e20cb7f494031f0a479d1fc75e159193ed2f8618787c19eabe7"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.6.3", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
