class LfsPointers < Formula
  desc "Tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://github.com/LebJe/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
    :tag => "3.0.0"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git", :branch => "main"

  bottle do
    root_url "https://github.com/LebJe/LFSPointers/releases/download/2.0.0"
    cellar :any_skip_relocation
    sha256 "20e78927731c29be71c29ab92bbfdd984449ed9e4f513a91ca147fdcecc609b1" => :big_sur
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
