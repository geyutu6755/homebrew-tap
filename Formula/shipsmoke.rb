class Shipsmoke < Formula
  desc "Test what users actually download: verify release artifacts run on the target OS"
  homepage "https://github.com/geyutu6755/shipsmoke"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_amd64.tar.gz"
      sha256 "9b5b76d1868092b36f0c482ee9534632f9c01dc86585e813562891ea9a0379c9"
    else
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_arm64.tar.gz"
      sha256 "d423a12911c850d13e46688da866499020e87b7d9ee861771ed36ffca87dd863"
    end
  end
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_amd64.tar.gz"
      sha256 "d9c31395b8bc64b68dc80f529b8c5f76ce04dcfbcec1ff7312c7c8a7920e5d56"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_arm64.tar.gz"
      sha256 "740cb1298b1c833db5f37549d300b70582869a9ba92e7a0b781e7ba2c94e178b"
    end
  end

  def install
    bin.install "shipsmoke"
  end

  test do
    assert_match "shipsmoke", shell_output("#{bin}/shipsmoke version")
  end
end
