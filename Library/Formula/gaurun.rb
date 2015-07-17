class Gaurun < Formula
  desc "Gaurun is a general push notification server in Go."
  homepage "https://github.com/mercari/gaurun"

  head "https://github.com/mercari/gaurun.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/mercari/"
    ln_s buildpath, buildpath/"src/github.com/mercari/gaurun"

    ENV["GOPATH"] = buildpath
    ENV.append_path "PATH", "#{ENV["GOPATH"]}/bin"

    # Language::Go.stage_deps resources, buildpath/"src"

    system "make", "gom"
    system "make", "bundle"
    system "make"

    bin.install "bin/gaurun"
    bin.install "bin/gaurun_recover"
  end

  test do
    system "#{bin}/gaurun", "-v"
    system "#{bin}/gaurun_recover", "-v"
  end
end
