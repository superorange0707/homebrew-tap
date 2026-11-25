# superorange0707's Homebrew tap

## Project Brain

Install [Project Brain](https://github.com/superorange0707/project-brain):

```bash
brew install superorange0707/tap/project-brain
```

Upgrade an existing installation from your Project Brain workspace (1.0.36 and
later delegate to Homebrew and restart the local UI for you):

```bash
brain upgrade
```

Or use Homebrew's normal update path:

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

## msgforge

Install [msgforge](https://github.com/superorange0707/msgforge), a message simulator for IBM MQ, Kafka, RabbitMQ, MQTT, AMQP 1.0, Amazon SQS, NATS and HTTP:

```bash
brew install superorange0707/tap/msgforge
```

Then start the console and open http://localhost:8585:

```bash
msgforge
```

or keep it running in the background with `brew services start msgforge`. A pipeline runs a saved scenario with `msgforge run <scenario> --report msgforge.xml`; it exits 0 when it passes.

The formula builds msgforge from its release source on your machine, with OpenJDK 17 from Homebrew; the build fetches its libraries from Maven Central. Connections, scenarios and packs are kept in `$(brew --prefix)/var/msgforge` (or `MSGFORGE_HOME`), so upgrades keep them.
