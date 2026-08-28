class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.1/project-brain-v0.9.1-macos-arm64.tar.gz"
      sha256 "0a39dc8da9b0bc85435d5217fd6f31b471a3bb879d761e5dc3ded5ec130c2dda"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.1/project-brain-v0.9.1-macos-amd64.tar.gz"
      sha256 "9c56d0971fe2582de05501ea58e7e6164370ec754e531ef0d90512150830dd13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.1/project-brain-v0.9.1-linux-arm64.tar.gz"
      sha256 "fb399737a8ac85ce4cf74d05c9eda0ca389eb98509b7d72a0743ff53358d6452"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.9.1/project-brain-v0.9.1-linux-amd64.tar.gz"
      sha256 "3d9edc9126181d65bb5a412cb1e0262c866c147ce67be0ead0a253f8a66c77b5"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.9.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
