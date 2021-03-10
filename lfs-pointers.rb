class LfsPointers < Formula
  desc "A command line tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://github.com/LebJe/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
    :tag => "4.0.1"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git", :branch => "main"
  
  bottle do
    cellar: :any_skip_relocation
    root_url "https://github.com/LebJe/LFSPointers/releases/download/4.0.1"
    sha256 arm64_big_sur: "96970605d6a22a56fd70ff0eb2de4904cafdb9a487fc6713adc7564d11b6e68c"
    sha256 big_sur: "faf50917ac841889db29d46352117fa5bc77f5860579aba1792132243f2f8968"
  end

  def install
    system "./build.sh"

    system "mv .build/release/LFSPointers ."

    bin.install "LFSPointers"
    
    man1.install "lfs-pointers.1"

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
