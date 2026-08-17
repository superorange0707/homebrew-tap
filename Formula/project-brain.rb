class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.0/project-brain-v0.6.0-macos-arm64.tar.gz"
      sha256 "4ba43063e033c7476af4b82367ec0c3c076586e39810f79678abca9838554755"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.0/project-brain-v0.6.0-macos-amd64.tar.gz"
      sha256 "300349917e1caf2dfda53352157897007995a6b6bffcdb58dd422500aa9b1693"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.0/project-brain-v0.6.0-linux-arm64.tar.gz"
      sha256 "1848e422317d61a80df22b80137b42be0242729638562765fd9f738b7fef1fc4"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.6.0/project-brain-v0.6.0-linux-amd64.tar.gz"
      sha256 "11ec76f3177599ee66535619169fae19fc067bd64d5672112275f8bca74e8f71"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.6.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
