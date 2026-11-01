class Shipsmoke < Formula
  desc "Test what users actually download: verify release artifacts run on the target OS"
  homepage "https://github.com/geyutu6755/shipsmoke"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_amd64.tar.gz"
      sha256 "b8df0b8637bbbf53f8765ea9b644a656e4ce983a0d72205c8792ff23462581f0"
    else
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_arm64.tar.gz"
      sha256 "dcfbd45281bdd2a6fb4ed10790b5dcefb9cd2e5da90ac7e4b203dc69927b15b7"
    end
  end
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_amd64.tar.gz"
      sha256 "e2ec130a898226bd8e23c078715953b7045dfe7a7b0803d8a5cbe6c41decbf1b"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_arm64.tar.gz"
      sha256 "847f0c603648d38808277621f4c91e57ed1c95c21a6445e0010eff5bf6ba4caa"
    end
  end

  def install
    bin.install "shipsmoke"
  end

  test do
    assert_match "shipsmoke", shell_output("#{bin}/shipsmoke version")
  end
end
