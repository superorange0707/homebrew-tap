class ProjectBrain < Formula
  include Language::Python::Virtualenv

  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  url "https://github.com/superorange0707/project-brain/releases/download/v0.1.2/project_brain_context-0.1.2.tar.gz"
  sha256 "52b895a54c9c484147310f2e9abc53bd4adb6d6c335bc8148fcbdce74cced352"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "brain 0.1.2", shell_output("#{bin}/brain --version")
  end
end
