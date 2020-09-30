class LfsPointersTest < Formula
  desc "Tool that allows you to convert a directory of large files to Git LFS pointers"
  homepage "https://lebje.github.io/LFSPointers"
  url "https://github.com/LebJe/LFSPointers.git",
	  tag: "1.0.7"
  #sha256 "0793ce7ef26c0a9c577edf40d9da3d86a418aa5b6308e4692112a39f2d0a7304"
  license "MIT"
  head "https://github.com/LebJe/LFSPointers.git"

  bottle do
    root_url "https://github.com/LebJe/LFSPointersTestHomebrewBottle/releases/download/1.0.7"
    cellar :any_skip_relocation
    sha256 "433804c641d3ada9d30e3701ae78f804c3095e404ef95138762ab1a8ac2fa7f2" => :big_sur
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
