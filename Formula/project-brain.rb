class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.39/project-brain-v1.0.39-macos-arm64.tar.gz"
      sha256 "091553f20d0cfdc8a3e5456cc90bf70fbbb1a4307507a11d294ec3f6fc4b309a"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.39/project-brain-v1.0.39-macos-amd64.tar.gz"
      sha256 "d9d5bfb8cdace12b54e1670037aa83874b3771746c5556c386b8b0dfa2332a2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.39/project-brain-v1.0.39-linux-arm64.tar.gz"
      sha256 "db9fad3695a570aa8b2622a56ef3fa9359a358cd8f1bb0da0c52d4e0972bee94"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.39/project-brain-v1.0.39-linux-amd64.tar.gz"
      sha256 "ef68a641a5fd85087a41cbef87298bec02f45d6f5fddf6a3b52d3686256427ef"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.39", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
