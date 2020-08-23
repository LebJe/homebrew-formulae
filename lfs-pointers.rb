class LfsPointers < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://lebje.github.io/LFSPointers"
	url "https://github.com/LebJe/LFSPointers/releases/download/0.12.8/lfspointers-macos-x86_64.tar.gz"
	head "https://github.com/LebJe/LFSPointers.git"
    sha256 "5fdfe6a226a37490970b3c09f6069394e42789f6158451ef218c4d163592eda5"
	license "MIT"
  
	def install
		bin.install "LFSPointers"

		# Completion Scripts.
		# ZSH.
		zshC = %x[#{bin}/LFSPointers --generate-completion-script zsh]
		File.write("_LFSPointers", zshC)
		zsh_completion.install "_LFSPointers"

		# Bash.
		bashC = %x[#{bin}/LFSPointers --generate-completion-script bash]
		File.write("LFSPointers.bash", bashC)
		bash_completion.install "LFSPointers.bash"

		# Fish.
		fishC = %x[#{bin}/LFSPointers --generate-completion-script fish]
        File.write("LFSPointers.fish", fishC)
		fish_completion.install "LFSPointers.fish"
	end
  
	test do
	  system "LFSPointers --help"
	end
  end
