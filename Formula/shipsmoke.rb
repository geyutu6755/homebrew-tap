class Shipsmoke < Formula
  desc "Test what users actually download: verify release artifacts run on the target OS"
  homepage "https://github.com/geyutu6755/shipsmoke"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_amd64.tar.gz"
      sha256 "18b372414cad9fc10ec2579a722a4a6b55144e3f3d36a297da975f39d58ff195"
    else
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_arm64.tar.gz"
      sha256 "aa481c6aa67194401cbd23eb938445c0931f84838ef9238198026372bd5dfbcc"
    end
  end
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_amd64.tar.gz"
      sha256 "95f74d362c203c08050c2205927023c11b5b0fb3b7179b52ee2512d8c0290f94"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_arm64.tar.gz"
      sha256 "5ceceace8522e1ea3e04ceddcc4a9f15390b6d2e9e045f82ed5c21cacc42c38b"
    end
  end

  def install
    bin.install "shipsmoke"
  end

  test do
    assert_match "shipsmoke", shell_output("#{bin}/shipsmoke version")
  end
end
