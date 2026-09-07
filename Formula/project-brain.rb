class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-macos-arm64.tar.gz"
      sha256 "5bab0202cc6fa4455627c918efe6fb35b1554b8564cb4fe17a527b7047f4d262"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-macos-amd64.tar.gz"
      sha256 "5df25256fcb3ef6c795a59a33a62e4d9fd347a96d2255a185b0832f1aac92147"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-linux-arm64.tar.gz"
      sha256 "d3880baf4d662490676f3d2439dd0908a7cd5670bef082c910ca03070b67672b"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.14/project-brain-v1.0.14-linux-amd64.tar.gz"
      sha256 "3fc1601de8741fd45ba40021b33602f3ffbf56ccad84408bf2a034df52457b00"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    assert_match "brain #{version}", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
