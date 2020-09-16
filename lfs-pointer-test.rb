class LfsPointersTest < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://lebje.github.io/LFSPointers"
	url "https://github.com/LebJe/LFSPointers.gitt",
		:tag => "1.0.2"
	head "https://github.com/LebJe/LFSPointers.git"
	sha256 "0793ce7ef26c0a9c577edf40d9da3d86a418aa5b6308e4692112a39f2d0a7304"
	license "MIT"
	depends_on :xcode => :build

	def install
		system "./build.sh"

		system "mv .build/release/LFSPointers ."

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
