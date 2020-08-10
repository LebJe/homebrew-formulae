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

		# ZSH.
		File.write("_LFSPointers", %x[LFSPointers --generate-completion-script zsh]))
		zsh_completion.install "_LFSPointers"

		# Bash.
		File.write("LFSPointers.bash", %x[LFSPointers --generate-completion-script bash]))
		bash_completion.install "LFSPointers.bash"
	end
  
	test do
		system "LFSPointers", "--help"
	end
  end
