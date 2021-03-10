class LfsPointers < Formula
  desc "A command line tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://github.com/LebJe/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
    :tag => "4.0.1"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git", :branch => "main"

  bottle do
    root_url "https://github.com/LebJe/LFSPointers/releases/download/4.0.0"
    cellar :any_skip_relocation
    sha256 "41ddc77f2403d2c2949c4e2a81d64627ff4dc2de2cf389168a67011fbd18d3c7" => :big_sur
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
