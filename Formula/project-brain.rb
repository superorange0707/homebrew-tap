class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.9/project-brain-v1.0.9-macos-arm64.tar.gz"
      sha256 "263717da832b84cde47ba3062934c98db92ce2d9bd760d9184cd97c9d3be09d7"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.7/project-brain-v1.0.7-macos-amd64.tar.gz"
      sha256 "fff81a2450e74bf6ea6f7bed1c5276bb9267fefedaa17129ba732fdafc3baa14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.7/project-brain-v1.0.7-linux-arm64.tar.gz"
      sha256 "de831bacfe1c25830a159abbdfecb9a6b911092844e8da8c1502e9ec2ad900ea"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v1.0.7/project-brain-v1.0.7-linux-amd64.tar.gz"
      sha256 "258464c8f260933a370661a66bdaaf287eda1ca7a068911e0a93473bff96ed10"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp", "zoekt", "zoekt-index"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
    doc.install "ZOEKt_LICENSE", "ZOEKt_VERSION"
  end

  test do
    expected_version = (OS.mac? && Hardware::CPU.arm?) ? "1.0.9" : "1.0.7"
    assert_match "brain #{expected_version}", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
    assert_predicate bin/"zoekt", :executable?
    assert_predicate bin/"zoekt-index", :executable?
  end
end
