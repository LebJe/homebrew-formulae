class LfsPointers < Formula
  desc "Tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://github.com/LebJe/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
    :tag => "1.0.8"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git"

  bottle do
    root_url "https://github.com/LebJe/LFSPointers/releases/download/1.0.7"
    cellar :any_skip_relocation
    rebuild 2
    sha256 "fb4569c7c59fc3e82def38c6692e9a1946fe53194bfb15d102713802a1e9c4f4" => :big_sur
  end

  def install
    system "./build.sh"

    system "mv .build/release/LFSPointers ."

    bin.install "LFSPointers"

    # Completion Scripts.
    # ZSH.
    zshc = `#{bin}/LFSPointers --generate-completion-script zsh`
    File.write("_LFSPointers", zshc)
    zsh_completion.install "_LFSPointers"

    # Bash.
    bashc = `#{bin}/LFSPointers --generate-completion-script bash`
    File.write("LFSPointers.bash", bashc)
    bash_completion.install "LFSPointers.bash"

    # Fish.
    fishc = `#{bin}/LFSPointers --generate-completion-script fish`
    File.write("LFSPointers.fish", fishc)
    fish_completion.install "LFSPointers.fish"
  end

  test do
    system "LFSPointers --help"
  end
end
