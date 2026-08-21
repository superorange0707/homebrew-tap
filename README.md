# Homebrew tap for Project Brain

Install [Project Brain](https://github.com/superorange0707/project-brain):

```bash
brew install superorange0707/tap/project-brain
```

Upgrade an existing installation with Homebrew's normal update path:

```bash
brew update
brew upgrade superorange0707/tap/project-brain
```

Then verify the installation:

```bash
brain --version
```

The formula installs checksum-verified `brain`, `codebase-memory-mcp`, and
the pinned `zoekt` / `zoekt-index` executables. It has no Python dependency and
does not compile against the local Xcode toolchain.

Formula releases are built from Project Brain's signed Git tags and pinned by
SHA-256. Project Brain is read-only by default and needs no API key.

Project Brain's release automation updates this formula only after the matching
GitHub Release has successfully published its final artifacts and `SHA256SUMS`.
