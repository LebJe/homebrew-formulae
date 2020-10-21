class LfsPointersTest < Formula
  desc "Tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://lebje.github.io/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
	  tag: "1.0.8"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git"

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
