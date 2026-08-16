cask "project-brain" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "f18a44d936160742b8756b6763cd46800fb20c8dae7a392458fd43ce25071022",
         intel: "a17ae93ba8f13a521337191aaefc5d26593e2dc02038f6d653d319a3e1068944"

  url "https://github.com/superorange0707/project-brain/releases/download/v#{version}/project-brain-v#{version}-macos-#{arch}.tar.gz"
  name "Project Brain"
  desc "Give any chat AI read-only, multi-repository codebase exploration"
  homepage "https://github.com/superorange0707/project-brain"

  binary "brain"
  binary "codebase-memory-mcp"
end
