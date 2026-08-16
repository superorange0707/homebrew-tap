class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.0/project-brain-v0.2.0-macos-arm64.tar.gz"
      sha256 "f18a44d936160742b8756b6763cd46800fb20c8dae7a392458fd43ce25071022"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.0/project-brain-v0.2.0-macos-amd64.tar.gz"
      sha256 "a17ae93ba8f13a521337191aaefc5d26593e2dc02038f6d653d319a3e1068944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.0/project-brain-v0.2.0-linux-arm64.tar.gz"
      sha256 "8cd4fede0d83ead8a11ba7a61dd53e714b98d724b52f69803e1f213e0661ff8a"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.0/project-brain-v0.2.0-linux-amd64.tar.gz"
      sha256 "e5817ab1096656b12011ff12f1790f3cfba65405285153f6841c062eb847ccf4"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.2.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
