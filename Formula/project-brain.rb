class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.1/project-brain-v0.5.1-macos-arm64.tar.gz"
      sha256 "80d30fbf6c6ea127a4c9d9b95b251b18cec830a081232e24391d2f9dc5d41200"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.1/project-brain-v0.5.1-macos-amd64.tar.gz"
      sha256 "3d6100687f9c98db5b515dfdc761fdc1c251b6cd20995a02924118fbe765baf3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.1/project-brain-v0.5.1-linux-arm64.tar.gz"
      sha256 "73457b5a64c6d628d347e1f916c618407516e077d4a00355dd600ea8ebb931a0"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.5.1/project-brain-v0.5.1-linux-amd64.tar.gz"
      sha256 "1fcad7717e724808b288cee00321a26c6b5302ad23ce21985037da561758b46f"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.5.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
