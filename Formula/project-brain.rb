class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.23/project-brain-v1.0.23-macos-arm64.tar.gz"
      sha256 "9b08dec890b360f41536bec1954243be437dc58c533279ecb628667f6aa7e832"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.23/project-brain-v1.0.23-macos-amd64.tar.gz"
      sha256 "5b96fda749ccb773cd1021db15e44b74d09a646ce95ac1d34f090af35a8e7088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.23/project-brain-v1.0.23-linux-arm64.tar.gz"
      sha256 "335428e545cedd36f82683722aca6df536bd9575147eaf5964924f157ad67918"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.23/project-brain-v1.0.23-linux-amd64.tar.gz"
      sha256 "7bd4e456d76558406d6252fb118aafb07f25fa2c4efd3f117f6c3125e27eda38"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain 1.0.23", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
