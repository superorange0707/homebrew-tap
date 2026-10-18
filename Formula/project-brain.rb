class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.36/project-brain-v1.0.36-macos-arm64.tar.gz"
      sha256 "45de9756a4caf561448ee44d58c7dfb36e0507248b0b5a146b33b665222b33a4"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.36/project-brain-v1.0.36-macos-amd64.tar.gz"
      sha256 "4255c217eb4d9eadcffa62b95075412915a48b614d5e4ea07f405b98d2c06312"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.36/project-brain-v1.0.36-linux-arm64.tar.gz"
      sha256 "08c9d7c8b146deda65eff190f837d34aa12443327781352207ab7da88bb29e8d"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.36/project-brain-v1.0.36-linux-amd64.tar.gz"
      sha256 "c8dcfa05f4e107161a298926e5e325148ecf0b9e215340648121676f31f92a7e"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.36", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
