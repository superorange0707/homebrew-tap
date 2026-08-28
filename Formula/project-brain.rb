class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.2/project-brain-v0.9.2-macos-arm64.tar.gz"
      sha256 "e5872e4ce01b0363c70c9d2aa9c584d7e4b995b798766cb10a821539ac6b1605"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.2/project-brain-v0.9.2-macos-amd64.tar.gz"
      sha256 "758f719c01fcf3926b47751cf9481e20754abbc9e187575f6b3e68c5ee74ce21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.2/project-brain-v0.9.2-linux-arm64.tar.gz"
      sha256 "086bcb51697c3557a04415509f42318fa7b35e3bad12ee755861230e787309cc"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.2/project-brain-v0.9.2-linux-amd64.tar.gz"
      sha256 "237ed23397f980ddf5356657f14f2d9df093d001780e1919a1a523df49e1cd97"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.9.2", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
