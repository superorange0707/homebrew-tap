class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.0/project-brain-v0.3.0-macos-arm64.tar.gz"
      sha256 "7e5c376e3d64a991f5b69b94b9ce0800b1156039b7603a3bdb0755577c36db95"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.0/project-brain-v0.3.0-macos-amd64.tar.gz"
      sha256 "f354a9c21774ef96dfbdfb9e735410a016b71a35bdd14060c53faf4f8113b98a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.0/project-brain-v0.3.0-linux-arm64.tar.gz"
      sha256 "69c267f400831d99400d9b16c1f53de9e1c881b415f99b101cfcf50bc16cc14c"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.3.0/project-brain-v0.3.0-linux-amd64.tar.gz"
      sha256 "5181e6ced9d7c9b8d84a18e21c45716150305050a393c46dd3f570e9c346de12"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.3.0", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
