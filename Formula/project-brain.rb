class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.4.0"
  license "MIT"

  bottle do
    root_url "https://github.com/superorange0707/homebrew-tap/releases/download/project-brain-0.4.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7a726691e3d7c7f172cefa82cea3c6fd306dc25b67324fdd7a6a133a9e72386e"
    sha256 cellar: :any_skip_relocation, sequoia:      "91042e6efd06e1afe5cfcea3cf5c15e59730ff9b512b053aec29fe51e0c539c8"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.0/project-brain-v0.4.0-macos-arm64.tar.gz"
      sha256 "8726356709646cff1f99ea01173b058feef006cdf74718d8890c5a26388245a2"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.0/project-brain-v0.4.0-macos-amd64.tar.gz"
      sha256 "766c4853decbf7023bbef65b83c5923bae8ad0b0a9c20c620f63f1e0a17306a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.0/project-brain-v0.4.0-linux-arm64.tar.gz"
      sha256 "46ae19acbf958ca20860114d814bdec1b3563c991667ac75b25103fc136ab840"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.0/project-brain-v0.4.0-linux-amd64.tar.gz"
      sha256 "944e572948054df53b92212a194c312027c6aa4b18304bd8592584a5bf052f42"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.4.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
