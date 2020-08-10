class LfsPointersTest < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://lebje.github.io/LFSPointers"
	url "https://github.com/LebJe/LFSPointers.git",
		:tag => "0.12.7"
	head "https://github.com/LebJe/LFSPointers.git"

	license "MIT"
  
	def install
		# Build and Install.
		system "swift", "build", "-c", "release", "--disable-sandbox"
		system "mv", ".build/release/LFSPointers", "LFSPointers"
		bin.install "LFSPointers"

		# Completion Scripts.

		zshC = %x[#{bin}/LFSPointers --generate-completion-script zsh]

		# ZSH.
		File.write("_LFSPointers", zshC)
		zsh_completion.install "_LFSPointers"

		# Bash.

		bashC = %x[#{bin}/LFSPointers --generate-completion-script bash]

		File.write("LFSPointers.bash", bashC)
		bash_completion.install "LFSPointers.bash"
	end
  
	test do
		system "LFSPointers", "--help"
	end
  end
