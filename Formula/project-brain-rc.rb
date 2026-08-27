class ProjectBrainRc < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"
  version "0.8.0-rc2"
  conflicts_with "project-brain", because: "both install the brain executable"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.8.0-rc2/project-brain-v0.8.0-rc2-macos-arm64.tar.gz"
      sha256 "6ba91533a77b593a00b1e8f644823607e4f83658f49b658db74b7ae00e4a3f82"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.8.0-rc2/project-brain-v0.8.0-rc2-macos-amd64.tar.gz"
      sha256 "5bf9a6e6ea3e63c307693062f98c92b818255d1909e2ef88af0a4b4c2c7a8789"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.8.0-rc2/project-brain-v0.8.0-rc2-linux-arm64.tar.gz"
      sha256 "eee478138dbe3910850c5b53b948039077a149a1eac9e6c32e4bfebf6e038618"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.8.0-rc2/project-brain-v0.8.0-rc2-linux-amd64.tar.gz"
      sha256 "8020f4069e2fe9e42e03f45180b7f96b00f26b21ad46332ff274b0169447f2bb"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 0.8.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
