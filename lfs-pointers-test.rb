class LfsPointersTest < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://lebje.github.io/LFSPointers"
	url "https://github.com/LebJe/LFSPointers.git",
		:tag => "0.12.7"
	head "https://github.com/LebJe/LFSPointers.git"
  
	def install
		# Build and Install.
		system "swift build -c release --disable-sandbox"
		system "mv", ".build/release/LFSPointers", "LFSPointers"
		bin.install "LFSPointers"

		# Completion Scripts.

		# ZSH.
		system "LFSPointers", "--generate-completion-script", "zsh", ">", "_LFSPointers"
		zsh_completion.install "_zsh"

		# Bash.
		system "LFSPointers", "--generate-completion-script", "bash", ">", "LFSPointers.bash"
		bash_completion.install "LFSPointers.bash"
	end
  
	test do
	  system "LFSPointers", "--help"
	end
  end
