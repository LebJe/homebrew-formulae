class LfsPointersTest < Formula
  desc "Tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://github.com/LebJe/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
    :tag => "1.0.8"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git", :branch => "main"

  bottle do
    root_url "https://github.com/LebJe/LFSPointers/releases/download/1.0.8"
    cellar :any_skip_relocation
    sha256 "2f55b1b0cd83e2b9c6f054eb1d3a938f3dd95e01ef12a718e873e9e088109d62" => :big_sur
  end

  def install
    system "./build.sh"

    system "ln -s .build/release/LFSPointers /usr/local/bin"

    # Completion Scripts.
    # ZSH.
    zshc = `LFSPointers --generate-completion-script zsh`
    File.write("_LFSPointers", zshc)
    zsh_completion.install "_LFSPointers"

    # Bash.
    bashc = `LFSPointers --generate-completion-script bash`
    File.write("LFSPointers.bash", bashc)
    bash_completion.install "LFSPointers.bash"

    # Fish.
    fishc = `LFSPointers --generate-completion-script fish`
    File.write("LFSPointers.fish", fishc)
    fish_completion.install "LFSPointers.fish"
  end

  test do
    system "LFSPointers --help"
  end
end
