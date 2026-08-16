class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.4.1"
  license "MIT"

  bottle do
    root_url "https://github.com/superorange0707/homebrew-tap/releases/download/project-brain-0.4.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "25b94bfa3c338fb7400ab68f2115d627504f1ed9e31246864d62a2033529a392"
    sha256 cellar: :any_skip_relocation, sequoia:      "61e269b9d8083651553553e0c2864a692ef4c801a46c0e8028089ee3777c0896"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.1/project-brain-v0.4.1-macos-arm64.tar.gz"
      sha256 "416b18c087540fa486e03f885dd9bfef2b7b23877aa2b756b8bb81cf99711c01"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.1/project-brain-v0.4.1-macos-amd64.tar.gz"
      sha256 "09d411ed4bb476af2c5903696b89f5d4eea8f788b455ca96b4a4482f2413da5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.1/project-brain-v0.4.1-linux-arm64.tar.gz"
      sha256 "db838b65e2c2416b25568560df76ede5b080631a6f6a317abc11c044648dd2c6"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.4.1/project-brain-v0.4.1-linux-amd64.tar.gz"
      sha256 "d8436fe0b72bbdfa885da97d23600be976e506826d3c8b83c3db38dafde6c128"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.4.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
