class ProjectBrain < Formula
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  version "0.2.1"
  license "MIT"

  bottle do
    root_url "https://github.com/superorange0707/homebrew-tap/releases/download/project-brain-0.2.1"
    rebuild 1
    sha256 cellar:       :any_skip_relocation,
           arm64_sonoma: "b33d214e105b86440fb59e2bcd3440953bd3a24f8adcdd3354d2a7cc2e751ce3",
           sequoia:      "9d8e3aec2b6ca3876ef0a303e7e497eb1f98e7648f6588355014cb61bc5c0668"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.1/project-brain-v0.2.1-macos-arm64.tar.gz"
      sha256 "d60e5e34087cc18cc33505fc6912fa9fd2f6e81fce57dcb02b15fc20fc1c20a8"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.1/project-brain-v0.2.1-macos-amd64.tar.gz"
      sha256 "3c9c8a3f341a43a7910c7fdc67887bebd13f7af15338110011679084b201bd89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.1/project-brain-v0.2.1-linux-arm64.tar.gz"
      sha256 "43dca13afdd0015cb2a30df623f074cf798ecf33f406f1ea511078796b970732"
    else
      url "https://github.com/superorange0707/project-brain/releases/download/v0.2.1/project-brain-v0.2.1-linux-amd64.tar.gz"
      sha256 "77565b684924808f0df1701802dce453bff36ef1ca4e3754124b601ff1a197b7"
    end
  end

  def install
    bin.install "brain", "codebase-memory-mcp"
    doc.install "PROJECT_BRAIN_LICENSE", "CODEBASE_MEMORY_LICENSE", "CODEBASE_MEMORY_THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brain 0.2.1", shell_output("#{bin}/brain --version")
    assert_match "0.10.5", shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
