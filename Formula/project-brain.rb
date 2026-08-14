class ProjectBrain < Formula
  include Language::Python::Virtualenv

  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"
  url "https://github.com/superorange0707/project-brain/releases/download/v0.1.1/project_brain_context-0.1.1.tar.gz"
  sha256 "11f6e32a34cda683a0a3b800c94561a8d0f6820d62d4ee89038ffea3aeafc48d"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "brain 0.1.1", shell_output("#{bin}/brain --version")
  end
end
