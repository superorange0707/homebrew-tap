class Msgforge < Formula
  desc "Message simulator for IBM MQ, Kafka, RabbitMQ, MQTT, AMQP, SQS, NATS and HTTP"
  homepage "https://github.com/superorange0707/msgforge"
  url "https://github.com/superorange0707/msgforge/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0063daa98740ff36923af2f162fde8f893a75415011ae787b9d22e617a453c25"
  license "Apache-2.0"

  depends_on "openjdk@17"

  # Built from source on the installing machine: the libraries, IBM's MQ client among them, come from
  # Maven Central there, so nothing that is not open source is redistributed through this tap.
  def install
    ENV["JAVA_HOME"] = Language::Java.java_home("17")
    system "./gradlew", "dist", "--no-daemon", "--console=plain"
    system "unzip", "-q", "build/distributions/msgforge-#{version}.zip", "-d", "dist"
    libexec.install Dir["dist/msgforge-#{version}/*"]

    # What the console saves (connections, scenarios, packs) lives outside the Cellar, so upgrades keep it.
    (bin/"msgforge").write <<~SH
      #!/bin/bash
      data="${MSGFORGE_HOME:-#{var}/msgforge}"
      mkdir -p "$data"
      [ -e "$data/packs" ] || cp -R "#{opt_libexec}/packs" "$data/packs"
      export MSGFORGE_CONFIG="${MSGFORGE_CONFIG:-$data/msgforge.json}"
      export MSGFORGE_PACKS="${MSGFORGE_PACKS:-$data/packs}"
      export MSGFORGE_PLUGINS="${MSGFORGE_PLUGINS:-#{opt_libexec}/plugins}"
      export JAVA_HOME="#{Language::Java.java_home("17")}"
      exec "#{opt_libexec}/bin/msgforge" "$@"
    SH
  end

  def caveats
    <<~EOS
      Start the console and open http://localhost:8585:
        msgforge
      or keep it running in the background:
        brew services start msgforge

      Connections, scenarios and packs are kept in #{var}/msgforge
      (MSGFORGE_HOME changes that). A pipeline runs a saved scenario with:
        msgforge run <scenario> --report msgforge.xml
    EOS
  end

  service do
    run [opt_bin/"msgforge"]
    keep_alive true
    log_path var/"log/msgforge.log"
    error_log_path var/"log/msgforge.log"
  end

  test do
    ENV["MSGFORGE_HOME"] = testpath
    assert_match "No scenarios saved.", shell_output("#{bin}/msgforge list")
    assert_path_exists testpath/"packs/demo/pack.yml"
    assert_match "msgforge run", shell_output("#{bin}/msgforge --help")
  end
end
