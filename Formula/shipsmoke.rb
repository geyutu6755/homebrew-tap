class Shipsmoke < Formula
  desc "Test what users actually download: verify release artifacts run on the target OS"
  homepage "https://github.com/geyutu6755/shipsmoke"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_amd64.tar.gz"
      sha256 "8a1fd6d07acebbc799f0fc2b2400757ec002592bd1bd3b36c54f66cde3af6647"
    else
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_darwin_arm64.tar.gz"
      sha256 "09d7989df045ebe43d69026c48a5978efdc4b807213637aeeae8cd1e3f9eab1f"
    end
  end
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_amd64.tar.gz"
      sha256 "f3fc95e2517778ebcc2da7e2a363a6e00591b132a5268a7a8f85fc88d4a6ec67"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/geyutu6755/shipsmoke/releases/download/v#{version}/shipsmoke_linux_arm64.tar.gz"
      sha256 "5f2582d5849d9d0898e40503c8b6d916dbdacf8630e8ae53e5f8761df1d19bd1"
    end
  end

  def install
    bin.install "shipsmoke"
  end

  test do
    assert_match "shipsmoke", shell_output("#{bin}/shipsmoke version")
  end
end
