# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Suds < Formula
  desc "just testing out homebrew tap making"
  homepage "www.rotblauer.com"
  url "https://github.com/rotblauer/suds/releases/download/v0.0.1/suds.tar.gz"
  sha256 "e434ef53eb83b0a3e9c93f0314dc5714b2373513be7c3e5f9f60a39fa094ee84"
  version "v0.0.1"

  # depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/rotblauer/"
    ln_sf buildpath, buildpath/"src/github.com/rotblauer/suds"
    system "go", "build", "-o", "suds", "."
    bin.install "suds"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test suds`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
